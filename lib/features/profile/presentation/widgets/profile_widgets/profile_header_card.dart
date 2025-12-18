import 'package:easy_localization/easy_localization.dart';
import 'package:eltyp_delivery/core/components/utils/custom_rounded_container.dart';
import 'package:eltyp_delivery/core/extensions/navigation_extensions.dart';
import 'package:eltyp_delivery/features/profile/presentation/pages/financial_responsibility_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/themes/colors.dart';
import '../../../../../config/themes/styles.dart';
import '../../../../../core/components/images/custom_asset_svg_image.dart';
import '../../../../../core/extensions/widgets_extensions.dart';
import '../../../../../core/res/app_images.dart';
import '../../../../../core/utils/app_sizes.dart';

class ProfileHeaderCard extends StatelessWidget {
  const ProfileHeaderCard({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomRoundedContainer(
      child: Column(
        children: [
          Container(
            width: 80.r,
            height: 80.r,
            decoration: const BoxDecoration(color: AppColors.cPrimary, shape: BoxShape.circle),
            child: const Center(child: CustomAssetSvgImage(AssetImagesPath.profile)),
          ),
          AppPadding.padding14.sizedHeight,
          Text(
            'خالد عبدالرحمن',
            style: AppStyles.title700.copyWith(fontSize: AppFontSize.f18, color: AppColors.cDarkBlueColor),
          ).tr(),
          AppPadding.padding16.sizedHeight,
          FittedBox(
            child: Row(
              children: [
                 ProfileActionChip(labelKey: 'financial_return',onTap: () => context.navigateToPage(const FinancialReturnPage()),),
                10.sizedWidth,
                const ProfileActionChip(labelKey: 'add_expense'),
                10.sizedWidth,
                const ProfileActionChip(labelKey: 'maintenance_request'),
              ],
            ),
          ),
          AppPadding.padding18.sizedHeight,
          Container(
            padding: const EdgeInsets.symmetric(horizontal: AppPadding.mediumPadding, vertical: AppPadding.padding10),
            decoration: BoxDecoration(color: const Color(0xFFF6F7FB), borderRadius: BorderRadius.circular(AppBorderRadius.radius30)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CustomAssetSvgImage(AssetImagesPath.track,color: AppColors.cPrimary,),
                6.sizedWidth,
                Text('current_truck_info', style: AppStyles.subtitle500.copyWith(fontSize: AppFontSize.f14, color: AppColors.cDarkBlueColor)).tr(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileActionChip extends StatelessWidget {
  final String labelKey;
final void Function()? onTap;
  const ProfileActionChip({super.key, required this.labelKey,this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: AppPadding.padding14, vertical: AppPadding.padding6),
        decoration: BoxDecoration(color: AppColors.cPrimary.withValues(alpha: .1), borderRadius: BorderRadius.circular(AppBorderRadius.radius20)),
        child: Text(labelKey, style: AppStyles.title500.copyWith(fontSize: AppFontSize.f14, color: AppColors.cPrimary)).tr(),
      ),
    );
  }
}
