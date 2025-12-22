import 'package:dartz/dartz.dart';
import 'package:eltyp_delivery/core/api/dio/base_response.dart';
import 'package:eltyp_delivery/core/api/error/failures.dart';
import 'package:eltyp_delivery/features/notifications/data/models/notifications_model.dart';
import 'package:eltyp_delivery/features/notifications/domain/use_cases/get_notifications_usecase.dart';

abstract class BaseNotificationsRepository {
  Future<Either<Failure, BaseResponse<List<NotificationsModel>>>>
  getNotifications(GetNotificationsParameters parameters);

  Future<Either<Failure, BaseResponse<int>>> readNotifications(
    int notificationId,
  );

  Future<Either<Failure, BaseResponse>> readAllNotifications();
}
