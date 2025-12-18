import 'package:dartz/dartz.dart';
import 'package:eltyp_delivery/core/api/dio/base_response.dart';
import 'package:eltyp_delivery/core/api/error/failures.dart';
import 'package:eltyp_delivery/core/usecase/base_use_case.dart';
import 'package:eltyp_delivery/features/auth/data/models/user_model.dart';
import 'package:eltyp_delivery/features/profile/domain/entities/update_profile_params.dart';
import 'package:eltyp_delivery/features/profile/domain/repositories/base_profile_repo.dart';

class UpdateProfileUseCase
    extends BaseUseCase<BaseResponse<UserModel>, UpdateProfileParams> {
  final BaseProfileRepository repository;

  UpdateProfileUseCase(this.repository);

  @override
  Future<Either<Failure, BaseResponse<UserModel>>> call(
    UpdateProfileParams parameters,
  ) {
    return repository.updateProfile(parameters);
  }
}
