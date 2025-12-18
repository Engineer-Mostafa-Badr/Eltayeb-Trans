import 'package:easy_localization/easy_localization.dart';
import 'package:eltyp_delivery/core/extensions/widgets_extensions.dart';
import 'package:flutter/material.dart';

import '../../../../../config/themes/colors.dart';
import '../../../../../config/themes/styles.dart';
import '../../../../../core/components/images/custom_asset_svg_image.dart';
import '../../../../../core/components/utils/custom_rounded_container.dart';
import '../../../../../core/res/app_images.dart';
import '../../../../../core/utils/app_sizes.dart';

class TicketDetailsHeaderCard extends StatelessWidget {
  const TicketDetailsHeaderCard({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomRoundedContainer(
      padding: const EdgeInsets.symmetric(
        horizontal: AppPadding.padding24,
        vertical: AppPadding.padding20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Text(
                '#T-10294',
                style: AppStyles.title600.copyWith(fontSize: 13, color: AppColors.cDarkBlueColor),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: AppPadding.padding14, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.cProfileGreen.withValues(alpha: .1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Text(
                      'open',
                      style: AppStyles.title500.copyWith(
                        fontSize: 12,
                        color: AppColors.cProfileGreen,
                      ),
                    ).tr(),
                    4.sizedWidth,
                    const Icon(Icons.check_circle, size: 16, color: AppColors.cProfileGreen),
                  ],
                ),
              ),
            ],
          ),

          const Divider(color: AppColors.cFillTextFieldDark),
          Row(
            children: [
              const CustomAssetSvgImage(AssetImagesPath.calendar),
              AppPadding.padding4.sizedWidth,
              Text(
                '12 يناير 2025',
                style: AppStyles.subtitle500.copyWith(
                  fontSize: 12,
                  color: AppColors.cTextSubtitleLight,
                ),
              ),
              const Spacer(),
              const Icon(Icons.access_time, size: 16, color: AppColors.cTextSubtitleLight),
              AppPadding.padding4.sizedWidth,
              Text(
                'آخر تحديث: منذ 10 دقائق',
                style: AppStyles.subtitle500.copyWith(
                  fontSize: 12,
                  color: AppColors.cTextSubtitleLight,
                ),
              ).tr(),
            ],
          ),
          AppPadding.padding18.sizedHeight,
          Text(
            'لا يمكن تحديث حالة الرحلة',
            style: AppStyles.title500.copyWith(
              fontSize: AppFontSize.f16,
              color: AppColors.cPrimary,
            ),
            textAlign: TextAlign.right,
          ).tr(),
          AppPadding.padding10.sizedHeight,
          Text(
            'حاولت أغير حالة الرحلة  إلى "تم التوصيل" لكن الزر لا يستجيب. أرجو مراجعة المشكلة.',
            style: AppStyles.subtitle500.copyWith(
              fontSize: AppFontSize.f14,
              color: AppColors.cTextSubtitleLight,
            ),
            textAlign: TextAlign.right,
          ).tr(),
        ],
      ),
    );
  }
}
