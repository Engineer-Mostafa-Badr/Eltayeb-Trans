import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../../config/themes/colors.dart';
import '../../../../../config/themes/styles.dart';
import '../../../../../core/utils/app_sizes.dart';
import 'package:flutter/material.dart';

class TripDetailsExpensesCardSection extends StatelessWidget {
  const TripDetailsExpensesCardSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: AppStyles.secondUsedBoxShadow(opacity: 0.12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Text(
                'recorded_expenses',
                style: AppStyles.title700.copyWith(),
              ).tr(),
              const Spacer(),
              GestureDetector(
                onTap: () {},
                child: Text(
                  'show_more',
                  style: AppStyles.subtitle400.copyWith(
                    color: AppColors.cDarkBlueColor,
                    fontSize: AppFontSize.f12,
                  ),
                ).tr(),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          const TripExpenseItemRow(label: 'fuel', amount: '250 جنيه'),
          SizedBox(height: 8.h),
          const TripExpenseItemRow(label: 'lunch', amount: '80 جنيه'),
          SizedBox(height: 16.h),
          Row(
            children: [
              Text(
                'total_expenses',
                style: AppStyles.subtitle400.copyWith(
                  color: AppColors.cTextSubtitleLight,
                  fontSize: AppFontSize.f12,
                ),
              ).tr(),
              SizedBox(width: 12.w),
              Expanded(
                child: Text(
                  '330 جنيه',
                  textAlign: TextAlign.left,
                  style: AppStyles.title700.copyWith(color: AppColors.cPrimary),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class TripExpenseItemRow extends StatelessWidget {
  final String label;
  final String amount;

  const TripExpenseItemRow({
    super.key,
    required this.label,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: AppColors.cHomeLiteCard,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        children: [
          Row(
            children: [
              Container(
                width: 6.w,
                height: 6.w,
                decoration: const BoxDecoration(
                  color: AppColors.cPrimary,
                  shape: BoxShape.circle,
                ),
              ),
              SizedBox(width: 10.w),
              Text(
                label,
                style: AppStyles.title400.copyWith(fontSize: AppFontSize.f13),
              ).tr(),
            ],
          ),

          SizedBox(width: 12.w),
          Expanded(
            child: Text(
              amount,
              textAlign: TextAlign.left,
              style: AppStyles.subtitle500.copyWith(),
            ),
          ),
        ],
      ),
    );
  }
}
