import 'package:eltyp_delivery/core/components/utils/custom_rounded_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/themes/colors.dart';
import '../../../../../config/themes/styles.dart';
import '../../../../../core/utils/app_sizes.dart';
import '../../../data/models/trips_model.dart';
import '../trip_card.dart';

class TripDetailsHeaderCardSection extends StatelessWidget {
  const TripDetailsHeaderCardSection({super.key, required this.trip});

  final TripModel trip;

  @override
  Widget build(BuildContext context) {
    return CustomRoundedContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TripHeaderSection(trip: trip),
          SizedBox(height: 12.h),
          Row(
            children: [
              const Icon(Icons.location_on_outlined, color: AppColors.cPrimary),
              SizedBox(width: 8.w),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    trip.fromCity.name,
                    style: AppStyles.title500.copyWith(
                      fontSize: AppFontSize.f16,
                    ),
                  ),
                  SizedBox(width: 4.w),
                  Text(' ← ', style: AppStyles.title500),
                  SizedBox(width: 4.w),
                  Text(
                    trip.toCity.name,
                    style: AppStyles.title500.copyWith(
                      fontSize: AppFontSize.f16,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 12.h),
          TripCompanyDateRow(trip: trip),
        ],
      ),
    );
  }
}
