import 'package:dartz/dartz.dart';
import 'package:eltyp_delivery/core/api/dio/base_response.dart';
import 'package:eltyp_delivery/core/api/error/exceptions.dart';
import 'package:eltyp_delivery/core/api/error/failures.dart';
import 'package:eltyp_delivery/features/auth/data/models/user_model.dart';
import 'package:eltyp_delivery/features/profile/data/data_sources/remote/remote_data_source.dart';
import 'package:eltyp_delivery/features/profile/domain/entities/update_password_params.dart';
import 'package:eltyp_delivery/features/profile/domain/entities/update_profile_params.dart';
import 'package:eltyp_delivery/features/profile/domain/repositories/base_profile_repo.dart';

class ProfileRepositoryImpl implements BaseProfileRepository {
  ProfileRepositoryImpl(this.remoteDataSource);

  final ProfileRemoteDataSource remoteDataSource;

  @override
  Future<Either<Failure, BaseResponse<UserModel>>> getProfile() async {
    try {
      final response = await remoteDataSource.getProfile();
      return Right(response);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, BaseResponse<UserModel>>> getEmployeeProfile() async {
    try {
      final response = await remoteDataSource.getEmployeeProfile();
      return Right(response);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, BaseResponse<UserModel>>> updateProfile(
    UpdateProfileParams parameters,
  ) async {
    try {
      final response = await remoteDataSource.updateProfile(parameters);
      return Right(response);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, BaseResponse<UserModel>>> updatePassword(
    UpdatePasswordParams parameters,
  ) async {
    try {
      final response = await remoteDataSource.updatePassword(parameters);
      return Right(response);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }
}
