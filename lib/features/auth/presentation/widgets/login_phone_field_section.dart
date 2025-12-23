import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eltyp_delivery/core/components/images/custom_asset_svg_image.dart';
import 'package:eltyp_delivery/core/components/widgets/custom_text_field.dart';
import 'package:eltyp_delivery/core/res/app_images.dart';
import 'package:eltyp_delivery/core/utils/app_sizes.dart';

import '../../../../config/themes/styles.dart';

class LoginPhoneFieldSection extends StatelessWidget {
  final TextEditingController controller;

  const LoginPhoneFieldSection({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: AppStyles.secondUsedBoxShadow(opacity: 0.12),
      ),
      child: Row(
        children: [
          CustomAssetSvgImage(AssetImagesPath.callSvg, height: 45.h),
          const SizedBox(width: 8),
          Expanded(
            child: CustomTextField(
              controller: controller,
              hintText: '1273747262',
              keyboardType: TextInputType.phone,
              textAlign: TextAlign.left,
              textDirection: TextDirection.ltr,
              style: AppStyles.title500,
              fillColor: Colors.transparent,
              borderColor: Colors.transparent,
              focusedBorderColor: Colors.transparent,
              contentPadding: EdgeInsets.zero,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 6),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            child: Text(
              '20+',
              style: AppStyles.title500.copyWith(fontSize: AppFontSize.f16),
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),
    );
  }
}
