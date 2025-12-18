import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/themes/colors.dart';
import '../../../../config/themes/styles.dart';
import '../../../../core/utils/app_sizes.dart';

class TripProgressSection extends StatelessWidget {
  final bool createdActive;
  final bool onRoadActive;
  final bool deliveredActive;

  const TripProgressSection({
    super.key,
    required this.createdActive,
    required this.onRoadActive,
    required this.deliveredActive,
  });

  @override
  Widget build(BuildContext context) {
    final bool lineCreatedOnRoadActive = createdActive && onRoadActive;
    final bool lineOnRoadDeliveredActive = onRoadActive && deliveredActive;

    return Column(
      children: [
        TripProgressCirclesRow(
          createdActive: createdActive,
          onRoadActive: onRoadActive,
          deliveredActive: deliveredActive,
          lineCreatedOnRoadActive: lineCreatedOnRoadActive,
          lineOnRoadDeliveredActive: lineOnRoadDeliveredActive,
        ),
        SizedBox(height: 4.h),
        TripProgressLabelsRow(
          createdActive: createdActive,
          onRoadActive: onRoadActive,
          deliveredActive: deliveredActive,
        ),
      ],
    );
  }
}

class TripProgressCirclesRow extends StatelessWidget {
  final bool createdActive;
  final bool onRoadActive;
  final bool deliveredActive;
  final bool lineCreatedOnRoadActive;
  final bool lineOnRoadDeliveredActive;

  const TripProgressCirclesRow({
    super.key,
    required this.createdActive,
    required this.onRoadActive,
    required this.deliveredActive,
    required this.lineCreatedOnRoadActive,
    required this.lineOnRoadDeliveredActive,
  });

  @override
  Widget build(BuildContext context) {
    const Color activeColor = AppColors.cSuccess;
    const Color inactiveColor = AppColors.cPinColor;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.padding12),
      child: Row(
        children: [
          TripProgressCircle(isActive: createdActive),
          Expanded(
            child: Container(
              height: 3.h,
              color: lineCreatedOnRoadActive ? activeColor : inactiveColor,
            ),
          ),
          TripProgressCircle(isActive: onRoadActive),
          Expanded(
            child: Container(
              height: 3.h,
              color: lineOnRoadDeliveredActive ? activeColor : inactiveColor,
            ),
          ),
          TripProgressCircle(isActive: deliveredActive),
        ],
      ),
    );
  }
}

class TripProgressCircle extends StatelessWidget {
  final bool isActive;

  const TripProgressCircle({super.key, required this.isActive});

  @override
  Widget build(BuildContext context) {
    const Color activeColor = AppColors.cSuccess;
    const Color inactiveColor = AppColors.cFillBorderLight;

    return Container(
      width: 24.w,
      height: 24.w,
      decoration: BoxDecoration(
        color: isActive ? activeColor : Colors.white,
        shape: BoxShape.circle,
        border: Border.all(
          color: isActive ? activeColor : inactiveColor,
          width: 2,
        ),
      ),
      child: isActive
          ? Icon(Icons.check, size: 14.sp, color: Colors.white)
          : null,
    );
  }
}

class TripProgressLabelsRow extends StatelessWidget {
  final bool createdActive;
  final bool onRoadActive;
  final bool deliveredActive;

  const TripProgressLabelsRow({
    super.key,
    required this.createdActive,
    required this.onRoadActive,
    required this.deliveredActive,
  });

  @override
  Widget build(BuildContext context) {
    const Color activeColor = AppColors.cSuccess;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Center(
            child: Text(
              'تم الإنشاء',
              style: AppStyles.subtitle400.copyWith(
                color: createdActive
                    ? activeColor
                    : AppColors.cTextSubtitleLight,
                fontSize: AppFontSize.f11,
              ),
            ),
          ),
        ),
        Expanded(
          child: Center(
            child: Text(
              'في الطريق',
              style: AppStyles.subtitle400.copyWith(
                color: onRoadActive
                    ? activeColor
                    : AppColors.cTextSubtitleLight,
                fontSize: AppFontSize.f11,
              ),
            ),
          ),
        ),
        Expanded(
          child: Center(
            child: Text(
              'تم التوصيل',
              style: AppStyles.subtitle400.copyWith(
                color: deliveredActive
                    ? activeColor
                    : AppColors.cTextSubtitleLight,
                fontSize: AppFontSize.f11,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
