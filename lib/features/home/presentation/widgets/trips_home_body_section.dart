import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../data/models/trips_model.dart';
import 'package:flutter/material.dart';
import '../widgets/trip_card.dart';

class TripsHomeBodySection extends StatelessWidget {
  const TripsHomeBodySection({super.key, required this.trip});

  final TripModel trip;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: TripCard(trip: trip),
    );
  }
}
