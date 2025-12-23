import 'package:eltyp_delivery/core/components/utils/custom_rounded_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../data/models/trips_model.dart';
import '../trip_card_company_date.dart';
import '../trip_card_header.dart';
import '../trip_card_route.dart';

class TripDetailsHeaderCardSection extends StatelessWidget {
  const TripDetailsHeaderCardSection({super.key, required this.trip});

  final TripModel trip;

  @override
  Widget build(BuildContext context) {
    return CustomRoundedContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TripCardHeader(trip: trip),
          SizedBox(height: 12.h),
          TripCardRoute(trip: trip),
          SizedBox(height: 12.h),
          TripCardCompanyDate(trip: trip),
        ],
      ),
    );
  }
}
