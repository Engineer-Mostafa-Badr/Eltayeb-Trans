import 'package:dartz/dartz.dart';
import 'package:eltyp_delivery/core/api/dio/base_response.dart';
import 'package:eltyp_delivery/core/api/error/failures.dart';
import 'package:eltyp_delivery/features/auth/data/models/login_response_model.dart';
import 'package:eltyp_delivery/features/auth/domain/entities/delete_account_params.dart';
import 'package:eltyp_delivery/features/auth/domain/entities/login_params.dart';
import 'package:eltyp_delivery/features/auth/domain/entities/login_representative_params.dart';
import 'package:eltyp_delivery/features/auth/domain/entities/logout_params.dart';
import 'package:eltyp_delivery/features/auth/domain/use_cases/verify_use_case.dart';

abstract class BaseLoginRepository {
  Future<Either<Failure, BaseResponse>> startLogin(LoginParameters parameters);

  Future<Either<Failure, BaseResponse>> representativeLogin(
    LoginrepresentativeParameters parameters,
  );

  Future<Either<Failure, BaseResponse>> startLogout(
    LogoutParameters parameters,
  );

  Future<Either<Failure, BaseResponse>> startDeleteAccount(
    DeleteAccountParameters parameters,
  );

  Future<Either<Failure, BaseResponse<LoginResponseModel>>> startVerify(
    VerifyParams parameters,
  );

  Future<Either<Failure, BaseResponse>> startResendCode(
    LoginParameters parameters,
  );
}
