import 'package:dartz/dartz.dart';
import 'package:eltyp_delivery/core/api/dio/base_response.dart';
import 'package:eltyp_delivery/core/api/error/failures.dart';
import 'package:eltyp_delivery/core/usecase/base_use_case.dart';
import 'package:eltyp_delivery/features/home/data/models/drivers_model.dart';
import 'package:eltyp_delivery/features/home/domain/repositories/base_trips_repo.dart';

class GetDriversUseCase
    extends BaseUseCase<BaseResponse<DriversModel>, NoParameters> {
  final BaseTripsRepository repository;

  GetDriversUseCase(this.repository);

  @override
  Future<Either<Failure, BaseResponse<DriversModel>>> call(
    NoParameters parameters,
  ) {
    return repository.getDrivers(parameters);
  }
}
