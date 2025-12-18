import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/themes/colors.dart';
import '../../../../../config/themes/styles.dart';
import '../../../../../core/components/images/custom_asset_svg_image.dart';
import '../../../../../core/extensions/widgets_extensions.dart';
import '../../../../../core/res/app_images.dart';
import '../../../../../core/utils/app_sizes.dart';
import '../../../../core/components/utils/custom_rounded_container.dart';

class ExpensesSummaryCard extends StatelessWidget {
  final double totalAmount;
  final int totalCount;

  const ExpensesSummaryCard({
    super.key,
    required this.totalAmount,
    required this.totalCount,
  });

  @override
  Widget build(BuildContext context) {
    return CustomRoundedContainer(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: Row(
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CircleAvatar(
                  backgroundColor: AppColors.cPrimary.withValues(alpha: .1),
                  radius: 27.r,
                  child: CustomAssetSvgImage(
                    AssetImagesPath.dollar,
                    color: AppColors.cPrimary,
                    height: 22.h,
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        'this_month_total_expenses',
                        style: AppStyles.subtitle400.copyWith(
                          fontSize: AppFontSize.f12,
                          color: AppColors.cTextSubtitleLight,
                        ),
                      ).tr(),
                      AppPadding.padding8.sizedHeight,
                      Text(
                        '${totalAmount.toStringAsFixed(0)} ج.م',
                        style: AppStyles.title700.copyWith(
                          fontSize: AppFontSize.f16,
                          color: AppColors.cPrimary,
                        ),
                        textAlign: TextAlign.right,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          AppPadding.padding12.sizedWidth,
          Container(width: 1, height: 50, color: AppColors.cDividerLight),
          AppPadding.padding12.sizedWidth,
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CircleAvatar(
                  backgroundColor: AppColors.cPrimary.withValues(alpha: .1),
                  radius: 27.r,
                  child: const CustomAssetSvgImage(AssetImagesPath.file),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        'registered_expenses_count',
                        style: AppStyles.subtitle400.copyWith(
                          fontSize: AppFontSize.f12,
                          color: AppColors.cTextSubtitleLight,
                        ),
                      ).tr(),
                      AppPadding.padding8.sizedHeight,
                      Text(
                        '${totalCount.toStringAsFixed(0)} ج.م',
                        style: AppStyles.title700.copyWith(
                          fontSize: AppFontSize.f16,
                          color: AppColors.cPrimary,
                        ),
                        textAlign: TextAlign.right,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
