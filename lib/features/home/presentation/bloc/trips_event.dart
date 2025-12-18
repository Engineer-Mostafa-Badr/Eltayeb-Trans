part of 'trips_bloc.dart';

sealed class TripsEvent extends Equatable {
  const TripsEvent();

  @override
  List<Object?> get props => [];
}

class GetTripsEvent extends TripsEvent {
  final NoParameters params;

  const GetTripsEvent({this.params = const NoParameters()});

  @override
  List<Object?> get props => [params];
}

class GetTripDetailsEvent extends TripsEvent {
  final GetTripDetailsParams params;

  const GetTripDetailsEvent(this.params);

  @override
  List<Object?> get props => [params];
}

class MakeCounterNotificationZeroEvent extends TripsEvent {
  const MakeCounterNotificationZeroEvent();

  @override
  List<Object?> get props => [];
}
