part of 'drivers_bloc.dart';

class DriversState extends Equatable {
  final RequestState requestState;
  final BaseResponse<DriversModel> response;

  const DriversState({
    this.requestState = RequestState.loading,
    this.response = const BaseResponse(),
  });

  DriversState copyWith({
    RequestState? requestState,
    BaseResponse<DriversModel>? response,
  }) {
    return DriversState(
      requestState: requestState ?? this.requestState,
      response: response ?? this.response,
    );
  }

  @override
  List<Object?> get props => [requestState, response];
}
