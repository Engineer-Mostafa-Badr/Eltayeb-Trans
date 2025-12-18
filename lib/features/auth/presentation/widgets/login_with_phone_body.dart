import 'package:easy_localization/easy_localization.dart';
import 'package:eltyp_delivery/config/themes/colors.dart';
import 'package:eltyp_delivery/core/components/buttons/outlined_button.dart';
import 'package:eltyp_delivery/core/enum/enums.dart';
import 'package:eltyp_delivery/core/extensions/navigation_extensions.dart';
import 'package:eltyp_delivery/core/extensions/widgets_extensions.dart';
import 'package:eltyp_delivery/core/utils/app_sizes.dart';
import 'package:eltyp_delivery/core/utils/other_helpers.dart';
import 'package:eltyp_delivery/features/auth/domain/entities/login_params.dart';
import 'package:eltyp_delivery/features/auth/presentation/bloc/login/login_bloc.dart';
import 'package:eltyp_delivery/features/auth/presentation/pages/verification_code_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/themes/styles.dart';
import 'login_phone_field_section.dart';

class LoginWithPhoneBody extends StatefulWidget {
  const LoginWithPhoneBody({super.key, this.startReturnScreen = false});

  final bool startReturnScreen;

  @override
  State<LoginWithPhoneBody> createState() => _LoginWithPhoneBodyState();
}

class _LoginWithPhoneBodyState extends State<LoginWithPhoneBody> {
  late final TextEditingController _phoneController;
  late final GlobalKey<FormState> _formKey;

  @override
  void initState() {
    super.initState();
    _phoneController = TextEditingController()..text = kDebugMode ? '201022222222' : '';
    _formKey = GlobalKey<FormState>();
  }

  @override
  void dispose() {
    _phoneController.dispose();
    _formKey.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          LoginPhoneFieldSection(controller: _phoneController),
          AppPadding.padding30.sizedHeight,
          BlocConsumer<LoginBloc, LoginState>(
            buildWhen: (previous, current) {
              return previous.requestState != current.requestState;
            },
            listener: (context, state) {
              if (state.requestState == RequestState.loaded) {
                OtherHelper.showTopSuccessToast(state.response.msg!);
                context.navigateToPage(
                  VerificationCodePage(
                    phone: _phoneController.text,
                    startReturnScreen: widget.startReturnScreen,
                  ),
                );
              } else if (state.requestState == RequestState.error) {
                OtherHelper.showTopFailToast(state.response.msg);
              }
            },
            builder: (context, state) {
              final loginBloc = LoginBloc.get(context);
              return ReusedOutlinedButton(
                width: double.maxFinite,
                height: 60.h,
                text: 'sent_otp',
                isLoading: state.requestState == RequestState.loading,
                color: AppColors.cPrimary,
                textColor: Colors.white,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    loginBloc.add(
                      LoginButtonPressedEvent(LoginParameters(phone: _phoneController.text)),
                    );
                  }
                },
              );
            },
          ),
          31.sizedHeight,
          Center(
            child: Text(
              'will_sect_you_a_code',
              style: AppStyles.subtitle400.copyWith(fontSize: AppFontSize.f14),
            ).tr(),
          ),
        ],
      ),
    );
  }
}
