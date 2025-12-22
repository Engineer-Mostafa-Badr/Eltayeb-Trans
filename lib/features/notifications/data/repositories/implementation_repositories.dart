import 'package:dartz/dartz.dart';
import 'package:eltyp_delivery/core/api/dio/base_response.dart';
import 'package:eltyp_delivery/core/api/error/exceptions.dart';
import 'package:eltyp_delivery/core/api/error/failures.dart';
import 'package:eltyp_delivery/features/notifications/data/data_sources/remote/remote_data_source.dart';
import 'package:eltyp_delivery/features/notifications/data/models/notifications_model.dart';
import 'package:eltyp_delivery/features/notifications/domain/repositories/base_notifications_repo.dart';
import 'package:eltyp_delivery/features/notifications/domain/use_cases/get_notifications_usecase.dart';

class NotificationsRepositoryImpl implements BaseNotificationsRepository {
  final NotificationsRemoteDataSource remoteDataSource;

  NotificationsRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, BaseResponse<List<NotificationsModel>>>>
  getNotifications(GetNotificationsParameters parameters) async {
    try {
      final response = await remoteDataSource.getNotifications(parameters);
      return Right(response);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, BaseResponse<int>>> readNotifications(
    int notificationId,
  ) async {
    try {
      final response = await remoteDataSource.readNotifications(notificationId);
      return Right(response);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, BaseResponse>> readAllNotifications() async {
    try {
      final response = await remoteDataSource.readAllNotifications();
      return Right(response);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
