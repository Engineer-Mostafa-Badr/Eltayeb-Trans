part of 'notifications_bloc.dart';

sealed class NotificationsEvent extends Equatable {
  const NotificationsEvent();
}

class NotificationsFetchEvent extends NotificationsEvent {
  final PaginationParameters params;

  const NotificationsFetchEvent({this.params = const PaginationParameters()});

  @override
  List<Object> get props => [];
}

class ReadNotificationEvent extends NotificationsEvent {
  final int notificationId;

  const ReadNotificationEvent(this.notificationId);

  @override
  List<Object> get props => [notificationId];
}

class ReadAllNotificationsEvent extends NotificationsEvent {
  const ReadAllNotificationsEvent();

  @override
  List<Object> get props => [];
}
