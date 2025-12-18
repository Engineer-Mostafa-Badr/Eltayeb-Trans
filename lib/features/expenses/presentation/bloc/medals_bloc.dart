import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eltyp_delivery/core/api/dio/base_response.dart';
import 'package:eltyp_delivery/core/enum/enums.dart';


import '../../domain/entities/all_medals_response.dart';
import '../../domain/use_cases/get_all_medals_usecase.dart';

part 'medals_event.dart';
part 'medals_state.dart';

class MedalsBloc extends Bloc<MedalsEvent, MedalsState> {
  MedalsBloc( this.getAllMedalsUseCase)
    : super(const MedalsState()) {
    on<GetAllMedalsEvent>(_onGetAllMedals);
  }

  static MedalsBloc get(BuildContext context) =>
      BlocProvider.of<MedalsBloc>(context);
  final GetAllMedalsUseCase getAllMedalsUseCase;


  FutureOr<void> _onGetAllMedals(
    GetAllMedalsEvent event,
    Emitter<MedalsState> emit,
  ) async {
    emit(
      state.copyWith(
        getAllMedalsParameters: event.parameters,
        getAllMedalsState: RequestState.loading,
      ),
    );

    final result = await getAllMedalsUseCase(event.parameters);
    result.fold(
      (failure) {
        emit(
          state.copyWith(
            getAllMedalsState: RequestState.error,
            getAllMedalsResponse: state.getAllMedalsResponse.copyWith(
              status: false,
              msg: failure.message,
            ),
          ),
        );
      },
      (data) {
        emit(
          state.copyWith(
            getAllMedalsState: RequestState.loaded,
            getAllMedalsResponse: data.copyWith(
              msg: data.msg,
              data:
                  state.getAllMedalsResponse.data != null &&
                      event.parameters.page > 1
                  ? state.getAllMedalsResponse.data!.copyWith(
                      medalsOwnedByUser: data.data!.medalsOwnedByUser,
                      precentageOwned: data.data!.precentageOwned,
                      totalMedals: data.data!.totalMedals,
                    )
                  : data.data,
              pagination: data.pagination,
            ),
          ),
        );
      },
    );
  }
}
