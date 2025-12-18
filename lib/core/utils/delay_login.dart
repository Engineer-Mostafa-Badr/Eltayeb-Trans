import 'package:eltyp_delivery/config/navigator_key/navigator_key.dart';
import 'package:eltyp_delivery/core/extensions/navigation_extensions.dart';
import 'package:eltyp_delivery/core/extensions/shared_extensions.dart';
import 'package:eltyp_delivery/core/storage/main_hive_box.dart';
import 'package:eltyp_delivery/core/utils/app_const.dart';
import 'package:eltyp_delivery/features/auth/presentation/pages/login_page.dart';
import 'package:eltyp_delivery/features/injection_container.dart';
import 'package:eltyp_delivery/features/profile/presentation/bloc/profile_bloc.dart';

Future<dynamic> goToLoginAndBackToContinue() async {
  return NavigatorKey.context.navigateToPage(
    const LoginPage(startReturnScreen: true),
  );
}

class CheckLoginDelay {
  static void checkIfNeedLogin({required Function() onExecute}) async {
    final isLogin = await sl<MainSecureStorage>().getIsLoggedIn();
    if (isLogin) {
      onExecute.call();
    } else {
      'login_to_continue'.showTopInfoToast;
      await goToLoginAndBackToContinue().then((value) {
        if (value != null) {
          // NavigatorKey.context.navigateToPageWithClearStack(
          //   const LandingPage(),
          // );
         // HomeBloc.get(NavigatorKey.context).add(const GetQuestionsEvent());
          if (AppConst.isLogin) {
            ProfileBloc.get(NavigatorKey.context).add(const GetProfileEvent());
          }
          onExecute.call();
        }
      });
    }
  }
}
