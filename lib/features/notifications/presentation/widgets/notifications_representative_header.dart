import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/components/images/custom_asset_svg_image.dart';
import '../../../../core/res/app_images.dart';
import '../../../../config/themes/colors.dart';
import '../../../../core/extensions/navigation_extensions.dart';
import '../../../home/presentation/pages/trip_representative_page.dart';

class NotificationsRepresentativeHeader extends StatefulWidget {
  const NotificationsRepresentativeHeader({super.key});

  @override
  State<NotificationsRepresentativeHeader> createState() =>
      _NotificationsRepresentativeHeaderState();
}

class _NotificationsRepresentativeHeaderState
    extends State<NotificationsRepresentativeHeader> {
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
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Container(
        width: double.infinity,
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildLocationDropdown(),
            _buildBackButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildLocationDropdown() {
    return PopupMenuButton<String>(
      offset: const Offset(0, 50),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.only(right: 15.r, left: 4.r),
            child: CustomAssetSvgImage(
              AssetImagesPath.LocationSvg,
              height: 16.h,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 7.h),
            child: Text(
              _selectedGovernorate ?? 'الغربيه',
              style: TextStyle(
                fontSize: 12.sp,
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
              size: 16.sp,
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
      },
    );
  }

  Widget _buildBackButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.navigateToPageWithClearStack(
          const TripsRepresentativePage(initialIndex: 0),
        );
      },
      child: Container(
        width: 40.w,
        height: 40.h,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey[100],
        ),
        child: Center(
          child: CustomAssetSvgImage(
            AssetImagesPath.IconSvg,
            height: 20.h,
            width: 20.w,
            color: AppColors.cPrimary,
          ),
        ),
      ),
    );
  }
}

