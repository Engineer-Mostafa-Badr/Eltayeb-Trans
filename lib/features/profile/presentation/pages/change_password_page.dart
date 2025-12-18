/*
import 'package:easy_localization/easy_localization.dart';
import 'package:eltyp_delivery/core/components/buttons/outlined_button.dart';
import 'package:eltyp_delivery/core/res/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/themes/colors.dart';
import '../../../../config/themes/styles.dart';
import '../../../../core/components/images/custom_asset_svg_image.dart';
import '../../../../core/components/scaffold/shared_home_scaffold.dart';
import '../../../../core/components/textformfields/reused_textformfield.dart';
import '../../../../core/components/utils/custom_rounded_container.dart';
import '../../../../core/extensions/widgets_extensions.dart';
import '../../../../core/utils/app_sizes.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final currentPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    currentPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SharedHomeScaffold(
      title: 'change_password',
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.padding30,
          vertical: AppPadding.padding16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomRoundedContainer(
              child: Column(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: const BoxDecoration(
                      color: AppColors.cPrimary,
                      shape: BoxShape.circle,
                    ),
                    child: const Center(
                      child: CustomAssetSvgImage(
                        AssetImagesPath.changePasswordLocker,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  AppPadding.padding16.sizedHeight,
                  Text(
                    'enter_current_and_new_password',
                    style: AppStyles.title600.copyWith(
                      fontSize: AppFontSize.f15,
                      color: AppColors.cDarkBlueColor,
                    ),
                    textAlign: TextAlign.center,
                  ).tr(),
                ],
              ),
            ),

            AppPadding.padding24.sizedHeight,
            ReusedTextFormField(
              controller: currentPasswordController,
              title: 'current_password'.tr(),
              hintText: 'enter_current_password'.tr(),
              isPassword: true,
              withBorder: true,
              textAlign: TextAlign.right,
            ),

            AppPadding.padding24.sizedHeight,
            ReusedTextFormField(
              controller: newPasswordController,
              title: 'new_password'.tr(),
              hintText: 'enter_new_password'.tr(),
              isPassword: true,
              withBorder: true,
              textAlign: TextAlign.right,
            ),

            AppPadding.padding24.sizedHeight,
            ReusedTextFormField(
              controller: confirmPasswordController,
              title: 'confirm_new_password'.tr(),
              hintText: 're_enter_new_password'.tr(),
              isPassword: true,
              withBorder: true,
              textAlign: TextAlign.right,
            ),

            AppPadding.padding32.sizedHeight,
            ReusedOutlinedButton(
              height: 52.h,
              text: 'save_new_password',
              rowWidget: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.check_circle_outline, color: Colors.white),
                  10.sizedWidth,
                  Text(
                    'save_new_password',
                    style: AppStyles.title700.copyWith(
                      fontSize: AppFontSize.f18,
                      color: Colors.white,
                    ),
                  ).tr(),
                ],
              ),
              onPressed: () {},
              color: AppColors.cPrimary,
            ),

            AppPadding.padding20.sizedHeight,
            Container(
              padding: const EdgeInsets.all(AppPadding.padding16),
              decoration: BoxDecoration(
                color: const Color(0xFFFDEEEE),
                borderRadius: BorderRadius.circular(AppBorderRadius.radius16),
                border: Border.all(color: AppColors.cPrimary),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.lock_outline, color: AppColors.cPrimary),
                      10.sizedWidth,
                      Text(
                        'security_tips',
                        style: AppStyles.title700.copyWith(color: AppColors.cPrimary),
                      ).tr(),
                    ],
                  ),
                  AppPadding.padding12.sizedHeight,
                  _securityTip('use_strong_password'),
                  _securityTip('do_not_share_password'),
                  _securityTip('change_password_periodically'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _securityTip(String key) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.circle, size: 6),
          8.sizedWidth,
          Expanded(
            child: Text(
              key,
              style: AppStyles.subtitle500.copyWith(fontSize: 13, color: AppColors.cDarkBlueColor),
              textAlign: TextAlign.right,
            ).tr(),
          ),
        ],
      ),
    );
  }
}
*/
