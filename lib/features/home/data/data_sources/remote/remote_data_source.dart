import 'package:eltyp_delivery/core/api/dio/api_consumer.dart';
import 'package:eltyp_delivery/core/api/dio/base_response.dart';
import 'package:eltyp_delivery/core/api/dio/end_points.dart';
import 'package:eltyp_delivery/core/api/dio/status_code.dart';
import 'package:eltyp_delivery/core/api/error/exceptions.dart';
import 'package:eltyp_delivery/core/usecase/base_use_case.dart';
import 'package:eltyp_delivery/features/home/data/models/trips_model.dart';
import 'package:eltyp_delivery/features/home/domain/entities/get_trip_details_params.dart';

abstract class BaseTripsRemoteDataSource {
  Future<BaseResponse<TripsModel>> getTrips(NoParameters params);

  Future<BaseResponse<TripModel>> getTripDetails(GetTripDetailsParams params);
}

class HomeRemoteDataSource extends BaseTripsRemoteDataSource {
  final ApiConsumer _apiConsumer;

  HomeRemoteDataSource(this._apiConsumer);

  @override
  Future<BaseResponse<TripsModel>> getTrips(NoParameters params) async {
    final response = await _apiConsumer.get(EndPoints.trips, authenticated: true);

    if (StatusCode.isSuccessful(response)) {
      return BaseResponse<TripsModel>(
        status: response.data[BaseResponse.statusKey],
        data: TripsModel.fromJson(response.data[BaseResponse.dataKey]),
        msg: response.data[BaseResponse.msgKey],
      );
    } else {
      throw ServerException(message: StatusCode.errorMessage(response));
    }
  }

  @override
  Future<BaseResponse<TripModel>> getTripDetails(GetTripDetailsParams params) async {
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
}
