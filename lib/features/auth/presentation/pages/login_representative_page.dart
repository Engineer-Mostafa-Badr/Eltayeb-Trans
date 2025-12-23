import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../config/themes/colors.dart';
import '../../../injection_container.dart' as di;
import '../bloc/login/login_bloc.dart';
import '../widgets/login_representative_form.dart';
import '../widgets/login_representative_header.dart';
import '../widgets/login_representative_listener.dart';

class LoginRepresentativePage extends StatelessWidget {
  const LoginRepresentativePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.sl<LoginBloc>(),
      child: LoginRepresentativeListener(
        child: Scaffold(
          backgroundColor: AppColors.greyFAColor,
          body: SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.07,
              ),
              child: const Column(
                children: [
                  LoginRepresentativeHeader(),
                  LoginRepresentativeForm(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
