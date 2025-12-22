part of 'notifications_bloc.dart';

class NotificationsState extends Equatable {
  /// get notifications state
  final RequestState getNotificationsState;
  final BaseResponse<List<NotificationsModel>> getNotificationsResponse;
  final GetNotificationsParameters getNotificationsParameters;

  /// read notification state
  final RequestState readNotificationState;
  final BaseResponse<int> readNotificationResponse;

  /// read all notifications state
  final RequestState readAllNotificationsState;
  final BaseResponse readAllNotificationsResponse;

  const NotificationsState({
    /// get notifications
    this.getNotificationsState = RequestState.loading,
    this.getNotificationsResponse = const BaseResponse(),
    this.getNotificationsParameters = const GetNotificationsParameters(
      filter: 'all',
    ),

    /// read notifications
    this.readNotificationState = RequestState.initial,
    this.readNotificationResponse = const BaseResponse(),

    /// read all notifications
    this.readAllNotificationsState = RequestState.initial,
    this.readAllNotificationsResponse = const BaseResponse(),
  });

  NotificationsState copyWith({
    /// get notifications state
    RequestState? getNotificationsState,
    BaseResponse<List<NotificationsModel>>? getNotificationsResponse,
    GetNotificationsParameters? getNotificationsParameters,

    /// read notification state
    RequestState readNotificationState = RequestState.initial,
    BaseResponse<int>? readNotificationResponse,

    /// read all notifications state
    RequestState readAllNotificationsState = RequestState.initial,
    BaseResponse? readAllNotificationsResponse,
  }) {
    return NotificationsState(
      /// get notifications state
      getNotificationsState:
          getNotificationsState ?? this.getNotificationsState,
      getNotificationsResponse:
          getNotificationsResponse ?? this.getNotificationsResponse,
      getNotificationsParameters:
          getNotificationsParameters ?? this.getNotificationsParameters,

      /// read notification state
      readNotificationState: readNotificationState,
      readNotificationResponse:
          readNotificationResponse ?? this.readNotificationResponse,

      /// read all notifications state
      readAllNotificationsState: readAllNotificationsState,
      readAllNotificationsResponse:
          readAllNotificationsResponse ?? this.readAllNotificationsResponse,
    );
  }

  @override
  List<Object> get props => [
    /// get notifications state
    getNotificationsState,
    getNotificationsResponse,
    getNotificationsParameters,

    /// read notification state
    readNotificationState,
    readNotificationResponse,

    /// read all notifications state
    readAllNotificationsState,
    readAllNotificationsResponse,
  ];
}
