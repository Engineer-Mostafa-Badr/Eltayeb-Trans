import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:eltyp_delivery/core/api/dio/api_consumer.dart';
import 'package:eltyp_delivery/core/api/dio/dio_consumer.dart';
import 'package:eltyp_delivery/core/cubit/app_cubit.dart';
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
  // ========== BLoCs ==========
  sl.registerFactory<MainAppCubit>(() => MainAppCubit());

  // ========== APIs ==========
  sl.registerFactory(() => Dio());
  sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(client: sl()));

  // ========== Interceptors ==========
  sl.registerLazySingleton(
    () => PrettyDioLogger(requestBody: true, requestHeader: true),
  );

  // ========== Local Storage ==========
  sl.registerFactory<MainSecureStorage>(() => MainSecureStorage());

  // ========== Utils ==========
  sl.registerFactory<CheckAppPermissions>(() => CheckAppPermissions());

  // ========== Features ==========
  loginModule();
  getNotificationsModule();
  getProfileModule();
  getTripsModule();
}
