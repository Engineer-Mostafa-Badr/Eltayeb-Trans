part of 'drivers_bloc.dart';

sealed class DriversEvent extends Equatable {
  const DriversEvent();

  @override
  List<Object?> get props => [];
}

class GetDriversEvent extends DriversEvent {
  final NoParameters params;

  const GetDriversEvent({this.params = const NoParameters()});

  @override
  List<Object?> get props => [params];
}
