part of 'profile_bloc.dart';

class ProfileState extends Equatable {
  /// get profile
  final RequestState getProfileState;
  final BaseResponse<UserModel> getProfileResponse;

  /// get employee profile
  final RequestState getEmployeeProfileState;
  final BaseResponse<UserModel> getEmployeeProfileResponse;

  /// update profile
  final RequestState updateProfileState;
  final BaseResponse<UserModel> updateProfileResponse;

  /// update password
  final RequestState updatePasswordState;
  final BaseResponse<UserModel> updatePasswordResponse;

  const ProfileState({
    /// get profile
    this.getProfileState = RequestState.loading,
    this.getProfileResponse = const BaseResponse<UserModel>(),

    /// get employee profile
    this.getEmployeeProfileState = RequestState.initial,
    this.getEmployeeProfileResponse = const BaseResponse<UserModel>(),

    /// update profile
    this.updateProfileState = RequestState.initial,
    this.updateProfileResponse = const BaseResponse<UserModel>(),

    /// update password
    this.updatePasswordState = RequestState.initial,
    this.updatePasswordResponse = const BaseResponse<UserModel>(),
  });

  ProfileState copyWith({
    /// get profile
    RequestState getProfileState = RequestState.initial,
    BaseResponse<UserModel>? getProfileResponse,

    /// get employee profile
    RequestState getEmployeeProfileState = RequestState.initial,
    BaseResponse<UserModel>? getEmployeeProfileResponse,

    /// update profile
    RequestState updateProfileState = RequestState.initial,
    BaseResponse<UserModel>? updateProfileResponse,

    /// update password
    RequestState updatePasswordState = RequestState.initial,
    BaseResponse<UserModel>? updatePasswordResponse,
  }) {
    return ProfileState(
      /// get profile
      getProfileState: getProfileState,
      getProfileResponse: getProfileResponse ?? this.getProfileResponse,

      /// get employee profile
      getEmployeeProfileState: getEmployeeProfileState,
      getEmployeeProfileResponse:
          getEmployeeProfileResponse ?? this.getEmployeeProfileResponse,

      /// update profile
      updateProfileState: updateProfileState,
      updateProfileResponse:
          updateProfileResponse ?? this.updateProfileResponse,

      /// update password
      updatePasswordState: updatePasswordState,
      updatePasswordResponse:
          updatePasswordResponse ?? this.updatePasswordResponse,
    );
  }

  @override
  List<Object> get props => [
    /// get profile
    getProfileState,
    getProfileResponse,

    /// get employee profile
    getEmployeeProfileState,
    getEmployeeProfileResponse,

    /// update profile
    updateProfileState,
    updateProfileResponse,

    /// update password
    updatePasswordState,
    updatePasswordResponse,
  ];
}
