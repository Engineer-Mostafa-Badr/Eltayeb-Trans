part of 'trips_bloc.dart';

class TripsState extends Equatable {
  final RequestState requestUtilsState;
  final BaseResponse<TripsModel> responseUtils;

  final RequestState tripDetailsRequestState;
  final BaseResponse<TripModel> tripDetailsResponse;

  const TripsState({
    this.requestUtilsState = RequestState.loading,
    this.responseUtils = const BaseResponse(),
    this.tripDetailsRequestState = RequestState.loading,
    this.tripDetailsResponse = const BaseResponse(),
  });

  TripsState copyWith({
    RequestState? requestUtilsState,
    BaseResponse<TripsModel>? responseUtils,
    RequestState? tripDetailsRequestState,
    BaseResponse<TripModel>? tripDetailsResponse,
  }) {
    return TripsState(
      requestUtilsState: requestUtilsState ?? this.requestUtilsState,
      responseUtils: responseUtils ?? this.responseUtils,
      tripDetailsRequestState:
      tripDetailsRequestState ?? this.tripDetailsRequestState,
      tripDetailsResponse:
      tripDetailsResponse ?? this.tripDetailsResponse,
    );
  }

  @override
  List<Object?> get props => [
    requestUtilsState,
    responseUtils,
    tripDetailsRequestState,
    tripDetailsResponse,
  ];
}
