import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/themes/colors.dart';
import '../../../../../config/themes/styles.dart';

class ExpensesTabs extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onChanged;

  const ExpensesTabs({super.key, required this.selectedIndex, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    final labels = ['all', 'under_review', 'accepted', 'rejected'];

    return Container(
      height: 48.h,
      decoration: BoxDecoration(color: AppColors.cNotificationTap, borderRadius: BorderRadius.circular(26.r)),
      child: Row(
        children: List.generate(labels.length, (index) {
          final bool isSelected = index == selectedIndex;
          return Expanded(
            child: GestureDetector(
              onTap: () => onChanged(index),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                margin: EdgeInsets.symmetric(horizontal: index == 0 ? 4.w : 0, vertical: 1),
                padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 7.h),
                decoration: BoxDecoration(color: isSelected ? AppColors.cPrimary : Colors.transparent, borderRadius: BorderRadius.circular(26.r)),
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Center(
                    child: Text(
                      labels[index],
                      style: AppStyles.title600.copyWith(fontSize: 14, color: isSelected ? Colors.white : AppColors.cTextSubtitleLight),
                    ).tr(),
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
