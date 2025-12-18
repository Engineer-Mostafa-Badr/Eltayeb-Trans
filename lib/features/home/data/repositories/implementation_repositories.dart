import 'package:dartz/dartz.dart';
import 'package:eltyp_delivery/core/api/dio/base_response.dart';
import 'package:eltyp_delivery/core/api/error/exceptions.dart';
import 'package:eltyp_delivery/core/api/error/failures.dart';
import 'package:eltyp_delivery/core/usecase/base_use_case.dart';
import 'package:eltyp_delivery/features/home/data/data_sources/remote/remote_data_source.dart';
import 'package:eltyp_delivery/features/home/data/models/trips_model.dart';
import 'package:eltyp_delivery/features/home/domain/entities/get_trip_details_params.dart';
import 'package:eltyp_delivery/features/home/domain/repositories/base_trips_repo.dart';

class HomeRepositoryImpl implements BaseTripsRepository {
  final HomeRemoteDataSource remoteDataSource;

  HomeRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, BaseResponse<TripsModel>>> getHomeUtils(NoParameters params) async {
    try {
      final response = await remoteDataSource.getTrips(params);
      return Right(response);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, BaseResponse<TripModel>>> getTripDetails(
    GetTripDetailsParams params,
  ) async {
    try {
      final response = await remoteDataSource.getTripDetails(params);
      return Right(response);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }
}
