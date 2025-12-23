import 'dart:ui' as ui show TextDirection;
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../config/themes/colors.dart';
import '../../../../core/components/widgets/custom_text_field.dart';
import '../../../../core/utils/app_sizes.dart';

class TripFilterAndSearchSection extends StatefulWidget {
  final TextEditingController searchController;
  final String? selectedStatus;
  final String? fromDate;
  final String? toDate;
  final Function(String?)? onStatusChanged;
  final VoidCallback? onSearchChanged;
  final Function(String?, String?)? onDateRangeSelected;

  const TripFilterAndSearchSection({
    super.key,
    required this.searchController,
    this.selectedStatus,
    this.fromDate,
    this.toDate,
    this.onStatusChanged,
    this.onSearchChanged,
    this.onDateRangeSelected,
  });

  @override
  State<TripFilterAndSearchSection> createState() =>
      _TripFilterAndSearchSectionState();
}

class _TripFilterAndSearchSectionState
    extends State<TripFilterAndSearchSection> {
  final List<String> statusOptions = [
    'الكل',
    'مجدولة',
    'قيد التنفيذ',
    'مكتملة',
    'ملغاة',
  ];
  final Map<String, String?> statusMap = {
    'الكل': null,
    'مجدولة': 'scheduled',
    'قيد التنفيذ': 'in_progress',
    'مكتملة': 'completed',
    'ملغاة': 'cancelled',
  };

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => Container(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: statusOptions.map((status) {
                          return ListTile(
                            title: Text(status),
                            onTap: () {
                              widget.onStatusChanged?.call(statusMap[status]);
                              Navigator.pop(context);
                            },
                            trailing: widget.selectedStatus == statusMap[status]
                                ? Icon(
                                    Icons.check,
                                    color: AppColors.cFilterStatusRed,
                                  )
                                : null,
                          );
                        }).toList(),
                      ),
                    ),
                  );
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppPadding.padding16.w,
                    vertical: AppPadding.padding14.h,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(
                      AppBorderRadius.radius12,
                    ),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          statusOptions.firstWhere(
                            (s) => statusMap[s] == widget.selectedStatus,
                            orElse: () => 'all'.tr(),
                          ),
                          style: TextStyle(
                            fontSize: AppFontSize.f14,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Icon(
                        Icons.keyboard_arrow_down,
                        color: AppColors.cFilterStatusRed,
                        size: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(width: AppPadding.padding8.w),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(AppBorderRadius.radius12),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: IconButton(
                icon: Icon(Icons.calendar_today_outlined, size: 20),
                color: AppColors.cFilterStatusRed,
                onPressed: () async {
                  final DateTimeRange? picked = await showDateRangePicker(
                    context: context,
                    firstDate: DateTime(2020),
                    lastDate: DateTime(2030),
                    locale: const Locale('ar', 'EG'),
                  );
                  if (picked != null) {
                    widget.onDateRangeSelected?.call(
                      picked.start.toIso8601String().split('T')[0],
                      picked.end.toIso8601String().split('T')[0],
                    );
                  }
                },
              ),
            ),
          ],
        ),
        SizedBox(height: AppPadding.padding12.h),
        Container(
          height: AppPadding.padding48.h,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(AppBorderRadius.radius12),
            color: Colors.white,
          ),
          child: CustomTextField(
            controller: widget.searchController,
            hintText: 'search_trip'.tr(),
            icon: Icons.search,
            textDirection: ui.TextDirection.rtl,
            fillColor: Colors.transparent,
            borderColor: Colors.transparent,
            focusedBorderColor: Colors.transparent,
            contentPadding: const EdgeInsets.symmetric(vertical: 14),
            style: const TextStyle(color: Colors.grey, fontSize: 14),
            onChanged: (_) {
              // يمكن إضافة debounce هنا
              widget.onSearchChanged?.call();
            },
          ),
        ),
      ],
    );
  }
}
