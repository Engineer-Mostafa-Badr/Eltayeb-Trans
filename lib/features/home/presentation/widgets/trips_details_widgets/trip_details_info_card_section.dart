import 'package:easy_localization/easy_localization.dart';
import 'package:eltyp_delivery/core/components/utils/custom_rounded_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/themes/colors.dart';
import '../../../../../config/themes/styles.dart';
import '../../../../../core/components/images/custom_asset_svg_image.dart';
import '../../../../../core/res/app_images.dart';
import '../../../../../core/utils/app_sizes.dart';
import '../../../data/models/trips_model.dart';

class TripDetailsInfoCardSection extends StatelessWidget {
  const TripDetailsInfoCardSection({super.key, required this.trip});

  final TripModel trip;

  String _formatCurrency(num value) {
    return '${value.toStringAsFixed(2)} جنيه';
  }

  String _formatQuantity(int quantity) {
    return '$quantity كرتون';
  }

  @override
  Widget build(BuildContext context) {
    final driverName = trip.driver?.name ?? '-';
    const truckNumber = '-';
    final goodsTypeName = trip.goodsType?.name ?? '-';
    final quantityText = _formatQuantity(trip.quantity);
    final priceText = _formatCurrency(trip.price);
    final totalText = _formatCurrency(trip.total);

    return CustomRoundedContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'trip_info',
            style: AppStyles.title700.copyWith(fontSize: AppFontSize.f15),
          ).tr(),
          SizedBox(height: 16.h),
          TripDetailsInfoRow(
            label: 'driver',
            value: driverName,
            icon: AssetImagesPath.profile,
          ),
          SizedBox(height: 16.h),
          const TripDetailsInfoRow(
            label: 'truck_number',
            value: truckNumber,
            icon: AssetImagesPath.track,
          ),
          SizedBox(height: 16.h),
          TripDetailsInfoRow(
            label: 'type_of_goods',
            value: goodsTypeName,
            icon: AssetImagesPath.box,
          ),
          SizedBox(height: 16.h),
          TripDetailsInfoRow(
            label: 'quantity',
            value: quantityText,
            icon: AssetImagesPath.box,
          ),
          SizedBox(height: 16.h),
          const Divider(color: AppColors.cHomeLiteCard),
          SizedBox(height: 10.h),
          TripDetailsInfoRow(
            label: 'trip_price',
            value: priceText,
            icon: AssetImagesPath.dollar,
            textStyle: AppStyles.title700.copyWith(
              color: AppColors.cPrimary,
              fontSize: AppFontSize.f14,
            ),
          ),
          SizedBox(height: 16.h),
          TripDetailsInfoRow(
            label: 'total',
            value: totalText,
            icon: AssetImagesPath.dollar,
            textStyle: AppStyles.title700.copyWith(
              color: AppColors.cDarkBlueColor,
              fontSize: AppFontSize.f16,
            ),
          ),
        ],
      ),
    );
  }
}

class TripDetailsInfoRow extends StatelessWidget {
  final String label;
  final String value;
  final String icon;
  final TextStyle? textStyle;

  const TripDetailsInfoRow({
    super.key,
    required this.label,
    required this.value,
    required this.icon,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomAssetSvgImage(
          icon,
          height: 18.h,
          color: AppColors.cTextSubtitleLight,
        ),
        SizedBox(width: 8.w),
        Text(
          label,
          textAlign: TextAlign.right,
          style:
              textStyle ??
              AppStyles.subtitle400.copyWith(
                color: AppColors.cTextSubtitleLight,
                fontSize: AppFontSize.f13,
              ),
        ).tr(),
        const Spacer(),
        Text(
          value,
          textAlign: TextAlign.left,
          style:
              textStyle ??
              AppStyles.subtitle400.copyWith(
                color: AppColors.cTextSubtitleLight,
                fontSize: AppFontSize.f13,
              ),
        ),
      ],
    );
  }
}
