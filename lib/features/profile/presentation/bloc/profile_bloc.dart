import 'dart:async';

import 'package:eltyp_delivery/core/api/dio/base_response.dart';
import 'package:eltyp_delivery/core/enum/enums.dart';
import 'package:eltyp_delivery/core/storage/main_hive_box.dart';
import 'package:eltyp_delivery/core/usecase/base_use_case.dart';
import 'package:eltyp_delivery/features/auth/data/models/user_model.dart';
import 'package:eltyp_delivery/features/injection_container.dart';
import 'package:eltyp_delivery/features/profile/domain/entities/update_profile_params.dart';
import 'package:eltyp_delivery/features/profile/domain/use_cases/get_profile_usecase.dart';
import 'package:eltyp_delivery/features/profile/domain/use_cases/update_profile_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc(this.getProfileUseCase, this.updateProfileUseCase) : super(const ProfileState()) {
    on<GetProfileEvent>(_onGetProfileEvent);
    on<UpdateProfileEvent>(_onUpdateProfileEvent);
    on<UpdateCounterNotificationEvent>(_updateCounterNotificationEvent);
  }

  final GetProfileUseCase getProfileUseCase;
  final UpdateProfileUseCase updateProfileUseCase;

  static ProfileBloc get(BuildContext context) => BlocProvider.of<ProfileBloc>(context);

  FutureOr<void> _onGetProfileEvent(GetProfileEvent event, Emitter<ProfileState> emit) async {
    emit(state.copyWith(getProfileState: RequestState.loading));

    final result = await getProfileUseCase(const NoParameters());
    result.fold(
      (failure) {
        emit(
          state.copyWith(
            getProfileState: RequestState.error,
            getProfileResponse: BaseResponse(status: false, msg: failure.message),
          ),
        );
      },
      (data) {
        // sl<MainSecureStorage>().putIsVerified(data.data!.isProfileCompleted);
        sl<MainSecureStorage>().saveUserData(data.data!);
        emit(state.copyWith(getProfileState: RequestState.loaded, getProfileResponse: data));
      },
    );
  }

  FutureOr<void> _onUpdateProfileEvent(UpdateProfileEvent event, Emitter<ProfileState> emit) async {
    emit(state.copyWith(updateProfileState: RequestState.loading));

    final result = await updateProfileUseCase(event.parameters);
    result.fold(
      (failure) {
        emit(
          state.copyWith(
            updateProfileState: RequestState.error,
            updateProfileResponse: BaseResponse(status: false, msg: failure.message),
          ),
        );
      },
      (data) {
        sl<MainSecureStorage>().saveUserData(data.data!);
        emit(state.copyWith(updateProfileState: RequestState.loaded, updateProfileResponse: data));
      },
    );
  }

  FutureOr<void> _updateCounterNotificationEvent(
    UpdateCounterNotificationEvent event,
    Emitter<ProfileState> emit,
  ) async {
    emit(
      state.copyWith(
        getProfileResponse: state.getProfileResponse.copyWith(
          data: state.getProfileResponse.data?.copyWith(
            notificationsCount: event.isZero
                ? 0
                : state.getProfileResponse.data?.notificationsCount != null
                ? event.isPlus
                      ? state.getProfileResponse.data!.notificationsCount + 1
                      : state.getProfileResponse.data!.notificationsCount - 1
                : state.getProfileResponse.data?.notificationsCount,
          ),
        ),
      ),
    );
  }
}
