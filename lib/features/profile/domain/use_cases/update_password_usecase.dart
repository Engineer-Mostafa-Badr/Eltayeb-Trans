import 'package:dartz/dartz.dart';
import 'package:eltyp_delivery/core/api/dio/base_response.dart';
import 'package:eltyp_delivery/core/api/error/failures.dart';
import 'package:eltyp_delivery/core/usecase/base_use_case.dart';
import 'package:eltyp_delivery/features/auth/data/models/user_model.dart';
import 'package:eltyp_delivery/features/profile/domain/entities/update_password_params.dart';
import 'package:eltyp_delivery/features/profile/domain/repositories/base_profile_repo.dart';

class UpdatePasswordUseCase
    extends BaseUseCase<BaseResponse<UserModel>, UpdatePasswordParams> {
  final BaseProfileRepository repository;

  UpdatePasswordUseCase(this.repository);

  @override
  Future<Either<Failure, BaseResponse<UserModel>>> call(
    UpdatePasswordParams parameters,
  ) {
    return repository.updatePassword(parameters);
  }
}
