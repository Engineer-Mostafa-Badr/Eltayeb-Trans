import 'package:eltyp_delivery/core/api/dio/api_consumer.dart';
import 'package:eltyp_delivery/features/injection_container.dart';
import 'package:eltyp_delivery/features/notifications/data/data_sources/remote/remote_data_source.dart';
import 'package:eltyp_delivery/features/notifications/data/repositories/implementation_repositories.dart';
import 'package:eltyp_delivery/features/notifications/domain/repositories/base_notifications_repo.dart';
import 'package:eltyp_delivery/features/notifications/domain/use_cases/get_notifications_usecase.dart';
import 'package:eltyp_delivery/features/notifications/domain/use_cases/read_all_notifications_usecase.dart';
import 'package:eltyp_delivery/features/notifications/domain/use_cases/read_notifications_usecase.dart';
import 'package:eltyp_delivery/features/notifications/presentation/bloc/notifications_bloc.dart';

Future<void> getNotificationsModule() async {
  /// Use Cases
  sl.registerLazySingleton<GetNotificationsUseCase>(
    () => GetNotificationsUseCase(sl<BaseNotificationsRepository>()),
  );
  sl.registerLazySingleton<ReadNotificationsUseCase>(
    () => ReadNotificationsUseCase(sl<BaseNotificationsRepository>()),
  );
  sl.registerLazySingleton<ReadAllNotificationsUseCase>(
    () => ReadAllNotificationsUseCase(sl<BaseNotificationsRepository>()),
  );

  /// Repositories
  sl.registerLazySingleton<BaseNotificationsRepository>(
    () => NotificationsRepositoryImpl(sl<NotificationsRemoteDataSource>()),
  );

  /// Data Sources
  sl.registerLazySingleton<NotificationsRemoteDataSource>(
    () => NotificationsRemoteDataSource(sl<ApiConsumer>()),
  );

  /// Blocs
  sl.registerFactory<NotificationsBloc>(
    () => NotificationsBloc(
      sl<GetNotificationsUseCase>(),
      sl<ReadNotificationsUseCase>(),
      sl<ReadAllNotificationsUseCase>(),
    ),
  );
}
