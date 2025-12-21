part of 'trucks_bloc.dart';

sealed class TrucksEvent extends Equatable {
  const TrucksEvent();

  @override
  List<Object?> get props => [];
}

class GetTrucksEvent extends TrucksEvent {
  final NoParameters params;

  const GetTrucksEvent({this.params = const NoParameters()});

  @override
  List<Object?> get props => [params];
}
