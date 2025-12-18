import 'package:easy_localization/easy_localization.dart';
import 'package:eltyp_delivery/core/extensions/widgets_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/themes/colors.dart';
import '../../../../../config/themes/styles.dart';
import '../../../../../core/utils/app_sizes.dart';

class OdometerImageCard extends StatelessWidget {
  final VoidCallback onTap;

  const OdometerImageCard({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppBorderRadius.radius10),
      child: Container(
        height: 160.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(AppBorderRadius.radius10),
          border: Border.all(color: AppColors.cFillBorderLight, width: .6),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.camera_alt_outlined, color: AppColors.cTextSubtitleLight, size: 36),
            AppPadding.padding10.sizedHeight,
            Text(
              "take/upload_a picture_of_the_car's_odometer",
              style: AppStyles.subtitle500.copyWith(color: AppColors.cTextSubtitleLight, fontSize: 12),
            ).tr(),
          ],
        ),
      ),
    );
  }
}
