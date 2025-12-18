import 'package:eltyp_delivery/core/api/dio/api_consumer.dart';
import 'package:eltyp_delivery/features/auth/data/data_sources/remote/remote_data_source.dart';
import 'package:eltyp_delivery/features/auth/data/repositories/implementation_repositories.dart';
import 'package:eltyp_delivery/features/auth/domain/repositories/base_login_repo.dart';
import 'package:eltyp_delivery/features/auth/domain/use_cases/delete_account_use_case.dart';
import 'package:eltyp_delivery/features/auth/domain/use_cases/login_use_case.dart';
import 'package:eltyp_delivery/features/auth/domain/use_cases/logout_use_case.dart';
import 'package:eltyp_delivery/features/auth/domain/use_cases/resend_code_use_case.dart';
import 'package:eltyp_delivery/features/auth/domain/use_cases/verify_use_case.dart';
import 'package:eltyp_delivery/features/auth/presentation/bloc/login/login_bloc.dart';
import 'package:eltyp_delivery/features/injection_container.dart';

Future<void> loginModule() async {
  /// Use Cases
  sl.registerLazySingleton<LoginUseCase>(
    () => LoginUseCase(sl<BaseLoginRepository>()),
  );


  sl.registerLazySingleton<LogoutUseCase>(
    () => LogoutUseCase(sl<BaseLoginRepository>()),
  );

  sl.registerLazySingleton<DeleteAccountUseCase>(
    () => DeleteAccountUseCase(sl<BaseLoginRepository>()),
  );


  sl.registerLazySingleton<VerifyUseCase>(
    () => VerifyUseCase(sl<BaseLoginRepository>()),
  );

  sl.registerLazySingleton<ResendCodeUseCase>(
    () => ResendCodeUseCase(sl<BaseLoginRepository>()),
  );

  /// Repositories
  sl.registerLazySingleton<BaseLoginRepository>(
    () => LoginRepositoryImpl(sl<LoginRemoteDataSource>()),
  );

  /// Data Sources
  sl.registerLazySingleton<LoginRemoteDataSource>(
    () => LoginRemoteDataSource(sl<ApiConsumer>()),
  );

  /// Blocs
  sl.registerFactory<LoginBloc>(
    () => LoginBloc(
      sl<LoginUseCase>(),
      sl<LogoutUseCase>(),
      sl<DeleteAccountUseCase>(),
      sl<VerifyUseCase>(),
      sl<ResendCodeUseCase>(),
    ),
  );
}
