import 'package:eltyp_delivery/core/api/dio/api_consumer.dart';
import 'package:eltyp_delivery/core/api/dio/base_response.dart';
import 'package:eltyp_delivery/core/api/dio/end_points.dart';
import 'package:eltyp_delivery/core/api/dio/status_code.dart';
import 'package:eltyp_delivery/core/api/error/exceptions.dart';
import 'package:eltyp_delivery/features/auth/data/models/login_response_model.dart';
import 'package:eltyp_delivery/features/auth/data/models/user_model.dart';
import 'package:eltyp_delivery/features/auth/domain/entities/delete_account_params.dart';
import 'package:eltyp_delivery/features/auth/domain/entities/login_params.dart';
import 'package:eltyp_delivery/features/auth/domain/entities/logout_params.dart';
import 'package:eltyp_delivery/features/auth/domain/use_cases/verify_use_case.dart';

import '../../../domain/entities/login_representative_params.dart';

abstract class BaseLoginRemoteDataSource {
  Future<BaseResponse> startLogin(LoginParameters parameters);

  Future<BaseResponse> representativeLogin(
    LoginrepresentativeParameters parameters,
  );

  Future<BaseResponse> startLogout(LogoutParameters parameters);

  Future<BaseResponse> startDeleteAccount(DeleteAccountParameters parameters);

  Future<BaseResponse<LoginResponseModel>> startVerify(VerifyParams parameters);

  Future<BaseResponse> startResendCode(LoginParameters parameters);
}

class LoginRemoteDataSource extends BaseLoginRemoteDataSource {
  final ApiConsumer _apiConsumer;

  LoginRemoteDataSource(this._apiConsumer);

  // ================= Login User =================
  @override
  Future<BaseResponse> startLogin(LoginParameters parameters) async {
    final response = await _apiConsumer.post(
      EndPoints.login,
      authenticated: false,
      data: parameters.toJson(),
    );

    if (StatusCode.isSuccessful(response)) {
      return BaseResponse<UserModel>(
        status: response.data[BaseResponse.statusKey],
        data: response.data[BaseResponse.dataKey] == null
            ? null
            : UserModel.fromJson(response.data[BaseResponse.dataKey]),
        msg: response.data[BaseResponse.msgKey],
      );
    } else {
      throw ServerException(message: StatusCode.errorMessage(response));
    }
  }

  // ================= Representative Login =================

  @override
  Future<BaseResponse> representativeLogin(
    LoginrepresentativeParameters parameters,
  ) async {
    final response = await _apiConsumer.post(
      EndPoints.loginRepresentative,
      authenticated: false,
      data: parameters.toJson(),
    );

    if (StatusCode.isSuccessful(response)) {
      return BaseResponse<LoginResponseModel>(
        status: response.data[BaseResponse.statusKey],
        data: response.data[BaseResponse.dataKey] == null
            ? null
            : LoginResponseModel.fromJson(response.data[BaseResponse.dataKey]),
        msg: response.data[BaseResponse.msgKey],
      );
    } else {
      throw ServerException(message: StatusCode.errorMessage(response));
    }
  }

  // ================= Logout =================
  @override
  Future<BaseResponse> startLogout(LogoutParameters parameters) async {
    final response = await _apiConsumer.post(
      EndPoints.logout,
      authenticated: true,
      data: await parameters.toJson(),
    );

    if (StatusCode.isSuccessful(response)) {
      return BaseResponse(
        status: response.data[BaseResponse.statusKey],
        msg: response.data[BaseResponse.msgKey],
      );
    } else {
      throw ServerException(message: StatusCode.errorMessage(response));
    }
  }

  // ================= Delete Account =================
  @override
  Future<BaseResponse> startDeleteAccount(
    DeleteAccountParameters parameters,
  ) async {
    final response = await _apiConsumer.post(
      EndPoints.deleteAccount,
      authenticated: true,
      data: parameters.toJson(),
    );

    if (StatusCode.isSuccessful(response)) {
      return BaseResponse(
        status: response.data[BaseResponse.statusKey],
        msg: response.data[BaseResponse.msgKey],
      );
    } else {
      throw ServerException(message: StatusCode.errorMessage(response));
    }
  }

  // ================= Verify OTP =================
  @override
  Future<BaseResponse<LoginResponseModel>> startVerify(
    VerifyParams parameters,
  ) async {
    final response = await _apiConsumer.post(
      EndPoints.verifyOTP,
      authenticated: false,
      data: await parameters.toJson(),
    );

    if (StatusCode.isSuccessful(response)) {
      return BaseResponse<LoginResponseModel>(
        status: response.data[BaseResponse.statusKey],
        data: response.data[BaseResponse.dataKey] == null
            ? null
            : LoginResponseModel.fromJson(response.data[BaseResponse.dataKey]),
        msg: response.data[BaseResponse.msgKey],
      );
    } else {
      throw ServerException(message: StatusCode.errorMessage(response));
    }
  }

  // ================= Resend Code =================
  @override
  Future<BaseResponse> startResendCode(LoginParameters parameters) async {
    final response = await _apiConsumer.post(
      EndPoints.resendOTP,
      authenticated: false,
      data: parameters.toJson(),
    );

    if (StatusCode.isSuccessful(response)) {
      return BaseResponse(
        status: response.data[BaseResponse.statusKey],
        msg: response.data[BaseResponse.msgKey],
      );
    } else {
      throw ServerException(message: StatusCode.errorMessage(response));
    }
  }
}
