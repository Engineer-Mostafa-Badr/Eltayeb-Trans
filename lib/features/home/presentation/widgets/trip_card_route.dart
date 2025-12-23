import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/themes/colors.dart';
import '../../../../config/themes/styles.dart';
import '../../../../core/extensions/widgets_extensions.dart';
import '../../../../core/utils/app_sizes.dart';
import '../../data/models/trips_model.dart';

/// Route information row showing from/to cities
class TripCardRoute extends StatelessWidget {
  final TripModel trip;

  const TripCardRoute({super.key, required this.trip});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: AppColors.cHomeLiteCard,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          const Icon(Icons.location_on_outlined, color: AppColors.cPrimary),
          8.sizedWidth,
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                trip.fromCity.name,
                style: AppStyles.title500.copyWith(fontSize: AppFontSize.f16),
              ),
              4.sizedWidth,
              Text(' ← ', style: AppStyles.title500),
              4.sizedWidth,
              Text(
                trip.toCity.name,
                style: AppStyles.title500.copyWith(fontSize: AppFontSize.f16),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
