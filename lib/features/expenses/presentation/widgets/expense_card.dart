import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/themes/colors.dart';
import '../../../../../config/themes/styles.dart';
import '../../../../../core/components/images/custom_asset_svg_image.dart';
import '../../../../../core/extensions/widgets_extensions.dart';
import '../../../../../core/res/app_images.dart';
import '../../../../../core/utils/app_sizes.dart';
import '../pages/my_expenses_page.dart';

class ExpenseCard extends StatelessWidget {
  final ExpenseItem item;

  const ExpenseCard({super.key, required this.item});

  Color _statusColor() {
    switch (item.status) {
      case ExpenseStatus.underReview:
        return const Color(0xFF3478F6);
      case ExpenseStatus.accepted:
        return const Color(0xFF1ABC9C);
      case ExpenseStatus.rejected:
        return const Color(0xFFE53935);
    }
  }

  Color _statusBackground() {
    switch (item.status) {
      case ExpenseStatus.underReview:
        return const Color(0xFFE6EEFF);
      case ExpenseStatus.accepted:
        return const Color(0xFFE4F8F0);
      case ExpenseStatus.rejected:
        return const Color(0xFFFFE6E6);
    }
  }

  String _statusText() {
    switch (item.status) {
      case ExpenseStatus.underReview:
        return 'under_review';
      case ExpenseStatus.accepted:
        return 'accepted';
      case ExpenseStatus.rejected:
        return 'rejected';
    }
  }

  Color _imageBorderColor() {
    if (item.status == ExpenseStatus.rejected) {
      return const Color(0xFFFFC3C3);
    }
    return AppColors.cFillBorderLight;
  }

  Color _imageBackgroundColor() {
    if (item.status == ExpenseStatus.rejected) {
      return const Color(0xFFFFF5F5);
    }
    return const Color(0xFFF5F5F5);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.largePadding, vertical: AppPadding.padding16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppBorderRadius.radius20),
        boxShadow: AppStyles.secondUsedBoxShadow(opacity: 0.06),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 46.r,
            height: 46.r,
            decoration: BoxDecoration(
              color: _imageBackgroundColor(),
              borderRadius: BorderRadius.circular(AppBorderRadius.radius12),
              border: Border.all(color: _imageBorderColor()),
            ),
            child: const Center(child: CustomAssetSvgImage(AssetImagesPath.noImage)),
          ),
          AppPadding.padding12.sizedWidth,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      item.title,
                      style: AppStyles.title700.copyWith(fontSize: AppFontSize.f18, color: AppColors.cDarkBlueColor),
                      textAlign: TextAlign.right,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: AppPadding.padding10, vertical: AppPadding.padding8),
                      decoration: BoxDecoration(color: _statusBackground(), borderRadius: BorderRadius.circular(10.r)),
                      child: Text(_statusText(), style: AppStyles.subtitle600.copyWith(fontSize: 11, color: _statusColor())).tr(),
                    ),
                  ],
                ),
                AppPadding.padding12.sizedHeight,
                Text(
                  '${item.amount.toStringAsFixed(0)} ${item.currency}',
                  style: AppStyles.title700.copyWith(fontSize: AppFontSize.f20, color: AppColors.cPrimary),
                  textAlign: TextAlign.right,
                ),
                AppPadding.padding8.sizedHeight,
                Row(
                  children: [
                    const Icon(Icons.calendar_today_outlined, color: AppColors.cTextSubtitleLight),
                    6.sizedWidth,
                    Text(item.dateLabel, style: AppStyles.subtitle400.copyWith(fontSize: 13, color: AppColors.cTextSubtitleLight)),
                    16.sizedWidth,
                    const CustomAssetSvgImage(AssetImagesPath.track, color: AppColors.cTextSubtitleLight),
                    6.sizedWidth,
                    Text(item.tripNumberLabel, style: AppStyles.subtitle400.copyWith(fontSize: 13, color: AppColors.cTextSubtitleLight)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
