import 'dart:async';

import 'package:eltyp_delivery/core/api/dio/base_response.dart';
import 'package:eltyp_delivery/core/enum/enums.dart';
import 'package:eltyp_delivery/core/usecase/base_use_case.dart';
import 'package:eltyp_delivery/features/home/data/models/trucks_model.dart';
import 'package:eltyp_delivery/features/home/domain/use_cases/get_trucks_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'trucks_event.dart';
part 'trucks_state.dart';

class TrucksBloc extends Bloc<TrucksEvent, TrucksState> {
  TrucksBloc(this.getTrucksUseCase) : super(const TrucksState()) {
    on<GetTrucksEvent>(_getTrucks);
  }

  static TrucksBloc get(BuildContext context) => BlocProvider.of(context);

  final GetTrucksUseCase getTrucksUseCase;

  FutureOr<void> _getTrucks(
    GetTrucksEvent event,
    Emitter<TrucksState> emit,
  ) async {
    emit(state.copyWith(requestState: RequestState.loading));

    final result = await getTrucksUseCase(event.params);

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            requestState: RequestState.error,
            response: BaseResponse<TrucksModel>(
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
