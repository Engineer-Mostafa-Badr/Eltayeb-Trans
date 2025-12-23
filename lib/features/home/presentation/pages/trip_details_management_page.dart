import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eltyp_delivery/config/themes/colors.dart';
import 'package:eltyp_delivery/core/components/buttons/rounded_button.dart';
import 'package:eltyp_delivery/core/components/appbar/shared_app_bar.dart';
import 'package:eltyp_delivery/core/extensions/navigation_extensions.dart';
import 'package:eltyp_delivery/core/extensions/shared_extensions.dart';
import 'package:eltyp_delivery/core/extensions/widgets_extensions.dart';
import 'package:eltyp_delivery/core/utils/app_const.dart';
import 'package:eltyp_delivery/features/profile/presentation/pages/profile_page.dart';
import 'package:eltyp_delivery/features/home/presentation/widgets/trip_details_management_widgets/trip_info_card.dart';
import 'package:eltyp_delivery/features/home/presentation/widgets/trip_details_management_widgets/resource_card.dart';
import 'package:eltyp_delivery/features/home/presentation/widgets/trip_details_management_widgets/trip_details_bottom_nav_bar.dart';
import 'edit_trip_details_page.dart';

class TripDetailsManagementPage extends StatelessWidget {
  const TripDetailsManagementPage({
    super.key,
    this.tripId,
    this.tripNumber = '2541',
    this.originCity = 'القاهرة',
    this.destinationCity = 'الاسكندرية',
    this.pickupDate = '2025-03-12',
    this.deliveryDate = '2025-03-13',
    this.notes = 'شحنة مواد غذائية.',
    this.currentDriver = 'أحمد علي',
    this.currentTruck = 'TR-5521',
    this.tripStatus = 'scheduled',
  });

  final int? tripId;
  final String tripNumber;
  final String originCity;
  final String destinationCity;
  final String pickupDate;
  final String deliveryDate;
  final String notes;
  final String currentDriver;
  final String currentTruck;
  final String tripStatus;

  String _formatDate(String date) {
    try {
      final d = AppConst.mostUsedDateFormat.parse(date);
      return DateFormat('d MMMM yyyy', 'ar').format(d).toEnglishNumbers;
    } catch (_) {
      return date;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cBackgroundLight,
      appBar: SharedAppBar(
        title: 'trip_details',
        actions: [
          IconButton(
            icon: const Icon(Icons.person_outline, color: Colors.black),
            onPressed: () => context.navigateToPage(const ProfilePage()),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TripInfoCard(
              tripNumber: tripNumber,
              originCity: originCity,
              destinationCity: destinationCity,
              pickupDate: _formatDate(pickupDate),
              deliveryDate: _formatDate(deliveryDate),
              notes: notes,
              tripStatus: tripStatus,
            ),
            16.sizedHeight,
            ResourceCard(
              title: 'current_driver',
              value: currentDriver,
              buttonText: 'select_driver',
              onSelect: () {},
            ),
            16.sizedHeight,
            ResourceCard(
              title: 'current_truck',
              value: currentTruck,
              buttonText: 'select_truck',
              onSelect: () {},
            ),
            32.sizedHeight,
            ReusedRoundedButton(
              text: 'edit_trip_data',
              onPressed: () => context.navigateToPage(
                EditTripDetailsPage(
                  tripId: tripId,
                  tripNumber: tripNumber,
                  currentDriver: currentDriver,
                  currentTruck: currentTruck,
                  originCity: originCity,
                  destinationCity: destinationCity,
                  pickupDate: pickupDate,
                  deliveryDate: deliveryDate,
                ),
              ),
              textColor: Colors.white,
              height: 50,
            ),
            20.sizedHeight,
          ],
        ),
      ),
      bottomNavigationBar: const TripDetailsBottomNavBar(),
    );
  }
}
