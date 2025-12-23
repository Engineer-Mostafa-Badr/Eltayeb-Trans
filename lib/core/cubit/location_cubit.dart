import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eltyp_delivery/core/services/location_service.dart';
import 'package:eltyp_delivery/core/utils/cities_model.dart';

part 'location_state.dart';

/// Cubit responsible for managing location data (cities and countries)
class LocationCubit extends Cubit<LocationState> {
  final LocationService _locationService;

  LocationCubit(this._locationService) : super(LocationInitial());

  List<CitiesModel> _cities = [];
  List<CitiesModel> _countries = [];

  List<CitiesModel> get cities => _cities;
  List<CitiesModel> get countries => _countries;

  /// Fetches cities/governorates
  Future<void> getCities() async {
    if (_cities.isNotEmpty) {
      emit(GetCitiesSuccess());
      return;
    }

    emit(GetCitiesLoading());
    try {
      _cities = await _locationService.getCities();
      emit(GetCitiesSuccess());
    } catch (e) {
      emit(GetCitiesError());
    }
  }

  /// Fetches countries
  Future<void> getCountries() async {
    if (_countries.isNotEmpty) {
      emit(GetCountriesSuccess());
      return;
    }

    emit(GetCountriesLoading());
    try {
      _countries = await _locationService.getCountries();
      emit(GetCountriesSuccess());
    } catch (e) {
      emit(GetCountriesError());
    }
  }
}
