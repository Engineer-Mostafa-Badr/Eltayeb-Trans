import 'package:easy_localization/easy_localization.dart';
import 'package:eltyp_delivery/config/themes/colors.dart';
import 'package:eltyp_delivery/config/themes/styles.dart';
import 'package:eltyp_delivery/core/components/images/custom_asset_svg_image.dart';
import 'package:eltyp_delivery/core/extensions/widgets_extensions.dart';
import 'package:eltyp_delivery/core/res/app_images.dart';
import 'package:eltyp_delivery/core/utils/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TicketAttachmentCard extends StatelessWidget {
  const TicketAttachmentCard({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(AppBorderRadius.radius10),
      onTap: () {},
      child: Container(
        height: 88.h,
        padding: const EdgeInsets.symmetric(horizontal: AppPadding.mediumPadding),
        decoration: BoxDecoration(
          color: const Color(0xFFF7F2EF),
          borderRadius: BorderRadius.circular(AppBorderRadius.radius10),
        ),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
              ),
              child: const Center(
                child: CustomAssetSvgImage(AssetImagesPath.mshbk, color: AppColors.cPrimary),
              ),
            ),
            12.sizedWidth,
            Expanded(
              child: Text(
                'attach_image_or_file',
                style: AppStyles.title500.copyWith(
                  fontSize: 14,
                  color: AppColors.cTextSubtitleLight,
                ),
                textAlign: TextAlign.right,
              ).tr(),
            ),
          ],
        ),
      ),
    );
  }
}
