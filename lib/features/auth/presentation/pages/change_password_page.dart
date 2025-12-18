import 'package:easy_localization/easy_localization.dart';
import 'package:eltyp_delivery/core/components/scaffold/shared_home_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:eltyp_delivery/config/themes/colors.dart';
import 'package:eltyp_delivery/config/themes/styles.dart';
import 'package:eltyp_delivery/core/components/buttons/rounded_button.dart';
import 'package:eltyp_delivery/core/components/textformfields/reused_textformfield.dart';
import 'package:eltyp_delivery/core/components/utils/widgets.dart';
import 'package:eltyp_delivery/core/extensions/widgets_extensions.dart';
import 'package:eltyp_delivery/core/res/app_images.dart';
import 'package:eltyp_delivery/core/utils/app_sizes.dart';

class ChangePasswordPage extends StatelessWidget {
  const ChangePasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SharedHomeScaffold(
      title: 'change_password',
      body: ListView(
        padding: const EdgeInsets.all(AppPadding.largePadding * 2),
        children: [
          const AssetSvgImage(AssetImagesPath.loginSVG),
          66.sizedHeight,
          Text(
            'enter_new_password',
            textAlign: TextAlign.center,
            style: AppStyles.title500.copyWith(
              fontSize: AppFontSize.f16,
              color: AppColors.cPrimary,
            ),
          ).tr(),
          30.sizedHeight,
          const ReusedTextFormField(hintText: 'password', title: 'password'),
          AppPadding.largePadding.sizedHeight,
          const ReusedTextFormField(
            hintText: 'confirm_password',
            title: 'confirm_password',
          ),
          AppPadding.largePadding.sizedHeight,
          ReusedRoundedButton(text: 'change_password', onPressed: () {}),
        ],
      ),
    );
  }
}
