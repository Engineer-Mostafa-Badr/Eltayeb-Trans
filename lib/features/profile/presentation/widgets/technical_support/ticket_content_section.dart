import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../config/themes/colors.dart';
import '../../../../../config/themes/styles.dart';
import '../../../../../core/components/images/custom_asset_svg_image.dart';
import '../../../../../core/extensions/widgets_extensions.dart';
import '../../../../../core/res/app_images.dart';
import '../../../../../core/utils/app_sizes.dart';

class TicketContentSection extends StatelessWidget {
  final String title;
  final String description;

  const TicketContentSection({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: AppPadding.padding8,
        left: AppPadding.padding18,
        right: AppPadding.padding18,
        bottom: AppPadding.padding18,
      ),
      child: Column(
        children: [
          _ContentRow(title: title, description: description),
          const Divider(color: AppColors.cFillBorderLight),
        ],
      ),
    );
  }
}

class _ContentRow extends StatelessWidget {
  final String title;
  final String description;

  const _ContentRow({
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _ChatIcon(),
        12.sizedWidth,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppStyles.title500.copyWith(
                  fontSize: AppFontSize.f16,
                  color: AppColors.cPrimary,
                ),
              ).tr(),
              AppPadding.padding6.sizedHeight,
              Text(
                description,
                style: AppStyles.subtitle500.copyWith(
                  fontSize: AppFontSize.f14,
                ),
              ).tr(),
            ],
          ),
        ),
      ],
    );
  }
}

class _ChatIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 38,
      height: 38,
      decoration: BoxDecoration(
        color: AppColors.cPrimary.withValues(alpha: .1),
        borderRadius: BorderRadius.circular(AppBorderRadius.radius12),
      ),
      child: const FittedBox(
        fit: BoxFit.scaleDown,
        child: CustomAssetSvgImage(
          AssetImagesPath.chatIcon,
          color: AppColors.cPrimary,
        ),
      ),
    );
  }
}

