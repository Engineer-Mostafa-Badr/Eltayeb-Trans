import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eltyp_delivery/core/components/scaffold/shared_home_scaffold.dart';
import 'package:eltyp_delivery/core/extensions/widgets_extensions.dart';
import 'package:eltyp_delivery/core/res/app_images.dart';
import 'package:eltyp_delivery/core/utils/app_sizes.dart';
import 'package:eltyp_delivery/features/auth/presentation/bloc/login/login_bloc.dart';
import 'package:eltyp_delivery/features/auth/presentation/widgets/auth_toggle_container.dart';
import 'package:eltyp_delivery/features/auth/presentation/widgets/login_with_phone_body.dart';
import 'package:eltyp_delivery/features/injection_container.dart';

import '../widgets/login_title_section.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, this.startReturnScreen = false});

  final bool startReturnScreen;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  AuthToggleType authToggleType = AuthToggleType.login_with_phone;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<LoginBloc>(),
      child: SharedHomeScaffold(
        title: 'login',
        body: ListView(
          padding: const EdgeInsetsDirectional.only(
            start: AppPadding.largePadding,
            end: AppPadding.largePadding,
          ),
          children: [
            Image.asset(AssetImagesPath.appLogo),
            const Center(child: LoginTitleSection()),
            80.sizedHeight,
            LoginWithPhoneBody(startReturnScreen: widget.startReturnScreen),
          ],
        ),
      ),
    );
  }
}
