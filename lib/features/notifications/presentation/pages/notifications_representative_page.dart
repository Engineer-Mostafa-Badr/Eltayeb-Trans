import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eltyp_delivery/features/injection_container.dart' as di;
import '../../../../core/utils/app_sizes.dart';
import '../../../../core/enum/enums.dart';
import '../bloc/notifications_bloc.dart';
import '../widgets/notifications_representative_header.dart';
import '../widgets/notifications_list_content.dart';
import '../widgets/notifications_scroll_listener.dart';
import '../widgets/notifications_listener_handler.dart';

class NotificationsRepresentativePage extends StatefulWidget {
  const NotificationsRepresentativePage({super.key});

  @override
  State<NotificationsRepresentativePage> createState() =>
      _NotificationsRepresentativePageState();
}

class _NotificationsRepresentativePageState
    extends State<NotificationsRepresentativePage> {
  late final ScrollController _scrollController;
  NotificationsScrollListener? _scrollListener;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollListener?.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          di.sl<NotificationsBloc>()..add(const NotificationsFetchEvent()),
      child: BlocConsumer<NotificationsBloc, NotificationsState>(
        listener: (context, state) {
          NotificationsListenerHandler.handleStateChanges(context, state);
        },
        builder: (context, state) {
          _initializeScrollListener(context);

          final notifications = state.getNotificationsResponse.data ?? [];
          final isLoadingMore =
              state.getNotificationsState == RequestState.loading &&
              notifications.isNotEmpty;

          return Column(
            children: [
              const NotificationsRepresentativeHeader(),
              Expanded(
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppPadding.padding24,
                    ),
                    child: NotificationsListContent(
                      notifications: notifications,
                      state: state.getNotificationsState,
                      errorMessage: state.getNotificationsResponse.msg,
                      isLoadingMore: isLoadingMore,
                      scrollController: _scrollController,
                      onLoadMore: () {
                        final pagination =
                            state.getNotificationsResponse.pagination;
                        if (pagination != null &&
                            pagination.currentPage < pagination.lastPage) {
                          context.read<NotificationsBloc>().add(
                            NotificationsFetchEvent(
                              params: state.getNotificationsParameters.copyWith(
                                page: pagination.currentPage + 1,
                              ),
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  void _initializeScrollListener(BuildContext context) {
    _scrollListener ??= NotificationsScrollListener(
      scrollController: _scrollController,
      blocContext: context,
    );
  }
}
