import 'package:dartz/dartz.dart';
import 'package:eltyp_delivery/core/api/dio/base_response.dart';
import 'package:eltyp_delivery/core/api/error/failures.dart';
import 'package:eltyp_delivery/core/usecase/base_use_case.dart';
import 'package:eltyp_delivery/features/auth/domain/entities/delete_account_params.dart';
import 'package:eltyp_delivery/features/auth/domain/repositories/base_login_repo.dart';

class DeleteAccountUseCase
    extends BaseUseCase<BaseResponse, DeleteAccountParameters> {
  final BaseLoginRepository baseLoginRepository;

  DeleteAccountUseCase(this.baseLoginRepository);

  @override
  Future<Either<Failure, BaseResponse>> call(
    DeleteAccountParameters parameters,
  ) async {
    return baseLoginRepository.startDeleteAccount(parameters);
  }
}
