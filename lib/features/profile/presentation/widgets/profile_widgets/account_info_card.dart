import 'package:easy_localization/easy_localization.dart';
import 'package:eltyp_delivery/core/components/utils/custom_rounded_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/themes/colors.dart';
import '../../../../../config/themes/styles.dart';
import '../../../../../core/components/images/custom_asset_svg_image.dart';
import '../../../../../core/extensions/widgets_extensions.dart';
import '../../../../../core/res/app_images.dart';
import '../../../../../core/utils/app_sizes.dart';

class AccountInfoCard extends StatelessWidget {
  const AccountInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomRoundedContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'account_info',
            style: AppStyles.title700.copyWith(
              fontSize: AppFontSize.f16,
              color: AppColors.cDarkBlueColor,
            ),
            textAlign: TextAlign.right,
          ).tr(),
          AppPadding.padding18.sizedHeight,
          const InfoRow(
            labelKey: 'name',
            valueKey: 'khaled_abdelrahman',
            iconPath: AssetImagesPath.profile,
          ),
          const Divider(height: 24),
          const InfoRow(
            labelKey: 'phone_number',
            valueKey: '010xxxxxxxx',
            iconPath: AssetImagesPath.call,
          ),
          const Divider(height: 24),
          const InfoRow(
            labelKey: 'id_number',
            valueKey: '2981012345678',
            iconPath: AssetImagesPath.id,
          ),
          const Divider(height: 24),
          const InfoRow(
            labelKey: 'email',
            valueKey: 'optional@example.com',
            iconPath: AssetImagesPath.circumstance,
          ),
          const Divider(height: 24),
          const InfoRow(
            labelKey: 'assigned_truck',
            valueKey: 'ر.ق 1234',
            iconPath: AssetImagesPath.track,
            noArrow: true,
          ),
        ],
      ),
    );
  }
}

class InfoRow extends StatelessWidget {
  final String labelKey;
  final String valueKey;
  final String iconPath;
  final bool? noArrow;
  final void Function()? onTap;

  const InfoRow({
    super.key,
    required this.labelKey,
    required this.valueKey,
    required this.iconPath,
    this.noArrow,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: AppColors.cNotificationTap,
            radius: 25.r,
            child: CustomAssetSvgImage(iconPath, color: AppColors.cDarkBlueColor),
          ),
          AppPadding.padding12.sizedWidth,
          Text(
            labelKey,
            style: AppStyles.subtitle500.copyWith(
              fontSize: AppFontSize.f14,
              color: AppColors.cTextSubtitleLight,
            ),
            textAlign: TextAlign.right,
          ).tr(),
          AppPadding.padding4.sizedWidth,
          const Spacer(),
          SizedBox(
            width: 100,
            child: Text(
              valueKey,
              style: AppStyles.title700.copyWith(
                fontSize: AppFontSize.f15,
                color: AppColors.cDarkBlueColor,
              ),
              textAlign: TextAlign.right,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ).tr(),
          ),
          if (noArrow != true) AppPadding.padding10.sizedWidth,
          if (noArrow != true)
            Icon(Icons.arrow_forward_ios_rounded, color: AppColors.cTextSubtitleDark, size: 20.h),
        ],
      ),
    );
  }
}
