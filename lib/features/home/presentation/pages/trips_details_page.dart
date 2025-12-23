import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/components/buttons/rounded_button.dart';
import '../../../../core/components/screen_status/error_widget.dart';
import '../../../../core/components/screen_status/loading_widget.dart';
import '../../../../core/enum/enums.dart';
import '../../../../core/extensions/navigation_extensions.dart';
import '../../../../config/themes/colors.dart';
import '../../data/models/trips_model.dart';
import '../../domain/entities/get_trip_details_params.dart';
import '../bloc/trips_bloc.dart';
import '../widgets/trips_details_widgets/driver_info_card.dart';
import '../widgets/trips_details_widgets/trip_details_app_bar.dart';
import '../widgets/trips_details_widgets/trip_details_bottom_nav.dart';
import '../widgets/trips_details_widgets/trip_info_card_section.dart';
import '../widgets/trips_details_widgets/truck_info_card.dart';
import 'edit_trip_details_page.dart';

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
    return Scaffold(
      backgroundColor: AppColors.cBackgroundLight,
      appBar: const TripDetailsAppBar(),
      body: BlocBuilder<TripsBloc, TripsState>(
        builder: (context, state) {
          if (state.tripDetailsRequestState == RequestState.loading) {
            return const LoadingWidget();
          }

          if (state.tripDetailsRequestState == RequestState.error) {
            return ErrorBody(
              errorMessage: state.tripDetailsResponse.msg ?? 'حدث خطأ',
            );
          }

          final trip = state.tripDetailsResponse.data;
          if (trip == null) {
            return const Center(child: Text('لا توجد بيانات للرحلة'));
          }

          return TripDetailsBodySection(trip: trip);
        },
      ),
      bottomNavigationBar: const TripDetailsBottomNav(),
    );
  }
}

class TripDetailsBodySection extends StatelessWidget {
  const TripDetailsBodySection({super.key, required this.trip});

  final TripModel trip;

  @override
  Widget build(BuildContext context) {
    final driverName = trip.driver?.name ?? 'أحمد علي';
    final truckNumber = trip.track?.truckNumber ?? 'TR-5521';

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TripInfoCardSection(trip: trip),
          SizedBox(height: 16.h),
          DriverInfoCard(driverName: driverName),
          SizedBox(height: 16.h),
          TruckInfoCard(truckNumber: truckNumber),
          SizedBox(height: 32.h),
          ReusedRoundedButton(
            text: 'edit_trip_data',
            onPressed: () {
              context.navigateToPage(
                EditTripDetailsPage(
                  tripId: trip.id,
                  tripNumber: trip.id.toString(),
                  currentDriver: trip.driver?.name ?? 'أحمد علي',
                  currentTruck: trip.track?.truckNumber ?? 'TR-5521',
                  originCity: trip.fromCity.name,
                  destinationCity: trip.toCity.name,
                  pickupDate: trip.date,
                  deliveryDate: trip.date,
                  tripStatus: trip.status,
                ),
              );
            },
            textColor: Colors.white,
            height: 50,
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}
