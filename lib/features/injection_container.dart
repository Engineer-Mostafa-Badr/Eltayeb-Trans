import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:eltyp_delivery/core/api/dio/api_consumer.dart';
import 'package:eltyp_delivery/core/api/dio/dio_consumer.dart';
import 'package:eltyp_delivery/core/cubit/app_cubit.dart';
import 'package:eltyp_delivery/core/cubit/location_cubit.dart';
import 'package:eltyp_delivery/core/services/internet_connection_service.dart';
import 'package:eltyp_delivery/core/services/location_service.dart';
import 'package:eltyp_delivery/core/storage/main_hive_box.dart';
import 'package:eltyp_delivery/core/utils/check_permissions.dart';
import 'package:eltyp_delivery/features/auth/injection_container.dart';
import 'package:eltyp_delivery/features/notifications/injection_container.dart';
import 'package:eltyp_delivery/features/profile/injection_container.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'home/injection_container.dart';

/// Global GetIt instance for dependency injection
final sl = GetIt.instance;

/// Initializes all dependencies and services
/// Should be called before running the app
Future<void> init() async {
  // ========== Local Storage ==========
  sl.registerFactory<MainSecureStorage>(() => MainSecureStorage());

  // ========== APIs ==========
  sl.registerFactory(() => Dio());
  sl.registerLazySingleton<ApiConsumer>(
    () => DioConsumer(client: sl(), secureStorage: sl<MainSecureStorage>()),
  );

  // ========== Services ==========
  sl.registerLazySingleton<InternetConnectionService>(
    () => InternetConnectionService(),
  );
  sl.registerLazySingleton<LocationService>(
    () => LocationService(sl<ApiConsumer>()),
  );

  // ========== Interceptors ==========
  sl.registerLazySingleton(
    () => PrettyDioLogger(requestBody: true, requestHeader: true),
  );

  // ========== BLoCs ==========
  sl.registerLazySingleton<LocationCubit>(
    () => LocationCubit(sl<LocationService>()),
  );
  sl.registerFactory<MainAppCubit>(
    () => MainAppCubit(
      secureStorage: sl<MainSecureStorage>(),
      internetConnectionService: sl<InternetConnectionService>(),
    ),
  );

  // ========== Utils ==========
  sl.registerFactory<CheckAppPermissions>(() => CheckAppPermissions());

  // ========== Features ==========
  loginModule();
  getNotificationsModule();
  getProfileModule();
  getTripsModule();
}
