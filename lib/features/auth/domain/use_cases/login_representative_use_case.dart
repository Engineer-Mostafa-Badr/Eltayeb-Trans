import 'package:eltyp_delivery/features/auth/domain/repositories/base_login_repo.dart';
import 'package:eltyp_delivery/core/usecase/base_use_case.dart';
import 'package:eltyp_delivery/core/api/dio/base_response.dart';
import 'package:eltyp_delivery/core/api/error/failures.dart';
import '../entities/login_representative_params.dart';
import 'package:dartz/dartz.dart';

class LoginRepresentativeUseCase
    extends BaseUseCase<BaseResponse, LoginrepresentativeParameters> {
  final BaseLoginRepository baseLoginRepository;

  LoginRepresentativeUseCase(this.baseLoginRepository);

  @override
  Future<Either<Failure, BaseResponse>> call(
    LoginrepresentativeParameters parameters,
  ) async {
    return baseLoginRepository.representativeLogin(parameters);
  }
}
