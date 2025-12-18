import 'package:eltyp_delivery/core/components/images/custom_asset_svg_image.dart';
import 'package:eltyp_delivery/core/components/utils/custom_rounded_container.dart';
import 'package:eltyp_delivery/core/res/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/themes/colors.dart';
import '../../../../config/themes/styles.dart';
import '../../../../core/enum/enums.dart';
import '../../../../core/extensions/widgets_extensions.dart';
import '../../../../core/utils/app_sizes.dart';

class AppNotification {
  final int id;
  final String title;
  final String body;
  final String timeLabel;
  final NotificationType type;
  final bool isRead;

  AppNotification({required this.id, required this.title, required this.body, required this.timeLabel, required this.type, required this.isRead});
}
class NotificationCard extends StatelessWidget {
  final AppNotification notification;

  const NotificationCard({super.key, required this.notification});

  Color _iconBackground() {
    switch (notification.type) {
      case NotificationType.trip:
        return AppColors.cLightBlueColor.withValues(alpha: .2);
      case NotificationType.maintenance:
        return AppColors.cSecondary.withValues(alpha: .2);
      case NotificationType.expense:
        return AppColors.cCyan;
      case NotificationType.appUpdate:
        return AppColors.cMoveLight;
    }
  }

  String _iconData() {
    switch (notification.type) {
      case NotificationType.trip:
        return AssetImagesPath.track;
      case NotificationType.maintenance:
        return AssetImagesPath.buildRounded;
      case NotificationType.expense:
        return AssetImagesPath.approveOrder;
      case NotificationType.appUpdate:
        return AssetImagesPath.notification;
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool isRead = notification.isRead;

    return Stack(
      children: [
        Positioned.fill(
          child: Container(
            margin: EdgeInsets.only(left: 3.w),
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            decoration: BoxDecoration(
              color: AppColors.cPrimary,
              borderRadius: BorderRadius.circular(20.r),
              boxShadow: AppStyles.secondUsedBoxShadow(opacity: 0.12),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 3.0),
          child: CustomRoundedContainer(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 19.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(color: _iconBackground(), shape: BoxShape.circle),
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: CustomAssetSvgImage(_iconData(), height: 20.h, color: AppColors.cDarkBlueColor),
                  ),
                ),
                AppPadding.padding14.sizedWidth,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        notification.title,
                        style: AppStyles.title700.copyWith(fontSize: AppFontSize.f16, color: AppColors.cDarkBlueColor),
                        textAlign: TextAlign.right,
                      ),
                      AppPadding.padding6.sizedHeight,
                      Text(
                        notification.body,
                        style: AppStyles.subtitle400.copyWith(fontSize: AppFontSize.f14, color: AppColors.cTextSubtitleLight),
                        textAlign: TextAlign.right,
                      ),
                      AppPadding.padding10.sizedHeight,
                      Text(
                        notification.timeLabel,
                        style: AppStyles.subtitle400.copyWith(fontSize: AppFontSize.f10, color: AppColors.boldGreyColor),
                        textAlign: TextAlign.right,
                      ),
                    ],
                  ),
                ),
                if (!isRead) ...[
                  Container(
                    width: 8,
                    height: 8,
                    margin: EdgeInsets.only(top: 4.h),
                    decoration: const BoxDecoration(color: AppColors.cPrimary, shape: BoxShape.circle),
                  ),
                  AppPadding.padding10.sizedWidth,
                ],
              ],
            ),
          ),
        ),
      ],
    );
  }
}
