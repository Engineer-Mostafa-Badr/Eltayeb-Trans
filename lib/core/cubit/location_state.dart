part of 'location_cubit.dart';

@immutable
abstract class LocationState {}

class LocationInitial extends LocationState {}

class GetCitiesLoading extends LocationState {}

class GetCitiesSuccess extends LocationState {}

class GetCitiesError extends LocationState {}

class GetCountriesLoading extends LocationState {}

class GetCountriesSuccess extends LocationState {}

class GetCountriesError extends LocationState {}
