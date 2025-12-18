import 'package:easy_localization/easy_localization.dart';
import 'package:eltyp_delivery/core/extensions/widgets_extensions.dart';
import 'package:flutter/material.dart';

import '../../../../../config/themes/colors.dart';
import '../../../../../config/themes/styles.dart';
import '../../../../../core/utils/app_sizes.dart';

class WarningBanner extends StatelessWidget {
  const WarningBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.mediumPadding, vertical: AppPadding.padding10),
      decoration: BoxDecoration(
        color: AppColors.cPrimary.withValues(alpha: .05),
        borderRadius: BorderRadius.circular(AppBorderRadius.radius10),
        border: Border.all(color: AppColors.cPrimary.withValues(alpha: .07), width: .7),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.error_outline, color: AppColors.cPrimary, size: 18),
          AppPadding.padding10.sizedWidth,
          Expanded(
            child: Text(
              "Enter_the_car's_odometer_reading_and_take_a_clear_picture_of\n_the_odometer_to_complete_the_delivery.",
              style: AppStyles.subtitle500.copyWith(color: const Color(0xFF7B1F1F), fontSize: 11),
              textAlign: TextAlign.right,
            ).tr(),
          ),
        ],
      ),
    );
  }
}
