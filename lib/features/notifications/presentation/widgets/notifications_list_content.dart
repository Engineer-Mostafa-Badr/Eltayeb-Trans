import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/components/screen_status/empty_widget.dart';
import '../../../../core/components/screen_status/loading_widget.dart';
import '../../../../core/components/widgets/custom_elevated_button.dart';
import '../../../../core/enum/enums.dart';
import '../../../../core/utils/app_sizes.dart';
import '../../../../core/extensions/widgets_extensions.dart';
import '../widgets/notification_card.dart';
import '../bloc/notifications_bloc.dart';
import '../../data/models/notifications_model.dart';
import '../mappers/notification_mapper.dart';

class NotificationsListContent extends StatelessWidget {
  final List<NotificationsModel> notifications;
  final RequestState state;
  final String? errorMessage;
  final bool isLoadingMore;
  final ScrollController scrollController;
  final VoidCallback onLoadMore;

  const NotificationsListContent({
    super.key,
    required this.notifications,
    required this.state,
    this.errorMessage,
    this.isLoadingMore = false,
    required this.scrollController,
    required this.onLoadMore,
  });

  @override
  Widget build(BuildContext context) {
    if (state == RequestState.loading && notifications.isEmpty) {
      return const LoadingWidget();
    }

    if (state == RequestState.error && notifications.isEmpty) {
      return _buildErrorState(context);
    }

    if (notifications.isEmpty) {
      return const EmptyBody(text: 'لا توجد إشعارات');
    }

    return _buildNotificationsList(context);
  }

  Widget _buildErrorState(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline, size: 48, color: Colors.red),
          const SizedBox(height: 16),
          Text(
            errorMessage ?? 'حدث خطأ في تحميل الإشعارات',
            style: const TextStyle(color: Colors.grey, fontSize: 16),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          CustomElevatedButton(
            text: 'إعادة المحاولة',
            onPressed: () {
              context.read<NotificationsBloc>().add(
                const NotificationsFetchEvent(),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationsList(BuildContext context) {
    final appNotifications = notifications
        .map((n) => n.toAppNotification())
        .toList();

    return ListView.separated(
      controller: scrollController,
      padding: const EdgeInsets.only(top: 16),
      itemCount: appNotifications.length + (isLoadingMore ? 1 : 0),
      separatorBuilder: (_, _) => AppPadding.padding10.sizedHeight,
      itemBuilder: (context, index) {
        if (index == appNotifications.length) {
          return const Center(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: CircularProgressIndicator(),
            ),
          );
        }

        final item = appNotifications[index];
        return GestureDetector(
          onTap: () => _handleNotificationTap(context, item),
          child: NotificationCard(notification: item),
        );
      },
    );
  }

  void _handleNotificationTap(BuildContext context, AppNotification item) {
    if (!item.isRead) {
      context.read<NotificationsBloc>().add(ReadNotificationEvent(item.id));
    }
  }
}
