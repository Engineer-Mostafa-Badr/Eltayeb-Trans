import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:eltyp_delivery/core/api/dio/dio_consumer.dart';
import 'package:eltyp_delivery/core/api/dio/end_points.dart';
import 'package:eltyp_delivery/core/extensions/shared_extensions.dart';
import 'package:eltyp_delivery/core/storage/main_hive_box.dart';
import 'package:eltyp_delivery/core/utils/app_const.dart';
import 'package:eltyp_delivery/core/utils/cities_model.dart';
import 'package:eltyp_delivery/features/injection_container.dart' as di;
import 'package:eltyp_delivery/features/injection_container.dart';

part 'app_state.dart';

class MainAppCubit extends Cubit<MainAppCubitState> {
  MainAppCubit() : super(MainAppInitial());

  static MainAppCubit get(BuildContext context) => BlocProvider.of(context);

  // change theme mode
  bool isDark = false;

  bool get getIsDark => isDark;

  void changeThemeMode() async {
    isDark = !isDark;
    await di.sl<MainSecureStorage>().putValue(AppConst.isDarkBox, isDark);
    emit(AppChangeThemeMode());
  }

  ///
  List<CitiesModel> citiesModel = [];

  Future<void> getCities() async {
    citiesModel.clear();
    if (await InternetConnection().hasInternetAccess == false) {
      return;
    }
    emit(GetGovernoratesLoading());
    final response = await DioConsumer(
      client: sl(),
    ).get(EndPoints.cities, authenticated: false);

    if (response.data != null) {
      citiesModel.clear();
      for (final item in response.data['data'] ?? []) {
        citiesModel.add(CitiesModel.fromJson(item));
      }
      emit(GetGovernoratesSuccess());
    } else {
      emit(GetGovernoratesError());
    }
  }

  /// countriesModel
  List<CitiesModel> countriesModel = [];

  Future<void> getCountries() async {
    countriesModel.clear();
    if (await InternetConnection().hasInternetAccess == false) {
      return;
    }
    emit(GetCountriesLoading());
    final response = await DioConsumer(
      client: sl(),
    ).get(EndPoints.countries, authenticated: false);

    if (response.data != null) {
      countriesModel.clear();
      for (final item in response.data['data'] ?? []) {
        countriesModel.add(CitiesModel.fromJson(item));
      }
      emit(GetCountriesSuccess());
    } else {
      emit(GetCountriesError());
    }
  }

  /// check internet connection
  late StreamSubscription<InternetStatus> listener;

  bool connectedToInternet = true;

  StreamSubscription<InternetStatus> checkInternetConnection() {
    return listener = InternetConnection().onStatusChange.listen((
      InternetStatus status,
    ) {
      switch (status) {
        case InternetStatus.connected:
          if (connectedToInternet == false) {
            connectedToInternet = true;
            'internet_connected_toast'.showTopSuccessToast;
          }
          break;
        case InternetStatus.disconnected:
          connectedToInternet = false;
          'internet_disconnected_toast'.showTopErrorToast;
          break;
      }
    });
  }

  @override
  Future<void> close() {
    listener.cancel();
    return super.close();
  }
}
