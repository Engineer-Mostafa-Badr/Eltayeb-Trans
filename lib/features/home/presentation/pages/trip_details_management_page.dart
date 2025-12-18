import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eltyp_delivery/config/themes/colors.dart';
import 'package:eltyp_delivery/config/themes/styles.dart';
import 'package:eltyp_delivery/core/components/buttons/outlined_button.dart';
import 'package:eltyp_delivery/core/components/buttons/rounded_button.dart';
import 'package:eltyp_delivery/core/components/utils/custom_rounded_container.dart';
import 'package:eltyp_delivery/core/extensions/navigation_extensions.dart';
import 'package:eltyp_delivery/core/extensions/shared_extensions.dart';
import 'package:eltyp_delivery/core/utils/app_const.dart';
import 'package:eltyp_delivery/core/utils/app_sizes.dart';
import 'package:eltyp_delivery/features/notifications/presentation/pages/notifications_page.dart';
import 'package:eltyp_delivery/features/profile/presentation/pages/profile_page.dart';
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

  String _formatDateForDisplay(String dateString) {
    try {
      final date = AppConst.mostUsedDateFormat.parse(dateString);
      final formatted = DateFormat('d MMMM yyyy', 'ar').format(date);
      return formatted.toEnglishNumbers;
    } catch (e) {
      return dateString;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cBackgroundLight,
      appBar: _buildAppBar(context),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildTripInfoCard(),
            SizedBox(height: 16.h),
            _buildDriverCard(context),
            SizedBox(height: 16.h),
            _buildTruckCard(context),
            SizedBox(height: 32.h),
            _buildEditButton(context),
            SizedBox(height: 20.h),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(context),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.black),
        onPressed: () => Navigator.pop(context),
      ),
      title: Row(
        children: [
          Container(
            width: 35.w,
            height: 35.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: .15),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Center(
              child: Text('🇪🇬', style: TextStyle(fontSize: 17.sp)),
            ),
          ),
          SizedBox(width: 8.w),
          Text(
            'AR',
            style: AppStyles.title700.copyWith(
              fontSize: AppFontSize.f16,
              color: Colors.black,
            ),
          ),
          const Spacer(),
          Text(
            'trip_details',
            style: AppStyles.title700.copyWith(
              fontSize: AppFontSize.f20,
              color: Colors.black,
            ),
          ).tr(),
          const Spacer(),
          IconButton(
            icon: const Icon(Icons.person_outline, color: Colors.black),
            onPressed: () {
              context.navigateToPage(const ProfilePage());
            },
          ),
        ],
      ),
    );
  }

  Widget _buildTripInfoCard() {
    return CustomRoundedContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                decoration: BoxDecoration(
                  color: const Color(0xFFF5E6D3),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Text(
                  tripStatus.tr(),
                  style: AppStyles.title600.copyWith(
                    fontSize: AppFontSize.f12,
                    color: const Color(0xFF8B4513),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Text(
            'trip_number',
            style: AppStyles.title700.copyWith(
              fontSize: AppFontSize.f18,
              color: Colors.black,
            ),
          ).tr(),
          SizedBox(height: 4.h),
          Text(
            tripNumber,
            style: AppStyles.title600.copyWith(
              fontSize: AppFontSize.f16,
              color: AppColors.cTextSubtitleLight,
            ),
          ),
          SizedBox(height: 16.h),
          Row(
            children: [
              Text(
                originCity,
                style: AppStyles.title700.copyWith(
                  fontSize: AppFontSize.f16,
                  color: Colors.black,
                ),
              ),
              SizedBox(width: 8.w),
              Icon(
                Icons.arrow_forward,
                size: 20.sp,
                color: AppColors.cTextSubtitleLight,
              ),
              SizedBox(width: 8.w),
              Text(
                destinationCity,
                style: AppStyles.title700.copyWith(
                  fontSize: AppFontSize.f16,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          _buildInfoRow(
            label: 'pickup_date',
            value: _formatDateForDisplay(pickupDate),
          ),
          SizedBox(height: 12.h),
          _buildInfoRow(
            label: 'delivery_date',
            value: _formatDateForDisplay(deliveryDate),
          ),
          if (notes.isNotEmpty) ...[
            SizedBox(height: 12.h),
            _buildInfoRow(label: 'notes', value: notes),
          ],
        ],
      ),
    );
  }

  Widget _buildInfoRow({required String label, required String value}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$label: ',
          style: AppStyles.subtitle400.copyWith(
            color: AppColors.cTextSubtitleLight,
            fontSize: AppFontSize.f14,
          ),
        ).tr(),
        Expanded(
          child: Text(
            value,
            style: AppStyles.subtitle400.copyWith(
              color: AppColors.cTextSubtitleLight,
              fontSize: AppFontSize.f14,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDriverCard(BuildContext context) {
    return CustomRoundedContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'current_driver',
            style: AppStyles.title700.copyWith(
              fontSize: AppFontSize.f16,
              color: Colors.black,
            ),
          ).tr(),
          SizedBox(height: 12.h),
          Text(
            currentDriver,
            style: AppStyles.title600.copyWith(
              fontSize: AppFontSize.f15,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 16.h),
          ReusedOutlinedButton(
            text: 'select_driver',
            onPressed: () {
              // TODO: Implement driver selection
            },
            height: 40,
          ),
        ],
      ),
    );
  }

  Widget _buildTruckCard(BuildContext context) {
    return CustomRoundedContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'current_truck',
            style: AppStyles.title700.copyWith(
              fontSize: AppFontSize.f16,
              color: Colors.black,
            ),
          ).tr(),
          SizedBox(height: 12.h),
          Text(
            currentTruck,
            style: AppStyles.title600.copyWith(
              fontSize: AppFontSize.f15,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 16.h),
          ReusedOutlinedButton(
            text: 'select_truck',
            onPressed: () {
              // TODO: Implement truck selection
            },
            height: 40,
          ),
        ],
      ),
    );
  }

  Widget _buildEditButton(BuildContext context) {
    return ReusedRoundedButton(
      text: 'edit_trip_data',
      onPressed: () {
        context.navigateToPage(
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
        );
      },
      textColor: Colors.white,
      height: 50,
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: AppColors.cNavBarBorder)),
      ),
      child: BottomNavigationBar(
        onTap: (index) {
          if (index == 0) {
            // Stay on trips page
          } else if (index == 1) {
            context.navigateToPage(const NotificationsPage());
          } else if (index == 2) {
            context.navigateToPage(const ProfilePage());
          }
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: AppColors.cPrimary,
        unselectedItemColor: AppColors.cTextSubtitleLight,
        selectedFontSize: 12.sp,
        unselectedFontSize: 12.sp,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'tracks',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_none),
            label: 'notification',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'profile',
          ),
        ],
      ),
    );
  }
}
