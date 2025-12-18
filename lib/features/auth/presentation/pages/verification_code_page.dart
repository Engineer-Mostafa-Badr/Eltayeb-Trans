import 'package:easy_localization/easy_localization.dart';
import 'package:eltyp_delivery/config/themes/colors.dart';
import 'package:eltyp_delivery/config/themes/styles.dart';
import 'package:eltyp_delivery/core/components/buttons/back_icon_button.dart';
import 'package:eltyp_delivery/core/components/buttons/outlined_button.dart';
import 'package:eltyp_delivery/core/components/scaffold/shared_home_scaffold.dart';
import 'package:eltyp_delivery/core/components/textformfields/pin_textformfield.dart';
import 'package:eltyp_delivery/core/components/utils/resend_rich_button.dart';
import 'package:eltyp_delivery/core/enum/enums.dart';
import 'package:eltyp_delivery/core/extensions/navigation_extensions.dart';
import 'package:eltyp_delivery/core/extensions/widgets_extensions.dart';
import 'package:eltyp_delivery/core/utils/app_const.dart';
import 'package:eltyp_delivery/core/utils/app_sizes.dart';
import 'package:eltyp_delivery/core/utils/other_helpers.dart';
import 'package:eltyp_delivery/features/auth/domain/entities/login_params.dart';
import 'package:eltyp_delivery/features/auth/domain/use_cases/verify_use_case.dart';
import 'package:eltyp_delivery/features/auth/presentation/bloc/login/login_bloc.dart';
import 'package:eltyp_delivery/features/injection_container.dart';
import 'package:eltyp_delivery/features/landing/presentation/pages/landing_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/res/app_images.dart';

class VerificationCodePage extends StatefulWidget {
  const VerificationCodePage({
    super.key,
    this.phone = '',
    this.startReturnScreen = false,
  });

  final bool startReturnScreen;
  final String phone;

  @override
  State<VerificationCodePage> createState() => _VerificationCodePageState();
}

class _VerificationCodePageState extends State<VerificationCodePage> {
  late final TextEditingController _codeController;

  @override
  void initState() {
    super.initState();
    _codeController = TextEditingController()..text = kDebugMode ? '9999' : '';
  }

  @override
  void dispose() {
    _codeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<LoginBloc>(),
      child: SharedHomeScaffold(
        body: BlocConsumer<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state.verifyRequestState == RequestState.loaded) {
              AppConst.isLogin = true;
              OtherHelper.showTopSuccessToast(state.verifyResponse.msg!);
              if (widget.startReturnScreen) {
                Navigator.of(context).pop(true);
                Navigator.of(context).pop(true);
              } else {
                context.navigateToPageWithClearStack(const LandingPage());
              }
            } else if (state.verifyRequestState == RequestState.error) {
              OtherHelper.showTopFailToast(state.verifyResponse.msg);
            }

            if (state.resendRequestState == RequestState.loaded) {
              OtherHelper.showTopSuccessToast(state.resendResponse.msg!);
            } else if (state.resendRequestState == RequestState.error) {
              OtherHelper.showTopFailToast(state.resendResponse.msg);
            }
          },
          builder: (context, state) {
            final loginBloc = LoginBloc.get(context);
            return ListView(
              padding: const EdgeInsets.all(AppPadding.padding32),
              children: [
                Row(
                  children: [
                    const BackIconButton(),
                    SizedBox(width: 40.w),
                    Image.asset(AssetImagesPath.appLogo),
                  ],
                ),
                80.sizedHeight,
                Text(
                  'enter_verification_code',
                  textAlign: TextAlign.center,
                  style: AppStyles.title700.copyWith(
                    fontSize: AppFontSize.f32,
                    color: AppColors.cDarkBlueColor,
                  ),
                ).tr(),
                Text(
                  'we_sent_the_otp_to'.tr(namedArgs: {'phone': widget.phone}),
                  textAlign: TextAlign.center,
                  style: AppStyles.subtitle400.copyWith(
                    fontSize: AppFontSize.f15,
                  ),
                ),
                26.sizedHeight,
                PinTextFormField(
                  controller: _codeController,
                  onChanged: (value) {},
                  onComplete: (value) {
                    loginBloc.add(
                      VerifyButtonPressedEvent(
                        VerifyParams(
                          phone: widget.phone,
                          code: _codeController.text,
                        ),
                      ),
                    );
                  },
                ),
                58.sizedHeight,
                ResendRichButton(
                  onPressed: () {
                    loginBloc.add(
                      ResendCodeButtonPressedEvent(
                        LoginParameters(phone: widget.phone),
                      ),
                    );
                  },
                ),
                50.sizedHeight,
                ReusedOutlinedButton(
                  text: 'check',
                  textColor: Colors.white,
                  fontSize: AppFontSize.f18,
                  color: AppColors.cPrimary,
                  isLoading: state.verifyRequestState == RequestState.loading,
                  onPressed: () {
                    if (_codeController.text.isEmpty) {
                      OtherHelper.showTopInfoToast(
                        'please_enter_verification_code',
                      );
                      return;
                    }
                    loginBloc.add(
                      VerifyButtonPressedEvent(
                        VerifyParams(
                          phone: widget.phone,
                          code: _codeController.text,
                        ),
                      ),
                    );
                  },
                ),
                50.sizedHeight,
                const OtpSecurityHintSection(),
              ],
            );
          },
        ),
      ),
    );
  }
}

class OtpSecurityHintSection extends StatelessWidget {
  const OtpSecurityHintSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 21),
      decoration: BoxDecoration(
        color: AppColors.greyF9Color,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.cPinColor),
        boxShadow: AppStyles.secondUsedBoxShadow(opacity: 0.06),
      ),
      child: Text(
        'security_of_your_account',
        textAlign: TextAlign.center,
        style: AppStyles.subtitle400,
      ).tr(),
    );
  }
}
