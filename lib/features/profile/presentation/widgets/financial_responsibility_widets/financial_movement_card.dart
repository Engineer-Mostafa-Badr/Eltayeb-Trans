import 'package:easy_localization/easy_localization.dart';
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
import '../../pages/financial_responsibility_page.dart';

class FinancialMovementCard extends StatelessWidget {
  final FinancialMovement movement;

  const FinancialMovementCard({super.key, required this.movement});
  String _amountLabel() {
    final sign = movement.isIncome ? '+ ' : '- ';
    return '$sign${movement.amount.toStringAsFixed(0)} ج.م';
  }

  Color _amountColor() {
    return movement.isIncome ? AppColors.cProfileGreen : AppColors.cProfileRed;
  }

  Color _statusColor() {
    return movement.isIncome ? AppColors.cProfileGreen : AppColors.cProfileRed;
  }

  String _iconPath() {
    switch (movement.type) {
      case FinancialMovementType.returnAdd:
        return AssetImagesPath.wallet;
      case FinancialMovementType.fuel:
        return AssetImagesPath.gasStation;
      case FinancialMovementType.maintenance:
        return AssetImagesPath.buildRounded;
      case FinancialMovementType.tire:
        return AssetImagesPath.gasStation;
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomRoundedContainer(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 24.r,
            backgroundColor: _statusColor().withValues(alpha: .10),
            child: CustomAssetSvgImage(_iconPath(), color: _statusColor()),
          ),
          AppPadding.padding12.sizedWidth,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                movement.title,
                style: AppStyles.title500.copyWith(fontSize: AppFontSize.f15),
                textAlign: TextAlign.right,
              ),
              5.sizedHeight,
              Text(
                movement.dateLabel,
                style: AppStyles.subtitle500.copyWith(
                  fontSize: 11,
                  color: AppColors.cUnSelectedIconLight,
                ),
              ),
              if (movement.tripLabel != null) ...[
                5.sizedHeight,
                Text(
                  movement.tripLabel!,
                  style: AppStyles.subtitle500.copyWith(
                    fontSize: 11,
                    color: AppColors.cUnSelectedIconLight,
                  ),
                ),
              ],
            ],
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                _amountLabel(),
                style: AppStyles.title700.copyWith(
                  fontSize: 15,
                  color: _amountColor(),
                ),
              ),
              AppPadding.padding6.sizedHeight,
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppPadding.padding6,
                  vertical: AppPadding.padding4,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: _statusColor().withValues(alpha: .10),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 3.0),
                      child: Text(
                        movement.statusKey,
                        style: AppStyles.subtitle600.copyWith(
                          fontSize: 11,
                          color: _statusColor(),
                        ),
                      ).tr(),
                    ),
                    4.sizedWidth,
                    Icon(
                      movement.isIncome
                          ? Icons.check_circle_outline
                          : Icons.cancel_outlined,
                      size: 14,
                      color: _statusColor(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
