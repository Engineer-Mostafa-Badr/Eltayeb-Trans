import 'package:easy_localization/easy_localization.dart';
import 'package:eltyp_delivery/core/components/images/custom_asset_svg_image.dart';
import 'package:eltyp_delivery/core/extensions/widgets_extensions.dart';
import 'package:eltyp_delivery/core/res/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/themes/colors.dart';
import '../../../../../config/themes/styles.dart';
import '../../../../../core/utils/app_sizes.dart';

class AttachImageCard extends StatelessWidget {
  final VoidCallback onTap;

  const AttachImageCard({super.key, required this.onTap});

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
            const CustomAssetSvgImage(AssetImagesPath.uploadImage),
            AppPadding.padding10.sizedHeight,
            Text(
              'upload_fault_image',
              style: AppStyles.title700.copyWith(fontSize: 15),
              textAlign: TextAlign.center,
            ).tr(),
            5.sizedHeight,
            Text(
              'or_damaged_part',
              style: AppStyles.subtitle500.copyWith(
                color: AppColors.cTextSubtitleLight,
                fontSize: 12,
              ),
              textAlign: TextAlign.center,
            ).tr(),
          ],
        ),
      ),
    );
  }
}
