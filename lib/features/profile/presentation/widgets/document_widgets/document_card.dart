import 'package:easy_localization/easy_localization.dart';
import 'package:eltyp_delivery/core/components/buttons/outlined_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/themes/colors.dart';
import '../../../../../config/themes/styles.dart';
import '../../../../../core/components/images/custom_asset_svg_image.dart';
import '../../../../../core/components/utils/custom_rounded_container.dart';
import '../../../../../core/enum/enums.dart';
import '../../../../../core/extensions/widgets_extensions.dart';
import '../../../../../core/res/app_images.dart';
import '../../../../../core/utils/app_sizes.dart';

class DocumentModel {
  final String titleKey;
  final DocumentStatus status;
  final String expiryLabel;
  final String? imagePath;
  final bool hasFileIcon;

  DocumentModel({
    required this.titleKey,
    required this.status,
    required this.expiryLabel,
    this.imagePath,
    this.hasFileIcon = false,
  });
}

class DocumentCard extends StatelessWidget {
  final DocumentModel document;

  const DocumentCard({super.key, required this.document});

  Color _statusTextColor() {
    switch (document.status) {
      case DocumentStatus.valid:
        return AppColors.cProfileGreen;
      case DocumentStatus.expired:
        return AppColors.cProfileRed;
      case DocumentStatus.underReview:
        return AppColors.cLightBlueColor;
    }
  }

  Color _statusBackgroundColor() {
    switch (document.status) {
      case DocumentStatus.valid:
        return AppColors.cProfileGreen.withValues(alpha: .1);
      case DocumentStatus.expired:
        return AppColors.cProfileRed.withValues(alpha: .1);
      case DocumentStatus.underReview:
        return AppColors.cLightBlueColor.withValues(alpha: .1);
    }
  }

  String _statusKey() {
    switch (document.status) {
      case DocumentStatus.valid:
        return 'status_valid';
      case DocumentStatus.expired:
        return 'status_expired';
      case DocumentStatus.underReview:
        return 'status_under_review';
    }
  }

  IconData _statusIcon() {
    switch (document.status) {
      case DocumentStatus.valid:
        return Icons.check_circle_outline;
      case DocumentStatus.expired:
        return Icons.error_outline;
      case DocumentStatus.underReview:
        return Icons.info_outline;
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomRoundedContainer(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildRightThumbnail(),
          AppPadding.padding12.sizedWidth,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      document.titleKey,
                      style: AppStyles.title700.copyWith(
                        fontSize: AppFontSize.f16,
                        color: AppColors.cDarkBlueColor,
                      ),
                      textAlign: TextAlign.right,
                    ).tr(),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppPadding.padding12,
                        vertical: AppPadding.padding4,
                      ),
                      decoration: BoxDecoration(
                        color: _statusBackgroundColor(),
                        borderRadius: BorderRadius.circular(
                          AppBorderRadius.radius30,
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            _statusIcon(),
                            size: 14,
                            color: _statusTextColor(),
                          ),
                          6.sizedWidth,
                          Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: Text(
                              _statusKey(),
                              style: AppStyles.title600.copyWith(
                                fontSize: 11,
                                color: _statusTextColor(),
                              ),
                            ).tr(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                AppPadding.padding10.sizedHeight,
                Text(
                  '${'expire_at:'.tr()} ${document.expiryLabel}',
                  style: AppStyles.subtitle500.copyWith(
                    fontSize: 12,
                    color: AppColors.cTextSubtitleLight,
                  ),
                  textAlign: TextAlign.right,
                ),
                AppPadding.padding16.sizedHeight,
                _DocumentActionButton(
                  textKey: document.status == DocumentStatus.valid
                      ? 'update_document'
                      : 'upload_document',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRightThumbnail() {
    if (document.imagePath != null && !document.hasFileIcon) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(AppBorderRadius.radius16),
        child: Image.asset(
          document.imagePath!,
          width: 60.w,
          height: 60.h,
          fit: BoxFit.cover,
        ),
      );
    }

    return Container(
      width: 60.w,
      height: 60.h,
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(AppBorderRadius.radius16),
      ),
      child: const Center(
        child: CustomAssetSvgImage(
          AssetImagesPath.emptyFile,
          color: AppColors.cTextSubtitleLight,
        ),
      ),
    );
  }
}

class _DocumentActionButton extends StatelessWidget {
  final String textKey;

  const _DocumentActionButton({required this.textKey});

  @override
  Widget build(BuildContext context) {
    return ReusedOutlinedButton(
      height: 40.h,
      radius: 12,
      text: '',
      rowWidget: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          5.sizedWidth,
          const CustomAssetSvgImage(
            AssetImagesPath.exitUp,
            color: AppColors.cPrimary,
          ),
          8.sizedWidth,
          Text(
            textKey,
            style: AppStyles.title500.copyWith(
              fontSize: AppFontSize.f14,
              color: AppColors.cPrimary,
            ),
          ).tr(),
          5.sizedWidth,
        ],
      ),
      onPressed: () {},
    );
  }
}
