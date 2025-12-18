import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/components/scaffold/shared_home_scaffold.dart';
import '../../../../core/enum/enums.dart';
import '../../data/models/trips_model.dart';
import '../../domain/entities/get_trip_details_params.dart';
import '../bloc/trips_bloc.dart';
import '../widgets/trips_details_widgets/trip_details_expenses_card_section.dart';
import '../widgets/trips_details_widgets/trip_details_header_card_section.dart';
import '../widgets/trips_details_widgets/trip_details_info_card_section.dart';
import '../widgets/trips_details_widgets/trip_details_stages_card_section.dart';
import '../widgets/trips_details_widgets/trip_details_bottom_actions_section.dart';

class TripDetailsPage extends StatefulWidget {
  const TripDetailsPage({super.key, required this.tripId});

  final int tripId;

  @override
  State<TripDetailsPage> createState() => _TripDetailsPageState();
}

class _TripDetailsPageState extends State<TripDetailsPage> {
  @override
  void initState() {
    super.initState();
    context.read<TripsBloc>().add(
      GetTripDetailsEvent(GetTripDetailsParams(tripId: widget.tripId)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SharedHomeScaffold(
      title: 'trip_details',
      body: BlocBuilder<TripsBloc, TripsState>(
        builder: (context, state) {
          if (state.tripDetailsRequestState == RequestState.loading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.tripDetailsRequestState == RequestState.error) {
            return Center(
              child: Text(state.tripDetailsResponse.msg ?? 'حدث خطأ'),
            );
          }

          final trip = state.tripDetailsResponse.data;

          if (trip == null) {
            return const Center(child: Text('لا توجد بيانات للرحلة'));
          }

          return TripDetailsBodySection(trip: trip);
        },
      ),
      bottomNavigationBar: const TripDetailsBottomActionsSection(),
    );
  }
}

class TripDetailsBodySection extends StatelessWidget {
  const TripDetailsBodySection({super.key, required this.trip});

  final TripModel trip;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 29.w, vertical: 26.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TripDetailsHeaderCardSection(trip: trip),
          SizedBox(height: 16.h),
          TripDetailsStagesCardSection(trip: trip),
          SizedBox(height: 16.h),
          TripDetailsInfoCardSection(trip: trip),
          SizedBox(height: 16.h),
          const TripDetailsExpensesCardSection(),
          SizedBox(height: 16.h),
        ],
      ),
    );
  }
}
