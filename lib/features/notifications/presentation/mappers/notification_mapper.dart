import '../../../../core/enum/enums.dart';
import '../../data/models/notifications_model.dart';
import '../widgets/notification_card.dart';
import '../../../../core/utils/date_time_formatter.dart';

extension NotificationMapper on NotificationsModel {
  AppNotification toAppNotification() {
    return AppNotification(
      id: id,
      title: title,
      body: title, // API doesn't provide separate body
      timeLabel: createdAtHuman.isNotEmpty
          ? createdAtHuman
          : createdAt.toRelativeTimeLabel(),
      type: _mapNotificationType(type),
      isRead: seenAt.isNotEmpty,
    );
  }

  NotificationType _mapNotificationType(String type) {
    switch (type.toLowerCase()) {
      case 'trip':
      case 'trips':
        return NotificationType.trip;
      case 'maintenance':
        return NotificationType.maintenance;
      case 'expense':
      case 'expenses':
        return NotificationType.expense;
      default:
        return NotificationType.appUpdate;
    }
  }
}

