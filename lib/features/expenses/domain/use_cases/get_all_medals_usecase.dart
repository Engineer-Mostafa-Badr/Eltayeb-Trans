import 'package:dartz/dartz.dart';
import 'package:eltyp_delivery/core/api/dio/base_response.dart';
import 'package:eltyp_delivery/core/api/error/failures.dart';
import 'package:eltyp_delivery/core/usecase/base_use_case.dart';
import 'package:eltyp_delivery/features/expenses/domain/entities/all_medals_response.dart';
import 'package:eltyp_delivery/features/expenses/domain/repositories/base_repo.dart';

class GetAllMedalsUseCase
    extends
        BaseUseCase<BaseResponse<AllMedalsResponse>, GetAllMedalsParameters> {
  GetAllMedalsUseCase(this.repository);

  final BaseMedalsRepository repository;

  @override
  Future<Either<Failure, BaseResponse<AllMedalsResponse>>> call(
    GetAllMedalsParameters parameters,
  ) {
    return repository.getAllMedals(parameters);
  }
}

class GetAllMedalsParameters extends PaginationParameters {
  const GetAllMedalsParameters({super.page});

  @override
  Map<String, dynamic> toJson() {
    return {'page': page};
  }

  @override
  GetAllMedalsParameters copyWith({int page = 1}) {
    return GetAllMedalsParameters(page: page);
  }

  @override
  List<Object?> get props => [page];
}
