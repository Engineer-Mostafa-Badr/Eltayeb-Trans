import 'package:flutter/material.dart';
import '../bloc/notifications_bloc.dart';
import '../../../../core/enum/enums.dart';

/// Handles BLoC listener callbacks for notifications page
class NotificationsListenerHandler {
  static void handleStateChanges(
    BuildContext context,
    NotificationsState state,
  ) {
    _handleFetchErrors(context, state);
    _handleReadErrors(context, state);
    _handleReadAllErrors(context, state);
  }

  static void _handleFetchErrors(
    BuildContext context,
    NotificationsState state,
  ) {
    if (state.getNotificationsState == RequestState.error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            state.getNotificationsResponse.msg ?? 'حدث خطأ في تحميل الإشعارات',
            style: const TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.red,
          duration: const Duration(seconds: 3),
        ),
      );
    }
  }

  static void _handleReadErrors(
    BuildContext context,
    NotificationsState state,
  ) {
    if (state.readNotificationState == RequestState.error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            state.readNotificationResponse.msg ?? 'حدث خطأ في قراءة الإشعار',
            style: const TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.red,
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }

  static void _handleReadAllErrors(
    BuildContext context,
    NotificationsState state,
  ) {
    if (state.readAllNotificationsState == RequestState.error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            state.readAllNotificationsResponse.msg ??
                'حدث خطأ في قراءة جميع الإشعارات',
            style: const TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.red,
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }
}
