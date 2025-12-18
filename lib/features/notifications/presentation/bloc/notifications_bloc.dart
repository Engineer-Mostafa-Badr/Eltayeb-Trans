import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eltyp_delivery/core/api/dio/base_response.dart';
import 'package:eltyp_delivery/core/enum/enums.dart';
import 'package:eltyp_delivery/core/usecase/base_use_case.dart';
import 'package:eltyp_delivery/features/notifications/data/models/notifications_model.dart';
import 'package:eltyp_delivery/features/notifications/domain/use_cases/get_notifications_usecase.dart';
import 'package:eltyp_delivery/features/notifications/domain/use_cases/read_all_notifications_usecase.dart';
import 'package:eltyp_delivery/features/notifications/domain/use_cases/read_notifications_usecase.dart';

part 'notifications_event.dart';
part 'notifications_state.dart';

class NotificationsBloc extends Bloc<NotificationsEvent, NotificationsState> {
  static NotificationsBloc get(BuildContext context) =>
      BlocProvider.of<NotificationsBloc>(context);

  NotificationsBloc(
    this.getNotificationsUseCase,
    this.readNotificationsUseCase,
    this.readAllNotificationsUseCase,
  ) : super(const NotificationsState()) {
    on<NotificationsFetchEvent>(_onNotificationsFetchEvent);
    on<ReadNotificationEvent>(_onReadNotificationEvent);
    on<ReadAllNotificationsEvent>(_onReadAllNotificationsEvent);
  }

  final GetNotificationsUseCase getNotificationsUseCase;
  final ReadNotificationsUseCase readNotificationsUseCase;
  final ReadAllNotificationsUseCase readAllNotificationsUseCase;

  FutureOr<void> _onNotificationsFetchEvent(
    NotificationsFetchEvent event,
    Emitter<NotificationsState> emit,
  ) async {
    emit(state.copyWith(getNotificationsState: RequestState.loading));

    final result = await getNotificationsUseCase(event.params);
    result.fold(
      (failure) {
        emit(
          state.copyWith(
            getNotificationsState: RequestState.error,
            getNotificationsResponse: state.getNotificationsResponse.copyWith(
              status: false,
              msg: failure.message,
            ),
          ),
        );
      },
      (data) {
        emit(
          state.copyWith(
            getNotificationsState: RequestState.loaded,
            getNotificationsResponse: data.copyWith(
              data:
                  state.getNotificationsResponse.data != null &&
                      event.params.page > 1
                  ? [...state.getNotificationsResponse.data!, ...data.data!]
                  : data.data,
              pagination: data.pagination,
            ),
          ),
        );
      },
    );
  }

  FutureOr<void> _onReadNotificationEvent(
    ReadNotificationEvent event,
    Emitter<NotificationsState> emit,
  ) async {
    emit(
      state.copyWith(
        getNotificationsState: RequestState.loading,
        readNotificationState: RequestState.loading,
      ),
    );

    final result = await readNotificationsUseCase(event.notificationId);
    result.fold(
      (failure) {
        emit(
          state.copyWith(
            getNotificationsState: RequestState.loaded,
            readNotificationState: RequestState.error,
            readNotificationResponse: state.readNotificationResponse.copyWith(
              status: false,
              msg: failure.message,
            ),
          ),
        );
      },
      (data) {
        final newGetNotificationsResponse = state.getNotificationsResponse
            .copyWith(
              data: state.getNotificationsResponse.data?.map((notification) {
                if (notification.id == event.notificationId) {
                  return notification.copyWith(
                    seenAt: DateTime.now().toString(),
                  );
                }
                return notification;
              }).toList(),
            );
        emit(
          state.copyWith(
            readNotificationState: RequestState.loaded,
            readNotificationResponse: data,
            getNotificationsState: RequestState.loaded,
            getNotificationsResponse: newGetNotificationsResponse,
          ),
        );
      },
    );
  }

  FutureOr<void> _onReadAllNotificationsEvent(
    ReadAllNotificationsEvent event,
    Emitter<NotificationsState> emit,
  ) async {
    emit(
      state.copyWith(
        getNotificationsState: RequestState.loading,
        readAllNotificationsState: RequestState.loading,
      ),
    );

    final result = await readAllNotificationsUseCase(const NoParameters());
    result.fold(
      (failure) {
        emit(
          state.copyWith(
            getNotificationsState: RequestState.loaded,
            readAllNotificationsState: RequestState.error,
            readAllNotificationsResponse: state.readAllNotificationsResponse
                .copyWith(status: false, msg: failure.message),
          ),
        );
      },
      (data) {
        final newGetNotificationsResponse = state.getNotificationsResponse
            .copyWith(
              data: state.getNotificationsResponse.data?.map((notification) {
                return notification.copyWith(seenAt: DateTime.now().toString());
              }).toList(),
            );
        emit(
          state.copyWith(
            readAllNotificationsState: RequestState.loaded,
            readAllNotificationsResponse: data,
            getNotificationsState: RequestState.loaded,
            getNotificationsResponse: newGetNotificationsResponse,
          ),
        );
      },
    );
  }
}
