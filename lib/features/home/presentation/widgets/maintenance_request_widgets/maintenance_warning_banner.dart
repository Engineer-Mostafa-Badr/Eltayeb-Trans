import 'package:easy_localization/easy_localization.dart';
import 'package:eltyp_delivery/core/components/images/custom_asset_svg_image.dart';
import 'package:eltyp_delivery/core/extensions/widgets_extensions.dart';
import 'package:eltyp_delivery/core/res/app_images.dart';
import 'package:flutter/material.dart';

import '../../../../../config/themes/colors.dart';
import '../../../../../config/themes/styles.dart';
import '../../../../../core/utils/app_sizes.dart';

class MaintenanceWarningBanner extends StatelessWidget {
  const MaintenanceWarningBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.padding28, vertical: AppPadding.padding20),
      decoration: BoxDecoration(color: AppColors.cPrimary.withValues(alpha: .06), borderRadius: BorderRadius.circular(AppBorderRadius.radius10)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomAssetSvgImage(AssetImagesPath.buildRoundedCircle),
          AppPadding.padding10.sizedWidth,
          Expanded(
            child: Text(
              'write_a_maintenance_report_so_the_maintenance_department_can_receive_it_and_follow_up_immediately.',
              style: AppStyles.subtitle500.copyWith(color: AppColors.cTextSubtitleLight, fontSize: 14),
              textAlign: TextAlign.right,
            ).tr(),
          ),
        ],
      ),
    );
  }
}
