import 'package:dartz/dartz.dart';
import 'package:eltyp_delivery/core/api/dio/base_response.dart';
import 'package:eltyp_delivery/core/api/error/failures.dart';
import 'package:eltyp_delivery/core/usecase/base_use_case.dart';
import 'package:eltyp_delivery/features/home/data/models/trips_model.dart';
import 'package:eltyp_delivery/features/home/domain/repositories/base_trips_repo.dart';

class GetTripsUseCase
    extends BaseUseCase<BaseResponse<TripsModel>, NoParameters> {
  final BaseTripsRepository repository;

  GetTripsUseCase(this.repository);

  @override
  Future<Either<Failure, BaseResponse<TripsModel>>> call(
      NoParameters parameters,
  ) {
    return repository.getHomeUtils(parameters);
  }
}
