import 'package:eltyp_delivery/core/api/dio/api_consumer.dart';
import 'package:eltyp_delivery/features/injection_container.dart';

import 'data/data_sources/remote/remote_data_source.dart';
import 'data/repositories/implementation_repositories.dart';
import 'domain/repositories/base_repo.dart';
import 'domain/use_cases/get_all_medals_usecase.dart';

Future<void> getMedalsModule() async {
  /// Use Cases

  sl.registerLazySingleton<GetAllMedalsUseCase>(
    () => GetAllMedalsUseCase(sl<BaseMedalsRepository>()),
  );

  /// Repositories
  sl.registerLazySingleton<BaseMedalsRepository>(
    () => MedalsRepositoryImpl(sl<MedalsRemoteDataSource>()),
  );

  /// Data Sources
  sl.registerLazySingleton<MedalsRemoteDataSource>(
    () => MedalsRemoteDataSource(sl<ApiConsumer>()),
  );
}
