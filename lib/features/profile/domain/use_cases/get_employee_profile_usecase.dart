import 'package:dartz/dartz.dart';
import 'package:eltyp_delivery/core/api/dio/base_response.dart';
import 'package:eltyp_delivery/core/api/error/failures.dart';
import 'package:eltyp_delivery/core/usecase/base_use_case.dart';
import 'package:eltyp_delivery/features/auth/data/models/user_model.dart';
import 'package:eltyp_delivery/features/profile/domain/repositories/base_profile_repo.dart';

class GetEmployeeProfileUseCase
    extends BaseUseCase<BaseResponse<UserModel>, NoParameters> {
  final BaseProfileRepository repository;

  GetEmployeeProfileUseCase(this.repository);

  @override
  Future<Either<Failure, BaseResponse<UserModel>>> call(
    NoParameters parameters,
  ) {
    return repository.getEmployeeProfile();
  }
}
