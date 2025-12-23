import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/components/utils/custom_rounded_container.dart';
import '../../../../core/extensions/widgets_extensions.dart';
import '../../data/models/trips_model.dart';
import 'trip_card_actions.dart';
import 'trip_card_company_date.dart';
import 'trip_card_header.dart';
import 'trip_card_route.dart';
import 'trip_model_extensions.dart';
import 'trip_progress_section.dart';

/// Main trip card widget displaying trip information and actions
class TripCard extends StatelessWidget {
  final TripModel trip;

  const TripCard({super.key, required this.trip});

  @override
  Widget build(BuildContext context) {
    return CustomRoundedContainer(
      padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TripCardHeader(trip: trip),
          12.sizedHeight,
          TripCardRoute(trip: trip),
          12.sizedHeight,
          TripCardCompanyDate(trip: trip),
          16.sizedHeight,
          TripProgressSection(
            createdActive: trip.createdActive,
            onRoadActive: trip.onRoadActive,
            deliveredActive: trip.deliveredActive,
          ),
          16.sizedHeight,
          TripCardActions(trip: trip),
        ],
      ),
    );
  }
}
