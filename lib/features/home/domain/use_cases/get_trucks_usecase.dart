import 'package:dartz/dartz.dart';
import 'package:eltyp_delivery/core/api/dio/base_response.dart';
import 'package:eltyp_delivery/core/api/error/failures.dart';
import 'package:eltyp_delivery/core/usecase/base_use_case.dart';
import 'package:eltyp_delivery/features/home/data/models/trucks_model.dart';
import 'package:eltyp_delivery/features/home/domain/repositories/base_trips_repo.dart';

class GetTrucksUseCase
    extends BaseUseCase<BaseResponse<TrucksModel>, NoParameters> {
  final BaseTripsRepository repository;

  GetTrucksUseCase(this.repository);

  @override
  Future<Either<Failure, BaseResponse<TrucksModel>>> call(
    NoParameters parameters,
  ) {
    return repository.getTrucks(parameters);
  }
}
