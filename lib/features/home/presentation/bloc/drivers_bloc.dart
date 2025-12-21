import 'dart:async';

import 'package:eltyp_delivery/core/api/dio/base_response.dart';
import 'package:eltyp_delivery/core/enum/enums.dart';
import 'package:eltyp_delivery/core/usecase/base_use_case.dart';
import 'package:eltyp_delivery/features/home/data/models/drivers_model.dart';
import 'package:eltyp_delivery/features/home/domain/use_cases/get_drivers_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'drivers_event.dart';
part 'drivers_state.dart';

class DriversBloc extends Bloc<DriversEvent, DriversState> {
  DriversBloc(this.getDriversUseCase) : super(const DriversState()) {
    on<GetDriversEvent>(_getDrivers);
  }

  static DriversBloc get(BuildContext context) => BlocProvider.of(context);

  final GetDriversUseCase getDriversUseCase;

  FutureOr<void> _getDrivers(
    GetDriversEvent event,
    Emitter<DriversState> emit,
  ) async {
    emit(state.copyWith(requestState: RequestState.loading));

    final result = await getDriversUseCase(event.params);

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            requestState: RequestState.error,
            response: BaseResponse<DriversModel>(
              status: false,
              msg: failure.message,
            ),
          ),
        );
      },
      (data) {
        emit(state.copyWith(requestState: RequestState.loaded, response: data));
      },
    );
  }
}
