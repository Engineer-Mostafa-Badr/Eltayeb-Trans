import 'package:dartz/dartz.dart';
import 'package:eltyp_delivery/core/api/dio/base_response.dart';
import 'package:eltyp_delivery/core/api/error/failures.dart';
import 'package:eltyp_delivery/core/usecase/base_use_case.dart';
import 'package:eltyp_delivery/features/notifications/data/models/notifications_model.dart';

abstract class BaseNotificationsRepository {
  Future<Either<Failure, BaseResponse<List<NotificationsModel>>>>
  getNotifications(PaginationParameters parameters);

  Future<Either<Failure, BaseResponse<int>>> readNotifications(
    int notificationId,
  );

  Future<Either<Failure, BaseResponse>> readAllNotifications();
}
