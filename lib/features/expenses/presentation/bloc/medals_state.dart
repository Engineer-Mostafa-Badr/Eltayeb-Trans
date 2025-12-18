part of 'medals_bloc.dart';

class MedalsState extends Equatable {
  const MedalsState({
    /// get seasons state
    this.getMedalsState = RequestState.loading,

    /// get all medals
    this.getAllMedalsState = RequestState.loading,
    this.getAllMedalsResponse = const BaseResponse<AllMedalsResponse>(),
    this.getAllMedalsParameters = const GetAllMedalsParameters(),
  });

  /// get seasons state
  final RequestState getMedalsState;

  /// get all medals
  final RequestState getAllMedalsState;
  final BaseResponse<AllMedalsResponse> getAllMedalsResponse;
  final GetAllMedalsParameters getAllMedalsParameters;

  MedalsState copyWith({
    /// get seasons state
    RequestState? getMedalsState,

    /// get all medals
    RequestState? getAllMedalsState,
    BaseResponse<AllMedalsResponse>? getAllMedalsResponse,
    GetAllMedalsParameters? getAllMedalsParameters,
  }) {
    return MedalsState(
      /// get seasons state
      getMedalsState: getMedalsState ?? this.getMedalsState,

      /// get all medals
      getAllMedalsState: getAllMedalsState ?? this.getAllMedalsState,
      getAllMedalsResponse: getAllMedalsResponse ?? this.getAllMedalsResponse,
      getAllMedalsParameters:
          getAllMedalsParameters ?? this.getAllMedalsParameters,
    );
  }

  @override
  List<Object?> get props => [

    /// get all medals
    getAllMedalsState,
    getAllMedalsResponse,
    getAllMedalsParameters,
  ];
}
