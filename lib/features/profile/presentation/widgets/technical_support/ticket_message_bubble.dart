import 'package:eltyp_delivery/core/extensions/widgets_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/themes/colors.dart';
import '../../../../../config/themes/styles.dart';
import '../../../../../core/components/images/custom_asset_svg_image.dart';
import '../../../../../core/res/app_images.dart';
import '../../../../../core/utils/app_sizes.dart';
import '../../pages/ticket_details_page.dart';

class TicketMessageBubble extends StatelessWidget {
  final TicketMessage message;

  const TicketMessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final isUser = message.isFromUser;

    if (isUser) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppPadding.padding18,
                      vertical: AppPadding.padding12,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(color: AppColors.cFillBorderLight, width: .7),
                    ),
                    child: Text(
                      message.text,
                      style: AppStyles.subtitle500.copyWith(
                        fontSize: AppFontSize.f14,
                        color: AppColors.cDarkBlueColor,
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ),
                ),
                10.sizedHeight,
                Text(
                  message.time,
                  style: AppStyles.subtitle500.copyWith(
                    fontSize: 11,
                    color: AppColors.cTextSubtitleLight,
                  ),
                )
              ],
            ),
          ),
          10.sizedWidth,
          CircleAvatar(
            radius: 22.r,
            backgroundColor: AppColors.cPrimary,
            child: const CustomAssetSvgImage(AssetImagesPath.profile, color: Colors.white),
          ),
        ],
      );
    } else {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 22.r,
            backgroundColor: AppColors.cPrimary.withValues(alpha: .1),
            child: const CustomAssetSvgImage(
              AssetImagesPath.headPhone,
              color: AppColors.cPrimary,
            ),
          ),
          10.sizedWidth,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppPadding.padding18,
                      vertical: AppPadding.padding12,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.cPrimary.withValues(alpha: .18),
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(color: AppColors.cPrimary.withValues(alpha: .4))
                    ),
                    child: Text(
                      message.text,
                      style: AppStyles.subtitle500.copyWith(
                        fontSize: AppFontSize.f14,
                        color: AppColors.cPrimary,
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ),
                ),
                10.sizedHeight,
                Text(
                  message.time,
                  style: AppStyles.subtitle500.copyWith(
                    fontSize: 11,
                    color: AppColors.cTextSubtitleLight,
                  ),
                )
              ],
            ),
          ),
        ],
      );
    }
  }
}
