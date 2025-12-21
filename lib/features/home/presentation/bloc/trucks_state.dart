part of 'trucks_bloc.dart';

class TrucksState extends Equatable {
  final RequestState requestState;
  final BaseResponse<TrucksModel> response;

  const TrucksState({
    this.requestState = RequestState.loading,
    this.response = const BaseResponse(),
  });

  TrucksState copyWith({
    RequestState? requestState,
    BaseResponse<TrucksModel>? response,
  }) {
    return TrucksState(
      requestState: requestState ?? this.requestState,
      response: response ?? this.response,
    );
  }

  @override
  List<Object?> get props => [requestState, response];
}
