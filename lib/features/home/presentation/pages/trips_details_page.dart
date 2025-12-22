import 'dart:ui' as ui;
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/components/buttons/outlined_button.dart';
import '../../../../core/components/buttons/rounded_button.dart';
import '../../../../core/components/images/custom_asset_svg_image.dart';
import '../../../../core/components/utils/custom_rounded_container.dart';
import '../../../../core/enum/enums.dart';
import '../../../../core/extensions/navigation_extensions.dart';
import '../../../../core/extensions/shared_extensions.dart';
import '../../../../config/themes/colors.dart';
import '../../../../config/themes/styles.dart';
import '../../../../core/res/app_images.dart';
import '../../../../core/utils/app_const.dart';
import '../../../../core/utils/app_sizes.dart';
import '../../../notifications/presentation/pages/notifications_representative_page.dart';
import '../../../profile/presentation/pages/profile_representative_page.dart';
import '../../data/models/trips_model.dart';
import '../../domain/entities/get_trip_details_params.dart';
import '../bloc/trips_bloc.dart';
import 'change_driver_page.dart';
import 'edit_trip_details_page.dart';
import 'truck_details_page.dart';

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
      appBar: _buildAppBar(context),
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
      bottomNavigationBar: _buildBottomNavigationBar(context),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: Directionality(
        textDirection: ui.TextDirection.ltr,
        child: IconButton(
          icon: const CustomAssetSvgImage(
            AssetImagesPath.IconSvg,
            width: 24,
            height: 24,
            color: Colors.black,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      title: const Text(
        'تفاصيل الرحلة',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w700,
          color: Color(0xFF101828),
        ),
      ),
      centerTitle: true,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.transparent),
                ),
                child: Row(
                  children: [
                    ClipOval(
                      child: Container(
                        width: 20,
                        height: 20,
                        color: Colors.white,
                        alignment: Alignment.center,
                        child: const Text(
                          '🇪🇬',
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                    ),
                    const SizedBox(width: 6),
                    const Text(
                      'AR',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF101828),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: const Color(0xFFF2F4F7),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.person_outline,
                  color: Color(0xFF6D1B1B),
                  size: 22,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: AppColors.cNavBarBorder)),
      ),
      child: BottomNavigationBar(
        currentIndex: 0,
        onTap: (index) {
          if (index == 0) {
            Navigator.pop(context);
          } else if (index == 1) {
            context.navigateToPage(const NotificationsRepresentativePage());
          } else if (index == 2) {
            context.navigateToPage(const ProfileRepresentativePage());
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
            icon: Icon(Icons.home_filled),
            label: 'الرحلات',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_none),
            label: 'الإشعارات',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'البروفايل',
          ),
        ],
      ),
    );
  }
}

class TripDetailsBodySection extends StatelessWidget {
  const TripDetailsBodySection({super.key, required this.trip});

  final TripModel trip;

  String _formatDateForDisplay(String dateString) {
    try {
      final date = AppConst.mostUsedDateFormat.parse(dateString);
      final formatted = DateFormat('d MMMM yyyy', 'ar').format(date);
      return formatted
          .toEnglishNumbers; // Extension from shared_extensions.dart
    } catch (e) {
      return dateString;
    }
  }

  String _getStatusLabel(String status) {
    switch (status.toLowerCase()) {
      case 'scheduled':
      case 'مجدولة':
        return 'مجدولة';
      case 'in_progress':
      case 'in progress':
      case 'قيد التنفيذ':
        return 'قيد التنفيذ';
      case 'completed':
      case 'مكتملة':
        return 'مكتملة';
      case 'cancelled':
      case 'ملغاة':
        return 'ملغاة';
      default:
        return status;
    }
  }

  Color _getStatusBgColor(String status) {
    switch (status.toLowerCase()) {
      case 'scheduled':
      case 'مجدولة':
        return const Color(0xFFFFF8E1);
      case 'in_progress':
      case 'in progress':
      case 'قيد التنفيذ':
        return const Color(0xFFE3F2FD);
      case 'completed':
      case 'مكتملة':
        return const Color(0xFFE8F5E9);
      case 'cancelled':
      case 'ملغاة':
        return const Color(0xFFFFEBEE);
      default:
        return Colors.grey.shade200;
    }
  }

  Color _getStatusTextColor(String status) {
    switch (status.toLowerCase()) {
      case 'scheduled':
      case 'مجدولة':
        return const Color(0xFFFBC02D);
      case 'in_progress':
      case 'in progress':
      case 'قيد التنفيذ':
        return const Color(0xFF1976D2);
      case 'completed':
      case 'مكتملة':
        return const Color(0xFF388E3C);
      case 'cancelled':
      case 'ملغاة':
        return const Color(0xFFD32F2F);
      default:
        return Colors.grey.shade700;
    }
  }

  @override
  Widget build(BuildContext context) {
    final driverName = trip.driver?.name ?? 'أحمد علي';
    final truckNumber = trip.track?.truckNumber ?? 'TR-5521';

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildTripInfoCard(),
          SizedBox(height: 16.h),
          _buildDriverCard(context, driverName),
          SizedBox(height: 16.h),
          _buildTruckCard(context, truckNumber),
          SizedBox(height: 32.h),
          _buildEditButton(context),
          SizedBox(height: 20.h),
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
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: _getStatusBgColor(trip.status),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  _getStatusLabel(trip.status),
                  style: TextStyle(
                    color: _getStatusTextColor(trip.status),
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                'رحلة رقم ${trip.id}',
                style: AppStyles.title700.copyWith(
                  fontSize: AppFontSize.f16,
                  color: const Color(0xFF6B1D1D),
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Row(
            children: [
              Text(
                trip.fromCity.name,
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
                trip.toCity.name,
                style: AppStyles.title700.copyWith(
                  fontSize: AppFontSize.f16,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          _buildInfoRow(
            label: 'تاريخ الاستلام',
            value: _formatDateForDisplay(trip.date),
          ),
          SizedBox(height: 12.h),
          _buildInfoRow(
            label: 'تاريخ التسليم',
            value: _formatDateForDisplay(trip.date),
          ),
          SizedBox(height: 12.h),
          _buildInfoRow(label: 'ملاحظات', value: 'شحنة مواد غذائية.'),
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
        ),
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

  Widget _buildDriverCard(BuildContext context, String driverName) {
    return CustomRoundedContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'السائق الحالي:',
            style: AppStyles.title700.copyWith(
              fontSize: AppFontSize.f16,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 12.h),
          Text(
            driverName,
            style: AppStyles.title600.copyWith(
              fontSize: AppFontSize.f15,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 16.h),
          ReusedOutlinedButton(
            text: 'select_driver',
            onPressed: () {
              context.navigateToPage(const ChangeDriverPage());
            },
            height: 40,
          ),
        ],
      ),
    );
  }

  Widget _buildTruckCard(BuildContext context, String truckNumber) {
    return CustomRoundedContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'الشاحنة الحالية:',
            style: AppStyles.title700.copyWith(
              fontSize: AppFontSize.f16,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 12.h),
          Text(
            truckNumber,
            style: AppStyles.title600.copyWith(
              fontSize: AppFontSize.f15,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 16.h),
          ReusedOutlinedButton(
            text: 'select_truck',
            onPressed: () {
              context.navigateToPageWithClearStack(const TruckDetailsPage());
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
    );
  }
}
