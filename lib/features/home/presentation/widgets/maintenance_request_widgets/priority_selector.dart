import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/themes/colors.dart';
import '../../../../../config/themes/styles.dart';
import '../../../../../core/utils/app_sizes.dart';

class PrioritySelector extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onChanged;

  const PrioritySelector({super.key, required this.selectedIndex, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    final items = ['low', 'medium', 'high'];

    return Row(
      children: List.generate(items.length, (index) {
        final bool isSelected = selectedIndex == index;
        return Expanded(
          child: GestureDetector(
            onTap: () => onChanged(index),
            child: Container(
              margin: EdgeInsetsDirectional.only(start: index == 0 ? 0 : AppPadding.padding8.w),
              padding: const EdgeInsets.symmetric(vertical: AppPadding.padding10),
              decoration: BoxDecoration(
                color: isSelected ? AppColors.cSecondary : Colors.white,
                borderRadius: BorderRadius.circular(AppBorderRadius.radius10),
                border: Border.all(color: isSelected ? AppColors.cSecondary : AppColors.cFillBorderLight, width: .8),
              ),
              child: Center(
                child: Text(
                  items[index],
                  style: AppStyles.title500.copyWith(fontSize: 13, color: isSelected ? Colors.white : AppColors.cTextSubtitleLight),
                ).tr(),
              ),
            ),
          ),
        );
      }),
    );
  }
}
