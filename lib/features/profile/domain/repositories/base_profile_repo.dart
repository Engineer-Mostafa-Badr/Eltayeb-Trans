import 'package:dartz/dartz.dart';
import 'package:eltyp_delivery/core/api/dio/base_response.dart';
import 'package:eltyp_delivery/core/api/error/failures.dart';
import 'package:eltyp_delivery/features/auth/data/models/user_model.dart';
import 'package:eltyp_delivery/features/profile/domain/entities/update_password_params.dart';
import 'package:eltyp_delivery/features/profile/domain/entities/update_profile_params.dart';

abstract class BaseProfileRepository {
  Future<Either<Failure, BaseResponse<UserModel>>> getProfile();

  Future<Either<Failure, BaseResponse<UserModel>>> getEmployeeProfile();

  Future<Either<Failure, BaseResponse<UserModel>>> updateProfile(
    UpdateProfileParams parameters,
  );

  Future<Either<Failure, BaseResponse<UserModel>>> updatePassword(
    UpdatePasswordParams parameters,
  );
}
