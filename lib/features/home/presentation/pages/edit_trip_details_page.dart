import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eltyp_delivery/config/themes/colors.dart';
import 'package:eltyp_delivery/core/components/buttons/rounded_button.dart';
import 'package:eltyp_delivery/features/home/presentation/widgets/edit_trip_widgets/edit_trip_bottom_nav.dart';
import 'package:eltyp_delivery/features/home/presentation/widgets/edit_trip_widgets/edit_trip_form.dart';
import 'package:eltyp_delivery/features/home/presentation/widgets/edit_trip_widgets/edit_trip_header.dart';
import 'package:eltyp_delivery/features/home/presentation/widgets/edit_trip_widgets/trip_info_card_widget.dart';

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

  static const List<String> _tripStatuses = [
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cBackgroundLight,
      appBar: const EditTripHeader(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TripInfoCardWidget(
                tripNumber: widget.tripNumber ?? '2541',
                currentDriver: widget.currentDriver ?? 'أحمد علي',
                currentTruck: widget.currentTruck ?? 'TR-5521',
              ),
              SizedBox(height: 16.h),
              EditTripForm(
                originCityId: _originCityId,
                destinationCityId: _destinationCityId,
                selectedPickupDate: _selectedPickupDate,
                selectedDeliveryDate: _selectedDeliveryDate,
                selectedTripStatus: _selectedTripStatus,
                tripStatuses: _tripStatuses,
                onOriginCitySelected: (cityId) {
                  setState(() => _originCityId = cityId);
                },
                onDestinationCitySelected: (cityId) {
                  setState(() => _destinationCityId = cityId);
                },
                onPickupDateSelected: (date) {
                  setState(() => _selectedPickupDate = date);
                },
                onDeliveryDateSelected: (date) {
                  setState(() => _selectedDeliveryDate = date);
                },
                onTripStatusChanged: (value) {
                  setState(() => _selectedTripStatus = value);
                },
              ),
              SizedBox(height: 32.h),
              _buildSaveButton(),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const EditTripBottomNav(),
    );
  }

  Widget _buildSaveButton() {
    return ReusedRoundedButton(
      text: 'save_changes',
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          Navigator.pop(context);
        }
      },
      textColor: Colors.white,
      height: 50,
    );
  }
}
