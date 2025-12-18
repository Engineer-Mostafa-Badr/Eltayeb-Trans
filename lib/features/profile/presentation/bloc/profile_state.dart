part of 'profile_bloc.dart';

class ProfileState extends Equatable {
  /// get profile
  final RequestState getProfileState;
  final BaseResponse<UserModel> getProfileResponse;

  /// update profile
  final RequestState updateProfileState;
  final BaseResponse<UserModel> updateProfileResponse;



  const ProfileState({
    /// get profile
    this.getProfileState = RequestState.loading,
    this.getProfileResponse = const BaseResponse<UserModel>(),

    /// update profile
    this.updateProfileState = RequestState.initial,
    this.updateProfileResponse = const BaseResponse<UserModel>(),


  });

  ProfileState copyWith({
    /// get profile
    RequestState getProfileState = RequestState.initial,
    BaseResponse<UserModel>? getProfileResponse,

    /// update profile
    RequestState updateProfileState = RequestState.initial,
    BaseResponse<UserModel>? updateProfileResponse,




  }) {
    return ProfileState(
      /// get profile
      getProfileState: getProfileState,
      getProfileResponse: getProfileResponse ?? this.getProfileResponse,

      /// update profile
      updateProfileState: updateProfileState,
      updateProfileResponse:
          updateProfileResponse ?? this.updateProfileResponse,


    );
  }

  @override
  List<Object> get props => [
    /// get profile
    getProfileState,
    getProfileResponse,

    /// update profile
    updateProfileState,
    updateProfileResponse,

  ];
}
