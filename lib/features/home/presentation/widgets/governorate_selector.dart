import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../config/themes/colors.dart';
import '../../../../core/components/images/custom_asset_svg_image.dart';
import '../../../../core/res/app_images.dart';

class GovernorateSelector extends StatefulWidget {
  final String? initialValue;
  final Function(String)? onSelected;
  final double? iconSize;
  final double? fontSize;

  const GovernorateSelector({
    super.key,
    this.initialValue,
    this.onSelected,
    this.iconSize,
    this.fontSize,
  });

  @override
  State<GovernorateSelector> createState() => _GovernorateSelectorState();
}

class _GovernorateSelectorState extends State<GovernorateSelector> {
  String? _selectedGovernorate;

  static const List<String> _governorates = [
    'القاهرة',
    'الإسكندرية',
    'الجيزة',
    'بورسعيد',
    'السويس',
    'طنطا',
    'أسيوط',
    'الأقصر',
    'أسوان',
    'دمياط',
    'المنيا',
    'بنها',
    'قنا',
    'سوهاج',
    'دمنهور',
    'الغربيه',
  ];

  @override
  void initState() {
    super.initState();
    _selectedGovernorate = widget.initialValue;
  }

  @override
  void didUpdateWidget(GovernorateSelector oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initialValue != oldWidget.initialValue) {
      _selectedGovernorate = widget.initialValue;
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      offset: const Offset(0, 50),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.only(right: 5.r, left: 4.r),
            child: CustomAssetSvgImage(
              AssetImagesPath.LocationSvg,
              height: widget.iconSize ?? 16.h,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 7.h),
            child: Text(
              _selectedGovernorate ?? 'الغربيه',
              style: TextStyle(
                fontSize: widget.fontSize ?? 12.sp,
                color: _selectedGovernorate != null
                    ? Colors.black
                    : Colors.grey.shade600,
                fontWeight: _selectedGovernorate != null
                    ? FontWeight.w600
                    : FontWeight.normal,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(width: 1.w),
          Padding(
            padding: EdgeInsets.only(top: 5.h),
            child: Icon(
              Icons.keyboard_arrow_down,
              size: widget.iconSize ?? 16.sp,
              color: AppColors.cPrimary,
            ),
          ),
        ],
      ),
      itemBuilder: (BuildContext context) {
        return _governorates.map((String governorate) {
          return PopupMenuItem<String>(
            value: governorate,
            child: Text(
              governorate,
              style: TextStyle(
                fontSize: 14.sp,
                color: _selectedGovernorate == governorate
                    ? AppColors.cPrimary
                    : Colors.black,
                fontWeight: _selectedGovernorate == governorate
                    ? FontWeight.bold
                    : FontWeight.normal,
              ),
            ),
          );
        }).toList();
      },
      onSelected: (String value) {
        setState(() {
          _selectedGovernorate = value;
        });
        widget.onSelected?.call(value);
      },
    );
  }
}
