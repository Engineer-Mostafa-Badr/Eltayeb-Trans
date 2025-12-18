import 'package:eltyp_delivery/core/extensions/navigation_extensions.dart';
import 'package:eltyp_delivery/features/home/presentation/pages/flight_delivery_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/themes/colors.dart';
import '../../../../../config/themes/styles.dart';
import '../../../../../core/components/buttons/outlined_button.dart';
import '../../../../../core/utils/app_sizes.dart';

class TripDetailsBottomActionsSection extends StatelessWidget {
  const TripDetailsBottomActionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 15.h, bottom: 35.h),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: AppStyles.secondUsedBoxShadow(opacity: 0.08),
      ),
      child: Row(
        children: [
          Expanded(
            child: ReusedOutlinedButton(
              text: 'adding_expenses',
              onPressed: () {},
              color: AppColors.cPrimary,
              textStyle: AppStyles.title700.copyWith(
                color: Colors.white,
                fontSize: AppFontSize.f14,
              ),
              height: 48.h,
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: ReusedOutlinedButton(
              text: 'flight_delivery',
              onPressed: () {
                context.navigateToPage(const DeliverTripPage());
              },
              borderColor: AppColors.cDarkBlueColor,
              textColor: AppColors.cDarkBlueColor,
            ),
          ),
        ],
      ),
    );
  }
}
