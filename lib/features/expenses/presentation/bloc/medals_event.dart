part of 'medals_bloc.dart';

sealed class MedalsEvent extends Equatable {
  const MedalsEvent();
}



final class GetAllMedalsEvent extends MedalsEvent {
  const GetAllMedalsEvent({this.parameters = const GetAllMedalsParameters()});

  final GetAllMedalsParameters parameters;

  @override
  List<Object?> get props => [parameters];
}
