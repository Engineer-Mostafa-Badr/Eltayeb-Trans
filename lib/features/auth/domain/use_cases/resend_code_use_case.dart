import 'package:dartz/dartz.dart';
import 'package:eltyp_delivery/core/api/dio/base_response.dart';
import 'package:eltyp_delivery/core/api/error/failures.dart';
import 'package:eltyp_delivery/core/usecase/base_use_case.dart';
import 'package:eltyp_delivery/features/auth/domain/entities/login_params.dart';
import 'package:eltyp_delivery/features/auth/domain/repositories/base_login_repo.dart';

class ResendCodeUseCase extends BaseUseCase<BaseResponse, LoginParameters> {
  final BaseLoginRepository baseLoginRepository;

  ResendCodeUseCase(this.baseLoginRepository);

  @override
  Future<Either<Failure, BaseResponse>> call(LoginParameters parameters) async {
    return baseLoginRepository.startResendCode(parameters);
  }
}
