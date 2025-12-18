import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/themes/colors.dart';
import '../../../../../config/themes/styles.dart';
import '../../../../../core/components/images/custom_asset_svg_image.dart';
import '../../../../../core/components/utils/custom_rounded_container.dart';
import '../../../../../core/extensions/widgets_extensions.dart';
import '../../../../../core/res/app_images.dart';
import '../../../../../core/utils/app_sizes.dart';

class FinancialSummaryCard extends StatelessWidget {
  final double totalReceived;
  final double totalExpenses;
  final double remaining;

  const FinancialSummaryCard({
    super.key,
    required this.totalReceived,
    required this.totalExpenses,
    required this.remaining,
  });

  @override
  Widget build(BuildContext context) {
    return CustomRoundedContainer(
      child: Column(
        children: [
          SummaryRow(
            titleKey: 'total_received_return',
            value: '${totalReceived.toStringAsFixed(0)} ج.م',
            iconPath: AssetImagesPath.wallet,
            valueColor: AppColors.cNotificationTap,
          ),
          const Divider(height: 28),
          SummaryRow(
            titleKey: 'total_expenses',
            value: '${totalExpenses.toStringAsFixed(0)} ج.م',
            iconPath: AssetImagesPath.approveOrder,
            valueColor: AppColors.cNotificationTap,
          ),
          const Divider(height: 28),
          SummaryRow(
            titleKey: 'remaining_balance',
            value: '${remaining.toStringAsFixed(0)} ج.م',
            iconPath: AssetImagesPath.calc,
            valueColor: AppColors.cPrimary.withValues(alpha: .10),
          ),
        ],
      ),
    );
  }
}

class SummaryRow extends StatelessWidget {
  final String titleKey;
  final String value;
  final String iconPath;
  final Color valueColor;

  const SummaryRow({
    super.key,
    required this.titleKey,
    required this.value,
    required this.iconPath,
    required this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 24.r,
          backgroundColor: valueColor,
          child: CustomAssetSvgImage(
            iconPath,
            color: AppColors.cDarkBlueColor,
            height: 25.h,
          ),
        ),
        AppPadding.padding12.sizedWidth,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                titleKey,
                style: AppStyles.subtitle500.copyWith(
                  fontSize: AppFontSize.f14,
                  color: AppColors.cTextSubtitleLight,
                ),
                textAlign: TextAlign.right,
              ).tr(),
              AppPadding.padding6.sizedHeight,
              Text(
                value,
                style: AppStyles.title700.copyWith(fontSize: AppFontSize.f15),
                textAlign: TextAlign.left,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
