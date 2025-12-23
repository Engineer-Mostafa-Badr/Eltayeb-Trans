import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eltyp_delivery/config/themes/styles.dart';
import 'package:eltyp_delivery/core/components/images/custom_asset_svg_image.dart';
import 'package:eltyp_delivery/core/components/widgets/custom_app_bar.dart';
import 'package:eltyp_delivery/core/extensions/navigation_extensions.dart';
import 'package:eltyp_delivery/core/res/app_images.dart';
import 'package:eltyp_delivery/core/utils/app_sizes.dart';
import 'package:eltyp_delivery/features/profile/presentation/pages/profile_page.dart';
import 'dart:ui' as ui;

class EditTripHeader extends StatelessWidget implements PreferredSizeWidget {
  const EditTripHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
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
      title: Row(
        children: [
          _buildLanguageFlag(),
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
            onPressed: () => context.navigateToPage(const ProfilePage()),
          ),
        ],
      ),
    );
  }

  Widget _buildLanguageFlag() {
    return Container(
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
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
