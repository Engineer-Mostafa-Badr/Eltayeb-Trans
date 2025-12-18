import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/themes/colors.dart';
import '../../../../config/themes/styles.dart';
import '../../../../core/extensions/widgets_extensions.dart';
import '../../../../core/utils/app_sizes.dart';

class TabItem extends StatelessWidget {
  final String text;
  final int count;
  final bool isSelected;
  final VoidCallback onTap;

  const TabItem({super.key, required this.text, required this.count, required this.isSelected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.cPrimary : Colors.transparent,
            borderRadius: BorderRadius.circular(AppBorderRadius.radius30),
          ),
          child: Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (count > 0) ...[
                  Container(
                    padding: EdgeInsets.only(left: 6.w, right: 6.w, top: 4.h),
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.white : AppColors.cPrimary,
                      borderRadius: BorderRadius.circular(AppBorderRadius.radius30),
                    ),
                    child: Text(
                      '$count',
                      style: AppStyles.title700.copyWith(fontSize: AppFontSize.f11, color: isSelected ? AppColors.cPrimary : Colors.white),
                    ),
                  ),
                  AppPadding.padding6.sizedWidth,
                ],
                Text(
                  text.tr(),
                  style: AppStyles.title700.copyWith(fontSize: AppFontSize.f14, color: isSelected ? Colors.white : AppColors.cTextSubtitleLight),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
