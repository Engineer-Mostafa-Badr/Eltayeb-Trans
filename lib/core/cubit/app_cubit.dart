import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eltyp_delivery/core/services/internet_connection_service.dart';
import 'package:eltyp_delivery/core/storage/main_hive_box.dart';
import 'package:eltyp_delivery/core/utils/app_const.dart';

part 'app_state.dart';

/// Cubit responsible for managing app-wide settings like theme
class MainAppCubit extends Cubit<MainAppCubitState> {
  final MainSecureStorage _secureStorage;
  final InternetConnectionService _internetConnectionService;

  MainAppCubit({
    required MainSecureStorage secureStorage,
    required InternetConnectionService internetConnectionService,
  })  : _secureStorage = secureStorage,
        _internetConnectionService = internetConnectionService,
        super(MainAppInitial());

  static MainAppCubit get(BuildContext context) => BlocProvider.of(context);

  bool _isDark = false;
  bool get isDark => _isDark;

  /// Initializes theme from storage
  Future<void> initializeTheme() async {
    _isDark = await _secureStorage.getIsDark();
    emit(AppChangeThemeMode());
  }

  /// Changes theme mode and saves to storage
  Future<void> changeThemeMode() async {
    _isDark = !_isDark;
    await _secureStorage.putValue(AppConst.isDarkBox, _isDark);
    emit(AppChangeThemeMode());
  }

  /// Starts monitoring internet connection
  void checkInternetConnection() {
    _internetConnectionService.startMonitoring(
      onConnected: () {},
      onDisconnected: () {},
    );
  }

  bool get connectedToInternet => _internetConnectionService.isConnected;

  @override
  Future<void> close() {
    _internetConnectionService.dispose();
    return super.close();
  }
}
