import 'package:dartz/dartz.dart';
import 'package:eltyp_delivery/core/api/dio/base_response.dart';
import 'package:eltyp_delivery/core/api/error/failures.dart';
import 'package:eltyp_delivery/core/usecase/base_use_case.dart';
import 'package:eltyp_delivery/features/home/data/models/trips_model.dart';
import 'package:eltyp_delivery/features/home/domain/entities/get_trip_details_params.dart';

abstract class BaseTripsRepository {
  Future<Either<Failure, BaseResponse<TripsModel>>> getHomeUtils(NoParameters params);

  Future<Either<Failure, BaseResponse<TripModel>>> getTripDetails(GetTripDetailsParams params);
}
