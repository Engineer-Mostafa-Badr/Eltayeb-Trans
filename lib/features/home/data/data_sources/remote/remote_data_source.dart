import 'package:eltyp_delivery/core/api/dio/api_consumer.dart';
import 'package:eltyp_delivery/core/api/dio/base_response.dart';
import 'package:eltyp_delivery/core/api/dio/end_points.dart';
import 'package:eltyp_delivery/core/api/dio/status_code.dart';
import 'package:eltyp_delivery/core/api/error/exceptions.dart';
import 'package:eltyp_delivery/core/usecase/base_use_case.dart';
import 'package:eltyp_delivery/features/home/data/models/drivers_model.dart';
import 'package:eltyp_delivery/features/home/data/models/trips_model.dart';
import 'package:eltyp_delivery/features/home/data/models/trucks_model.dart';
import 'package:eltyp_delivery/features/home/domain/entities/get_trip_details_params.dart';
import 'package:eltyp_delivery/features/home/domain/entities/get_trips_params.dart';

abstract class BaseTripsRemoteDataSource {
  Future<BaseResponse<TripsModel>> getTrips(GetTripsParams params);

  Future<BaseResponse<TripModel>> getTripDetails(GetTripDetailsParams params);

  Future<BaseResponse<DriversModel>> getDrivers(NoParameters params);

  Future<BaseResponse<TrucksModel>> getTrucks(NoParameters params);
}

class HomeRemoteDataSource extends BaseTripsRemoteDataSource {
  final ApiConsumer _apiConsumer;

  HomeRemoteDataSource(this._apiConsumer);

  @override
  Future<BaseResponse<TripsModel>> getTrips(GetTripsParams params) async {
    final response = await _apiConsumer.get(
      EndPoints.employeeTrips,
      queryParameters: params.toJson(),
      authenticated: true,
    );

    if (StatusCode.isSuccessful(response)) {
      final responseData = response.data[BaseResponse.dataKey];

      // Handle case where data is a List directly
      Map<String, dynamic> tripsData;
      if (responseData is List) {
        tripsData = {
          'trips': responseData,
          'active_trips_count': 0,
          'monthly_trips_count': 0,
        };
      } else if (responseData is Map<String, dynamic>) {
        tripsData = responseData;
      } else {
        tripsData = {
          'trips': [],
          'active_trips_count': 0,
          'monthly_trips_count': 0,
        };
      }

      final paginationData = response.data[BaseResponse.paginationKey];
      return BaseResponse<TripsModel>(
        status: response.data[BaseResponse.statusKey],
        data: TripsModel.fromJson(tripsData),
        msg: response.data[BaseResponse.msgKey],
        pagination:
            paginationData != null && paginationData is Map<String, dynamic>
            ? PaginationModel.fromJson(paginationData)
            : null,
      );
    } else {
      throw ServerException(message: StatusCode.errorMessage(response));
    }
  }

  @override
  Future<BaseResponse<TripModel>> getTripDetails(
    GetTripDetailsParams params,
  ) async {
    final response = await _apiConsumer.get(
      '${EndPoints.trips}/${params.tripId}',
      authenticated: true,
    );

    if (StatusCode.isSuccessful(response)) {
      return BaseResponse<TripModel>(
        status: response.data[BaseResponse.statusKey],
        data: TripModel.fromJson(response.data[BaseResponse.dataKey]),
        msg: response.data[BaseResponse.msgKey],
      );
    } else {
      throw ServerException(message: StatusCode.errorMessage(response));
    }
  }

  @override
  Future<BaseResponse<DriversModel>> getDrivers(NoParameters params) async {
    final response = await _apiConsumer.get(
      EndPoints.drivers,
      authenticated: true,
    );

    if (StatusCode.isSuccessful(response)) {
      return BaseResponse<DriversModel>(
        status: response.data[BaseResponse.statusKey],
        data: DriversModel.fromJson(response.data[BaseResponse.dataKey] ?? {}),
        msg: response.data[BaseResponse.msgKey],
      );
    } else {
      throw ServerException(message: StatusCode.errorMessage(response));
    }
  }

  @override
  Future<BaseResponse<TrucksModel>> getTrucks(NoParameters params) async {
    final response = await _apiConsumer.get(
      EndPoints.trucks,
      authenticated: true,
    );

    if (StatusCode.isSuccessful(response)) {
      return BaseResponse<TrucksModel>(
        status: response.data[BaseResponse.statusKey],
        data: TrucksModel.fromJson(response.data[BaseResponse.dataKey] ?? {}),
        msg: response.data[BaseResponse.msgKey],
      );
    } else {
      throw ServerException(message: StatusCode.errorMessage(response));
    }
  }
}
