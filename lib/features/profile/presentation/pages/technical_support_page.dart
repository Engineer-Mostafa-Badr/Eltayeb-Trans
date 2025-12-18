import 'package:easy_localization/easy_localization.dart';
import 'package:eltyp_delivery/core/components/images/custom_asset_svg_image.dart';
import 'package:eltyp_delivery/core/extensions/navigation_extensions.dart';
import 'package:eltyp_delivery/core/extensions/widgets_extensions.dart';
import 'package:eltyp_delivery/core/res/app_images.dart';
import 'package:eltyp_delivery/features/profile/presentation/pages/technical_support_tickets_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/themes/colors.dart';
import '../../../../config/themes/styles.dart';
import '../../../../core/components/buttons/outlined_button.dart';
import '../../../../core/components/scaffold/shared_home_scaffold.dart';
import '../../../../core/components/utils/custom_rounded_container.dart';
import '../../../../core/utils/app_sizes.dart';

class TechnicalSupportPage extends StatelessWidget {
  const TechnicalSupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SharedHomeScaffold(
      title: 'support_and_help',
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.padding30,
          vertical: AppPadding.padding16,
        ),
        child: CustomRoundedContainer(
          padding: const EdgeInsets.symmetric(
            horizontal: AppPadding.mediumPadding,
            vertical: AppPadding.padding20,
          ),
          color: AppColors.cPrimary.withValues(alpha: .2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'contact_us',
                style: AppStyles.title700.copyWith(
                  fontSize: AppFontSize.f16,
                  color: AppColors.cDarkBlueColor,
                ),
                textAlign: TextAlign.center,
              ).tr(),
              AppPadding.padding10.sizedHeight,
              Text(
                'for_quick_support_please_contact_the_support_team',
                style: AppStyles.subtitle500.copyWith(
                  fontSize: 13,
                  color: AppColors.cTextSubtitleLight,
                ),
                textAlign: TextAlign.center,
              ).tr(),
              AppPadding.padding20.sizedHeight,
              const SupportContactRow(value: '+201273747262', icon: AssetImagesPath.call),
              AppPadding.padding14.sizedHeight,
              const SupportContactRow(
                value: 'Khaled@domain.com',
                icon: AssetImagesPath.circumstance,
              ),
              AppPadding.padding24.sizedHeight,
              ReusedOutlinedButton(
                height: 60.h,
                text: 'open_technical_ticket',
                rowWidget: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 40.h,
                      height: 40.h,
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: .2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const FittedBox(
                        fit: BoxFit.scaleDown,
                        child: CustomAssetSvgImage(AssetImagesPath.chatIcon),
                      ),
                    ),
                    8.sizedWidth,
                    Text(
                      'open_technical_ticket',
                      style: AppStyles.title700.copyWith(
                        fontSize: AppFontSize.f16,
                        color: Colors.white,
                      ),
                    ).tr(),
                  ],
                ),
                onPressed: () => context.navigateToPage(const TechnicalSupportTicketsPage()),
                color: AppColors.cPrimary,
                textColor: Colors.white,
                fontSize: AppFontSize.f16,
              ),
              10.sizedHeight,
            ],
          ),
        ),
      ),
    );
  }
}

class SupportContactRow extends StatelessWidget {
  final String value;
  final String icon;

  const SupportContactRow({super.key, required this.value, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppBorderRadius.radius16),
      ),
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.mediumPadding),
      child: Row(
        children: [
          60.sizedWidth,
          Container(
            width: 40.h,
            height: 40.h,
            decoration: BoxDecoration(
              color: AppColors.cPrimary.withValues(alpha: .08),
              borderRadius: BorderRadius.circular(12),
            ),
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: CustomAssetSvgImage(icon, height: 20.h, color: AppColors.cPrimary),
            ),
          ),
          AppPadding.padding12.sizedWidth,
          Text(
            value,
            style: AppStyles.title600.copyWith(
              fontSize: AppFontSize.f14,
              color: AppColors.cDarkBlueColor,
            ),
            textAlign: TextAlign.left,
          ),
        ],
      ),
    );
  }
}
