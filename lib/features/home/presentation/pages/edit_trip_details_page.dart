import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eltyp_delivery/config/themes/colors.dart';
import 'package:eltyp_delivery/config/themes/styles.dart';
import 'package:eltyp_delivery/core/components/buttons/rounded_button.dart';
import 'package:eltyp_delivery/core/components/calendar/date_calendar_reuse.dart';
import 'package:eltyp_delivery/core/components/textformfields/city_drop_down.dart';
import 'package:eltyp_delivery/core/components/textformfields/custom_dropdown.dart';
import 'package:eltyp_delivery/core/components/textformfields/reused_textformfield.dart';
import 'package:eltyp_delivery/core/components/utils/custom_rounded_container.dart';
import 'package:eltyp_delivery/core/extensions/navigation_extensions.dart';
import 'package:eltyp_delivery/core/extensions/shared_extensions.dart';
import 'package:eltyp_delivery/core/res/app_images.dart';
import 'package:eltyp_delivery/core/utils/app_const.dart';
import 'package:eltyp_delivery/core/utils/app_sizes.dart';
import 'package:eltyp_delivery/features/notifications/presentation/pages/notifications_page.dart';
import 'package:eltyp_delivery/features/profile/presentation/pages/profile_page.dart';

class EditTripDetailsPage extends StatefulWidget {
  const EditTripDetailsPage({
    super.key,
    this.tripId,
    this.tripNumber,
    this.currentDriver,
    this.currentTruck,
    this.originCity,
    this.destinationCity,
    this.pickupDate,
    this.deliveryDate,
    this.tripStatus,
  });

  final int? tripId;
  final String? tripNumber;
  final String? currentDriver;
  final String? currentTruck;
  final String? originCity;
  final String? destinationCity;
  final String? pickupDate;
  final String? deliveryDate;
  final String? tripStatus;

  @override
  State<EditTripDetailsPage> createState() => _EditTripDetailsPageState();
}

class _EditTripDetailsPageState extends State<EditTripDetailsPage> {
  final _formKey = GlobalKey<FormState>();
  int? _originCityId;
  int? _destinationCityId;
  String? _selectedPickupDate;
  String? _selectedDeliveryDate;
  String? _selectedTripStatus;

  final List<String> _tripStatuses = [
    'pending',
    'in_progress',
    'completed',
    'cancelled',
  ];

  @override
  void initState() {
    super.initState();
    _selectedPickupDate = widget.pickupDate;
    _selectedDeliveryDate = widget.deliveryDate;
    _selectedTripStatus = widget.tripStatus ?? 'completed';
  }

  String _formatDateForDisplay(String? dateString) {
    if (dateString == null || dateString.isEmpty) return '';
    try {
      final date = AppConst.mostUsedDateFormat.parse(dateString);
      final formatted = DateFormat('d MMMM yyyy', 'ar').format(date);
      return formatted.toEnglishNumbers;
    } catch (e) {
      return dateString;
    }
  }

