import 'package:eltyp_delivery/core/components/scaffold/shared_home_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/themes/colors.dart';
import '../../../../core/components/images/custom_asset_svg_image.dart';
import '../../../../core/res/app_images.dart';

PreferredSizeWidget tripsAppBar() {
  return PreferredSize(
    preferredSize: Size.fromHeight(72.h),
    child: Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        surfaceTintColor: Colors.white,
        leadingWidth: 72.w,
        leading: Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: CircleAvatar(
              radius: 22.r,
              child: const CustomAssetSvgImage(
                AssetImagesPath.profile,
                color: Colors.white,
              ),
            ),
          ),
        ),
        title: Image.asset(AssetImagesPath.appLogo, height: 55.h),
        actions: [
          const LanguageSwitcherRow(text: 'AR'),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: CircleAvatar(
              backgroundColor: AppColors.cPinColor,
              radius: 20.r,
              child: CustomAssetSvgImage(
                AssetImagesPath.notification,
                color: AppColors.cPrimary,
                height: 18.h,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
