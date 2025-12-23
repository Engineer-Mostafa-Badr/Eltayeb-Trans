import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eltyp_delivery/core/components/textformfields/city_drop_down.dart';
import 'package:eltyp_delivery/core/components/textformfields/custom_dropdown.dart';
import 'package:eltyp_delivery/core/components/textformfields/reused_textformfield.dart';
import 'package:eltyp_delivery/core/extensions/shared_extensions.dart';
import 'package:eltyp_delivery/core/res/app_images.dart';
import 'package:eltyp_delivery/core/utils/app_const.dart';
import 'date_picker_modal.dart';

class EditTripForm extends StatelessWidget {
  final int? originCityId;
  final int? destinationCityId;
  final String? selectedPickupDate;
  final String? selectedDeliveryDate;
  final String? selectedTripStatus;
  final List<String> tripStatuses;
  final ValueChanged<int?> onOriginCitySelected;
  final ValueChanged<int?> onDestinationCitySelected;
  final ValueChanged<String> onPickupDateSelected;
  final ValueChanged<String> onDeliveryDateSelected;
  final ValueChanged<String?> onTripStatusChanged;

  const EditTripForm({
    super.key,
    required this.originCityId,
    required this.destinationCityId,
    required this.selectedPickupDate,
    required this.selectedDeliveryDate,
    required this.selectedTripStatus,
    required this.tripStatuses,
    required this.onOriginCitySelected,
    required this.onDestinationCitySelected,
    required this.onPickupDateSelected,
    required this.onDeliveryDateSelected,
    required this.onTripStatusChanged,
  });

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

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CityDropDown(
          title: 'departure_city',
          hintText: 'select_city',
          initValue: originCityId,
          onCitySelected: onOriginCitySelected,
        ),
        SizedBox(height: 16.h),
        CityDropDown(
          title: 'arrival_city',
          hintText: 'select_city',
          initValue: destinationCityId,
          onCitySelected: onDestinationCitySelected,
        ),
        SizedBox(height: 16.h),
        ReusedTextFormField(
          title: 'pickup_date',
          hintText: 'select_date',
          readOnly: true,
          controller: TextEditingController(
            text: _formatDateForDisplay(selectedPickupDate),
          ),
          prefixIcon: AssetImagesPath.calendar,
          onTap: () {
            DatePickerModal.show(
              context,
              initialDate: selectedPickupDate,
              onDateSelected: onPickupDateSelected,
            );
          },
        ),
        SizedBox(height: 16.h),
        ReusedTextFormField(
          title: 'delivery_date',
          hintText: 'select_date',
          readOnly: true,
          controller: TextEditingController(
            text: _formatDateForDisplay(selectedDeliveryDate),
          ),
          prefixIcon: AssetImagesPath.calendar,
          onTap: () {
            DatePickerModal.show(
              context,
              initialDate: selectedDeliveryDate,
              onDateSelected: onDeliveryDateSelected,
            );
          },
        ),
        SizedBox(height: 16.h),
        CustomDropdownMenu(
          title: 'trip_status',
          hintText: 'select_status',
          value: selectedTripStatus,
          items: tripStatuses,
          onChanged: onTripStatusChanged,
        ),
      ],
    );
  }
}
