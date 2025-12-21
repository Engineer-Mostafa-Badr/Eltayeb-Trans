import 'package:eltyp_delivery/core/api/dio/api_consumer.dart';
import 'package:eltyp_delivery/core/api/dio/base_response.dart';
import 'package:eltyp_delivery/core/api/dio/end_points.dart';
import 'package:eltyp_delivery/core/api/dio/status_code.dart';
import 'package:eltyp_delivery/core/api/error/exceptions.dart';
import 'package:eltyp_delivery/features/auth/data/models/user_model.dart';
import 'package:eltyp_delivery/features/profile/domain/entities/update_password_params.dart';
import 'package:eltyp_delivery/features/profile/domain/entities/update_profile_params.dart';

abstract class BaseProfileRemoteDataSource {
  Future<BaseResponse<UserModel>> getProfile();

  Future<BaseResponse<UserModel>> getEmployeeProfile();

  Future<BaseResponse<UserModel>> updateProfile(UpdateProfileParams parameters);

  Future<BaseResponse<UserModel>> updatePassword(
    UpdatePasswordParams parameters,
  );
}

class ProfileRemoteDataSource extends BaseProfileRemoteDataSource {
  final ApiConsumer _apiConsumer;

  ProfileRemoteDataSource(this._apiConsumer);

  @override
  Future<BaseResponse<UserModel>> getProfile() async {
    final response = await _apiConsumer.get(
      EndPoints.profile,
      authenticated: true,
    );

    if (StatusCode.isSuccessful(response)) {
      return BaseResponse<UserModel>(
        status: response.data[BaseResponse.statusKey],
        data: UserModel.fromJson(response.data[BaseResponse.dataKey]),
        msg: response.data[BaseResponse.msgKey],
      );
    } else {
      throw ServerException(message: StatusCode.errorMessage(response));
    }
  }

  @override
  Future<BaseResponse<UserModel>> getEmployeeProfile() async {
    final response = await _apiConsumer.get(
      EndPoints.employeeProfile,
      authenticated: true,
    );

    if (StatusCode.isSuccessful(response)) {
      return BaseResponse<UserModel>(
        status: response.data[BaseResponse.statusKey],
        data: UserModel.fromJson(response.data[BaseResponse.dataKey]),
        msg: response.data[BaseResponse.msgKey],
      );
    } else {
      throw ServerException(message: StatusCode.errorMessage(response));
    }
  }

  @override
  Future<BaseResponse<UserModel>> updateProfile(
    UpdateProfileParams parameters,
  ) async {
    final response = await _apiConsumer.post(
      EndPoints.updateProfile,
      data: await parameters.toJson(),
      authenticated: true,
    );

    if (StatusCode.isSuccessful(response)) {
      return BaseResponse<UserModel>(
        status: response.data[BaseResponse.statusKey],
        data: UserModel.fromJson(response.data[BaseResponse.dataKey]),
        msg: response.data[BaseResponse.msgKey],
      );
    } else {
      throw ServerException(message: StatusCode.errorMessage(response));
    }
  }

  @override
  Future<BaseResponse<UserModel>> updatePassword(
    UpdatePasswordParams parameters,
  ) async {
    final response = await _apiConsumer.post(
      EndPoints.updatePassword,
      data: parameters.toJson(),
      authenticated: true,
    );

    if (StatusCode.isSuccessful(response)) {
      return BaseResponse<UserModel>(
        status: response.data[BaseResponse.statusKey],
        data: UserModel.fromJson(response.data[BaseResponse.dataKey]),
        msg: response.data[BaseResponse.msgKey],
      );
    } else {
      throw ServerException(message: StatusCode.errorMessage(response));
    }
  }
}