  void _showDatePicker({
    required String? initialDate,
    required Function(String) onDateSelected,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.7,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'select_date'.tr(),
                    style: AppStyles.title700.copyWith(
                      fontSize: AppFontSize.f18,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SelectTimeCalendarReuse(
                initDate: initialDate,
                onDateSelected: (date) {
                  onDateSelected(date);
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cBackgroundLight,
      appBar: _buildAppBar(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildTripInfoCard(),
              SizedBox(height: 16.h),
              _buildOriginCityField(),
              SizedBox(height: 16.h),
              _buildDestinationCityField(),
              SizedBox(height: 16.h),
              _buildPickupDateField(),
              SizedBox(height: 16.h),
              _buildDeliveryDateField(),
              SizedBox(height: 16.h),
              _buildTripStatusDropdown(),
              SizedBox(height: 32.h),
              _buildSaveButton(),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  AppBar _buildAppBar() {
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
          _buildInfoRow(
            label: 'trip_number',
            value: widget.tripNumber ?? '2541',
          ),
          SizedBox(height: 16.h),
          _buildInfoRow(
            label: 'current_driver',
            value: widget.currentDriver ?? 'أحمد علي',
          ),
          SizedBox(height: 16.h),
          _buildInfoRow(
            label: 'current_truck',
            value: widget.currentTruck ?? 'TR-5521',
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow({required String label, required String value}) {
    return Row(
      children: [
        Expanded(
          child: Text(
            label,
            textAlign: TextAlign.right,
            style: AppStyles.subtitle400.copyWith(
              color: AppColors.cTextSubtitleLight,
              fontSize: AppFontSize.f14,
            ),
          ).tr(),
        ),
        SizedBox(width: 16.w),
        Text(
          value,
          textAlign: TextAlign.left,
          style: AppStyles.title600.copyWith(
            color: Colors.black,
            fontSize: AppFontSize.f14,
          ),
        ),
      ],
    );
  }

  Widget _buildOriginCityField() {
    return CityDropDown(
      title: 'departure_city',
      hintText: 'select_city',
      initValue: _originCityId,
      onCitySelected: (cityId) {
        setState(() {
          _originCityId = cityId;
        });
      },
    );
  }

  Widget _buildDestinationCityField() {
    return CityDropDown(
      title: 'arrival_city',
      hintText: 'select_city',
      initValue: _destinationCityId,
      onCitySelected: (cityId) {
        setState(() {
          _destinationCityId = cityId;
        });
      },
    );
  }

  Widget _buildPickupDateField() {
    return ReusedTextFormField(
      title: 'pickup_date',
      hintText: 'select_date',
      readOnly: true,
      controller: TextEditingController(
        text: _formatDateForDisplay(_selectedPickupDate),
      ),
      prefixIcon: AssetImagesPath.calendar,
      onTap: () {
        _showDatePicker(
          initialDate: _selectedPickupDate,
          onDateSelected: (date) {
            setState(() {
              _selectedPickupDate = date;
            });
          },
        );
      },
    );
  }

  Widget _buildDeliveryDateField() {
    return ReusedTextFormField(
      title: 'delivery_date',
      hintText: 'select_date',
      readOnly: true,
      controller: TextEditingController(
        text: _formatDateForDisplay(_selectedDeliveryDate),
      ),
      prefixIcon: AssetImagesPath.calendar,
      onTap: () {
        _showDatePicker(
          initialDate: _selectedDeliveryDate,
          onDateSelected: (date) {
            setState(() {
              _selectedDeliveryDate = date;
            });
          },
        );
      },
    );
  }

  Widget _buildTripStatusDropdown() {
    return CustomDropdownMenu(
      title: 'trip_status',
      hintText: 'select_status',
      value: _selectedTripStatus,
      items: _tripStatuses,
      onChanged: (value) {
        setState(() {
          _selectedTripStatus = value;
        });
      },
    );
  }

  Widget _buildSaveButton() {
    return ReusedRoundedButton(
      text: 'save_changes',
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          // TODO: Implement save logic
          Navigator.pop(context);
        }
      },
      textColor: Colors.white,
      height: 50,
    );
  }

  Widget _buildBottomNavigationBar() {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: AppColors.cNavBarBorder)),
      ),
      child: BottomNavigationBar(
        currentIndex: 2, // Trips is selected
        onTap: (index) {
          if (index == 0) {
            context.navigateToPage(const ProfilePage());
          } else if (index == 1) {
            context.navigateToPage(const NotificationsPage());
          }
          // index 2 is trips, stay on current page
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: AppColors.cPrimary,
        unselectedItemColor: AppColors.cTextSubtitleLight,
        selectedFontSize: 12.sp,
        unselectedFontSize: 12.sp,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.person_outline),
            label: 'profile'.tr(),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.notifications_none),
            label: 'notification'.tr(),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.home_outlined),
            label: 'tracks'.tr(),
          ),
        ],
      ),
    );
  }
}
