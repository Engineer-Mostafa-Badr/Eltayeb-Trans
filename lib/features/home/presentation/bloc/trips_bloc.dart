import 'dart:async';

import 'package:eltyp_delivery/core/api/dio/base_response.dart';
import 'package:eltyp_delivery/core/enum/enums.dart';
import 'package:eltyp_delivery/core/usecase/base_use_case.dart';
import 'package:eltyp_delivery/features/home/data/models/trips_model.dart';
import 'package:eltyp_delivery/features/home/domain/use_cases/get_trips_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/get_trip_details_params.dart';
import '../../domain/use_cases/get_trip_details_use_case.dart';

part 'trips_event.dart';
part 'trips_state.dart';

class TripsBloc extends Bloc<TripsEvent, TripsState> {
  TripsBloc(
      this.getTripsUseCase,
      this.getTripDetailsUseCase,
      ) : super(const TripsState()) {
    tripsScrollController = ScrollController();
    on<GetTripsEvent>(_getTrips);
    on<GetTripDetailsEvent>(_getTripDetails);
    on<MakeCounterNotificationZeroEvent>(_makeCounterNotificationZero);
  }

  static TripsBloc get(BuildContext context) => BlocProvider.of(context);

  final GetTripsUseCase getTripsUseCase;
  final GetTripDetailsUseCase getTripDetailsUseCase;
  late final ScrollController tripsScrollController;

  FutureOr<void> _getTrips(
      GetTripsEvent event,
      Emitter<TripsState> emit,
      ) async {
    emit(state.copyWith(requestUtilsState: RequestState.loading));

    final result = await getTripsUseCase(event.params);

    result.fold(
          (failure) {
        emit(
          state.copyWith(
            requestUtilsState: RequestState.error,
            responseUtils: BaseResponse<TripsModel>(
              status: false,
              msg: failure.message,
            ),
          ),
        );
      },
          (data) {
        emit(
          state.copyWith(
            requestUtilsState: RequestState.loaded,
            responseUtils: data,
          ),
        );
      },
    );
  }

  FutureOr<void> _getTripDetails(
      GetTripDetailsEvent event,
      Emitter<TripsState> emit,
      ) async {
    emit(state.copyWith(tripDetailsRequestState: RequestState.loading));

    final result = await getTripDetailsUseCase(event.params);

    result.fold(
          (failure) {
        emit(
          state.copyWith(
            tripDetailsRequestState: RequestState.error,
            tripDetailsResponse: BaseResponse<TripModel>(
              status: false,
              msg: failure.message,
            ),
          ),
        );
      },
          (data) {
        emit(
          state.copyWith(
            tripDetailsRequestState: RequestState.loaded,
            tripDetailsResponse: data,
          ),
        );
      },
    );
  }

  FutureOr<void> _makeCounterNotificationZero(
      MakeCounterNotificationZeroEvent event,
      Emitter<TripsState> emit,
      ) async {}

  @override
  Future<void> close() {
    tripsScrollController.dispose();
    return super.close();
  }
}
