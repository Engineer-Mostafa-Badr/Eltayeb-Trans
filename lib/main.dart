import 'package:easy_localization/easy_localization.dart';
import 'package:eltyp_delivery/config/bloc_observer.dart';
import 'package:eltyp_delivery/config/firebase/firebase_options.dart';
import 'package:eltyp_delivery/core/cubit/app_cubit.dart';
import 'package:eltyp_delivery/core/storage/main_hive_box.dart';
import 'package:eltyp_delivery/core/storage/secure_boot.dart';
import 'package:eltyp_delivery/core/utils/app_const.dart';
import 'package:eltyp_delivery/features/auth/presentation/pages/login_page.dart';
import 'package:eltyp_delivery/features/injection_container.dart' as di;
import 'package:eltyp_delivery/features/landing/presentation/pages/landing_page.dart';
import 'package:eltyp_delivery/features/onboarding/presentation/pages/onboarding_page.dart';
import 'package:eltyp_delivery/my_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'features/auth/presentation/pages/login_representative_page.dart';

/// Global variable to hold the initial screen widget
Widget appStartScreen = const LoginPage();

/// Determines and sets the initial screen based on app state
/// Checks onboarding status, login status, and user verification
Future<void> startScreen() async {
  // Initialize app state
  di.sl<MainAppCubit>().isDark = await di.sl<MainSecureStorage>().getIsDark();
  final bool isLoggedIn = await di.sl<MainSecureStorage>().getIsLoggedIn();
  final bool isFirstTime = await di
      .sl<MainSecureStorage>()
      .isOnboardingFinished();
  await di.sl<MainSecureStorage>().getUserId();
  await di.sl<MainSecureStorage>().getUserData();

  // Determine initial screen based on app state
  if (!isFirstTime) {
    appStartScreen = const OnBoardingPage();
  } else if (isLoggedIn) {
    appStartScreen = const LandingPage();
  } else {
    appStartScreen = const LoginRepresentativePage();
  }
}

/// Application entry point
/// Initializes all required services and dependencies before running the app
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Lock device orientation to portrait only
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // Initialize Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Get app version from package info
  final PackageInfo packageInfo = await PackageInfo.fromPlatform();
  AppConst.versionNumber = int.tryParse(packageInfo.buildNumber) ?? 0;

  // Initialize dependency injection
  await di.init();

  // Initialize secure storage
  await SecureBootstrap.run();

  // Initialize localization
  await EasyLocalization.ensureInitialized();

  // Determine initial screen
  await startScreen();

  // Set up BLoC observer for debugging
  Bloc.observer = MyBlocObserver();
  EasyLocalization.logger.enableBuildModes = [];

  // Run the app
  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('ar', 'SA'),
        Locale('ur', 'PK'),
      ],
      path: 'assets/translation',
      startLocale: const Locale('ar', 'SA'),
      child: const MyApp(),
    ),
  );
}
