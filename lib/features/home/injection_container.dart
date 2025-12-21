import 'package:eltyp_delivery/core/api/dio/api_consumer.dart';
import 'package:eltyp_delivery/features/home/data/data_sources/remote/remote_data_source.dart';
import 'package:eltyp_delivery/features/home/data/repositories/implementation_repositories.dart';
import 'package:eltyp_delivery/features/home/domain/repositories/base_trips_repo.dart';
import 'package:eltyp_delivery/features/home/domain/use_cases/get_drivers_usecase.dart';
import 'package:eltyp_delivery/features/home/domain/use_cases/get_trip_details_use_case.dart';
import 'package:eltyp_delivery/features/home/domain/use_cases/get_trips_usecase.dart';
import 'package:eltyp_delivery/features/home/domain/use_cases/get_trucks_usecase.dart';
import 'package:eltyp_delivery/features/home/presentation/bloc/drivers_bloc.dart';
import 'package:eltyp_delivery/features/home/presentation/bloc/trips_bloc.dart';
import 'package:eltyp_delivery/features/home/presentation/bloc/trucks_bloc.dart';
import 'package:eltyp_delivery/features/injection_container.dart';

Future<void> getTripsModule() async {
  /// Use Cases
  sl.registerLazySingleton<GetTripsUseCase>(
    () => GetTripsUseCase(sl<BaseTripsRepository>()),
  );
  sl.registerLazySingleton<GetTripDetailsUseCase>(
    () => GetTripDetailsUseCase(sl<BaseTripsRepository>()),
  );
  sl.registerLazySingleton<GetDriversUseCase>(
    () => GetDriversUseCase(sl<BaseTripsRepository>()),
  );
  sl.registerLazySingleton<GetTrucksUseCase>(
    () => GetTrucksUseCase(sl<BaseTripsRepository>()),
  );

  /// Repositories
  sl.registerLazySingleton<BaseTripsRepository>(
    () => HomeRepositoryImpl(sl<HomeRemoteDataSource>()),
  );

  /// Data Sources
  sl.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSource(sl<ApiConsumer>()),
  );

  /// Blocs
  sl.registerFactory<TripsBloc>(
    () => TripsBloc(sl<GetTripsUseCase>(), sl<GetTripDetailsUseCase>()),
  );
  sl.registerFactory<DriversBloc>(() => DriversBloc(sl<GetDriversUseCase>()));
  sl.registerFactory<TrucksBloc>(() => TrucksBloc(sl<GetTrucksUseCase>()));
}
