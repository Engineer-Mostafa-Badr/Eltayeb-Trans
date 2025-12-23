import 'package:eltyp_delivery/core/api/dio/api_consumer.dart';
import 'package:eltyp_delivery/core/api/dio/end_points.dart';
import 'package:eltyp_delivery/core/utils/cities_model.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

/// Service responsible for fetching location data (cities and countries)
class LocationService {
  final ApiConsumer _apiConsumer;

  LocationService(this._apiConsumer);

  /// Fetches list of cities/governorates
  Future<List<CitiesModel>> getCities() async {
    if (await InternetConnection().hasInternetAccess == false) {
      return [];
    }

    final response = await _apiConsumer.get(
      EndPoints.cities,
      authenticated: false,
    );

    if (response.data != null) {
      final List<CitiesModel> cities = [];
      for (final item in response.data['data'] ?? []) {
        cities.add(CitiesModel.fromJson(item));
      }
      return cities;
    }
    return [];
  }

  /// Fetches list of countries
  Future<List<CitiesModel>> getCountries() async {
    if (await InternetConnection().hasInternetAccess == false) {
      return [];
    }

    final response = await _apiConsumer.get(
      EndPoints.countries,
      authenticated: false,
    );

    if (response.data != null) {
      final List<CitiesModel> countries = [];
      for (final item in response.data['data'] ?? []) {
        countries.add(CitiesModel.fromJson(item));
      }
      return countries;
    }
    return [];
  }
}

