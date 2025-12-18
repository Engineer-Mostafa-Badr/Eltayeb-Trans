import 'package:easy_localization/easy_localization.dart';
import 'package:eltyp_delivery/core/components/utils/custom_rounded_container.dart';
import 'package:eltyp_delivery/core/extensions/navigation_extensions.dart';
import 'package:eltyp_delivery/features/profile/presentation/pages/documents_page.dart';
import 'package:eltyp_delivery/features/profile/presentation/pages/technical_support_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/themes/colors.dart';
import '../../../../../config/themes/styles.dart';
import '../../../../../core/components/images/custom_asset_svg_image.dart';
import '../../../../../core/extensions/widgets_extensions.dart';
import '../../../../../core/res/app_images.dart';
import '../../../../../core/utils/app_sizes.dart';

class QuickActionsCard extends StatelessWidget {
  const QuickActionsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomRoundedContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'quick_actions',
            style: AppStyles.title700.copyWith(fontSize: AppFontSize.f16, color: AppColors.cDarkBlueColor),
            textAlign: TextAlign.right,
          ).tr(),
          AppPadding.padding16.sizedHeight,
           QuickActionRow(onTap: () =>context.navigateToPage(const DocumentsPage()) ,titleKey: 'driver_documents', subtitleKey: 'driver_documents_subtitle', iconPath: AssetImagesPath.emptyFile,),
          const Divider(height: 26),
           QuickActionRow(onTap: () => context.navigateToPage(const TechnicalSupportPage()),titleKey: 'technical_support', subtitleKey: 'technical_support_subtitle', iconPath: AssetImagesPath.headPhone),
        ],
      ),
    );
  }
}

class QuickActionRow extends StatelessWidget {
  final String titleKey;
  final String subtitleKey;
  final String iconPath;
  final void Function()? onTap;
  const QuickActionRow({super.key, required this.titleKey, required this.subtitleKey, required this.iconPath, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: AppColors.cPrimary.withValues(alpha: .1),
            radius: 25.r,
            child: CustomAssetSvgImage(iconPath, color: AppColors.cPrimary),
          ),
          10.sizedWidth,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  titleKey,
                  style: AppStyles.title700.copyWith(fontSize: AppFontSize.f15,),
                  textAlign: TextAlign.right,
                ).tr(),
                AppPadding.padding6.sizedHeight,
                Text(
                  subtitleKey,
                  style: AppStyles.subtitle400.copyWith(fontSize: AppFontSize.f13, color: AppColors.cTextSubtitleLight),
                  textAlign: TextAlign.right,
                ).tr(),
              ],
            ),
          ),
          AppPadding.padding10.sizedWidth,
          const Icon(Icons.arrow_forward_ios_rounded, size: 16, color: AppColors.cTextSubtitleLight),
        ],
      ),
    );
  }
}
