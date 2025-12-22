import 'package:eltyp_delivery/core/api/dio/api_consumer.dart';
import 'package:eltyp_delivery/core/api/dio/base_response.dart';
import 'package:eltyp_delivery/core/api/dio/end_points.dart';
import 'package:eltyp_delivery/core/api/dio/status_code.dart';
import 'package:eltyp_delivery/core/api/error/exceptions.dart';
import 'package:eltyp_delivery/features/notifications/data/models/notifications_model.dart';
import 'package:eltyp_delivery/features/notifications/domain/use_cases/get_notifications_usecase.dart';

abstract class BaseNotificationsRemoteDataSource {
  Future<BaseResponse<List<NotificationsModel>>> getNotifications(
    GetNotificationsParameters parameters,
  );

  Future<BaseResponse<int>> readNotifications(int notificationId);

  Future<BaseResponse> readAllNotifications();
}

class NotificationsRemoteDataSource extends BaseNotificationsRemoteDataSource {
  final ApiConsumer _apiConsumer;

  NotificationsRemoteDataSource(this._apiConsumer);

  @override
  Future<BaseResponse<List<NotificationsModel>>> getNotifications(
    GetNotificationsParameters parameters,
  ) async {
    try {
      final response = await _apiConsumer.get(
        EndPoints.employeeNotifications,
        authenticated: true,
        queryParameters: parameters.toJson(),
      );

      if (StatusCode.isSuccessful(response)) {
        return BaseResponse<List<NotificationsModel>>(
          status: response.data[BaseResponse.statusKey],
          data: (response.data[BaseResponse.dataKey] as List)
              .map((e) => NotificationsModel.fromJson(e))
              .toList(),
          pagination: PaginationModel.fromJson(
            response.data[BaseResponse.paginationKey],
          ),
          msg: response.data[BaseResponse.msgKey],
        );
      } else {
        throw ServerException(message: StatusCode.errorMessage(response));
      }
    } catch (e) {
      if (e is ServerException) {
        rethrow;
      }
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<BaseResponse<int>> readNotifications(int notificationId) async {
    try {
      final response = await _apiConsumer.get(
        EndPoints.showNotifications(notificationId),
        authenticated: true,
      );
      if (StatusCode.isSuccessful(response)) {
        return BaseResponse<int>(
          status: response.data[BaseResponse.statusKey],
          msg: response.data[BaseResponse.msgKey],
          data: notificationId,
        );
      } else {
        throw ServerException(message: StatusCode.errorMessage(response));
      }
    } catch (e) {
      if (e is ServerException) {
        rethrow;
      }
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<BaseResponse> readAllNotifications() async {
    try {
      final response = await _apiConsumer.post(
        EndPoints.readAllNotifications,
        authenticated: true,
        data: {},
      );
      if (StatusCode.isSuccessful(response)) {
        return BaseResponse(
          status: response.data[BaseResponse.statusKey],
          msg: response.data[BaseResponse.msgKey],
        );
      } else {
        throw ServerException(message: StatusCode.errorMessage(response));
      }
    } catch (e) {
      if (e is ServerException) {
        rethrow;
      }
      throw ServerException(message: e.toString());
    }
  }
}
