import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/enum/enums.dart';
import '../bloc/notifications_bloc.dart';
import 'package:flutter/material.dart';

/// Handles scroll-based pagination for notifications
class NotificationsScrollListener {
  final ScrollController scrollController;
  final BuildContext blocContext;

  NotificationsScrollListener({
    required this.scrollController,
    required this.blocContext,
  }) {
    scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (!scrollController.hasClients) return;

    final position = scrollController.position;
    if (position.pixels >= position.maxScrollExtent * 0.8) {
      final state = blocContext.read<NotificationsBloc>().state;
      final pagination = state.getNotificationsResponse.pagination;

      if (_canLoadMore(state, pagination)) {
        blocContext.read<NotificationsBloc>().add(
          NotificationsFetchEvent(
            params: state.getNotificationsParameters.copyWith(
              page: pagination!.currentPage + 1,
            ),
          ),
        );
      }
    }
  }

  bool _canLoadMore(NotificationsState state, dynamic pagination) {
    return pagination != null &&
        pagination.currentPage < pagination.lastPage &&
        state.getNotificationsState == RequestState.loaded;
  }

  void dispose() {
    scrollController.removeListener(_onScroll);
  }
}
