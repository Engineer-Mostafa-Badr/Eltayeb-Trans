import 'package:easy_localization/easy_localization.dart';
import 'package:eltyp_delivery/config/navigator_key/navigator_key.dart';
import 'package:eltyp_delivery/core/components/utils/close_keyboard.dart';
import 'package:eltyp_delivery/core/extensions/navigation_extensions.dart';
import 'package:eltyp_delivery/core/services/notifications_handler/firebase_notification_handler_plus.dart';
import 'package:eltyp_delivery/core/utils/delay_login.dart';
import 'package:eltyp_delivery/core/utils/most_used_functions.dart';
import 'package:eltyp_delivery/core/utils/responsive_helper.dart';
import 'package:eltyp_delivery/features/home/presentation/bloc/drivers_bloc.dart';
import 'package:eltyp_delivery/features/home/presentation/bloc/trips_bloc.dart';
import 'package:eltyp_delivery/features/home/presentation/bloc/trucks_bloc.dart';
import 'package:eltyp_delivery/features/injection_container.dart' as di;
import 'package:eltyp_delivery/features/notifications/presentation/pages/notifications_representative_page.dart';
import 'package:eltyp_delivery/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:eltyp_delivery/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'config/themes/dark.dart';
import 'config/themes/light.dart';
import 'core/cubit/app_cubit.dart';
import 'core/utils/app_const.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MainAppCubit>(
          create: (context) => di.sl<MainAppCubit>()..checkInternetConnection(),
        ),
        BlocProvider(
          create: (context) =>
              di.sl<ProfileBloc>()..add(const GetProfileEvent()),
        ),
        BlocProvider(create: (context) => di.sl<TripsBloc>()),
        BlocProvider(create: (context) => di.sl<DriversBloc>()),
        BlocProvider(create: (context) => di.sl<TrucksBloc>()),
      ],
      child: FirebaseNotificationsHandlerPlus(
        defaultNavigatorKey: NavigatorKey.navigatorKey,

        notificationIdCallback: (RemoteMessage message) {
          return DateTime.now().millisecondsSinceEpoch ~/ 1000;
        },

        onTap: (navigatorKey, appState, payload) async {
          CheckLoginDelay.checkIfNeedLogin(
            onExecute: () {
              final ctx = navigatorKey.currentContext;
              if (ctx != null) {
                ctx.navigateToPage(const NotificationsRepresentativePage());
              }
            },
          );
        },

        onFCMTokenInitialize: (context, token) {
          MostUsedFunctions.subscribeToTopic();
        },

        child: ScreenUtilInit(
          minTextAdapt: true,
          splitScreenMode: true,
          designSize:
              ResponsiveHelper.isTablet(context) ||
                  ResponsiveHelper.isDesktop(context)
              ? const Size(768, 1024)
              : const Size(414, 896),
          builder: (context, child) {
            return CloseKeyBoardWidget(
              child: MaterialApp(
                title: AppConst.appName,
                navigatorKey: NavigatorKey.navigatorKey,
                localizationsDelegates: context.localizationDelegates,
                supportedLocales: context.supportedLocales,
                locale: context.locale,
                debugShowCheckedModeBanner: false,
                theme: lightTheme(context),
                darkTheme: darkTheme(context),
                themeMode: di.sl<MainAppCubit>().isDark
                    ? ThemeMode.dark
                    : ThemeMode.light,
                home: BlocBuilder<MainAppCubit, MainAppCubitState>(
                  builder: (context, state) {
                    return Center(child: child);
                  },
                ),
              ),
            );
          },
          child: appStartScreen,
        ),
      ),
    );
  }
}
