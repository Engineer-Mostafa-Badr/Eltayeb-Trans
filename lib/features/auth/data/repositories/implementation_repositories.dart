import 'package:dartz/dartz.dart';
import 'package:eltyp_delivery/core/api/dio/base_response.dart';
import 'package:eltyp_delivery/core/api/error/exceptions.dart';
import 'package:eltyp_delivery/core/api/error/failures.dart';
import 'package:eltyp_delivery/features/auth/data/data_sources/remote/remote_data_source.dart';
import 'package:eltyp_delivery/features/auth/data/models/login_response_model.dart';
import 'package:eltyp_delivery/features/auth/domain/entities/delete_account_params.dart';
import 'package:eltyp_delivery/features/auth/domain/entities/login_params.dart';
import 'package:eltyp_delivery/features/auth/domain/entities/logout_params.dart';
import 'package:eltyp_delivery/features/auth/domain/repositories/base_login_repo.dart';
import 'package:eltyp_delivery/features/auth/domain/use_cases/verify_use_case.dart';

class LoginRepositoryImpl implements BaseLoginRepository {
  final LoginRemoteDataSource remoteDataSource;

  LoginRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, BaseResponse>> startLogin(LoginParameters parameters) async {
    try {
      final result = await remoteDataSource.startLogin(parameters);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
        ServerFailure(
          message: failure.message,
          // errNum: failure.errNum,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, BaseResponse>> startLogout(LogoutParameters parameters) async {
    try {
      final result = await remoteDataSource.startLogout(parameters);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
        ServerFailure(
          message: failure.message,
          // errNum: failure.errNum,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, BaseResponse>> startDeleteAccount(
    DeleteAccountParameters parameters,
  ) async {
    try {
      final result = await remoteDataSource.startDeleteAccount(parameters);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
        ServerFailure(
          message: failure.message,
          // errNum: failure.errNum,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, BaseResponse<LoginResponseModel>>> startVerify(
    VerifyParams parameters,
  ) async {
    try {
      final result = await remoteDataSource.startVerify(parameters);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
        ServerFailure(
          message: failure.message,
          // errNum: failure.errNum,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, BaseResponse>> startResendCode(LoginParameters parameters) async {
    try {
      final result = await remoteDataSource.startResendCode(parameters);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
        ServerFailure(
          message: failure.message,
          // errNum: failure.errNum,
        ),
      );
    }
  }
}
