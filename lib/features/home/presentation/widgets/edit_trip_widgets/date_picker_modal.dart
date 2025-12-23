import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:eltyp_delivery/config/themes/styles.dart';
import 'package:eltyp_delivery/core/components/calendar/date_calendar_reuse.dart';
import 'package:eltyp_delivery/core/utils/app_sizes.dart';

class DatePickerModal extends StatelessWidget {
  final String? initialDate;
  final Function(String) onDateSelected;

  const DatePickerModal({
    super.key,
    required this.initialDate,
    required this.onDateSelected,
  });

  static void show(
    BuildContext context, {
    required String? initialDate,
    required Function(String) onDateSelected,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => DatePickerModal(
        initialDate: initialDate,
        onDateSelected: onDateSelected,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}

