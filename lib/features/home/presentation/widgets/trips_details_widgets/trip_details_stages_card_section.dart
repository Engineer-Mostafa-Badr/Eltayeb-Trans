import 'package:easy_localization/easy_localization.dart';
import 'package:eltyp_delivery/core/components/utils/custom_rounded_container.dart';
import 'package:eltyp_delivery/features/home/presentation/widgets/trip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/themes/styles.dart';
import '../../../data/models/trips_model.dart';
import '../trip_progress_section.dart';

class TripDetailsStagesCardSection extends StatelessWidget {
  const TripDetailsStagesCardSection({super.key, required this.trip});

  final TripModel trip;

  @override
  Widget build(BuildContext context) {
    return CustomRoundedContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'stages_of_the_journey',
            style: AppStyles.title700.copyWith(),
          ).tr(),
          SizedBox(height: 16.h),
          TripProgressSection(
            createdActive: trip.createdActive,
            onRoadActive: trip.onRoadActive,
            deliveredActive: trip.deliveredActive,
          ),
        ],
      ),
    );
  }
}
