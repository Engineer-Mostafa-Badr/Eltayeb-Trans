import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/themes/colors.dart';
import '../../../../config/themes/styles.dart';
import '../../../../core/components/buttons/outlined_button.dart';
import '../../../../core/components/images/custom_asset_svg_image.dart';
import '../../../../core/extensions/navigation_extensions.dart';
import '../../../../core/extensions/widgets_extensions.dart';
import '../../../../core/res/app_images.dart';
import '../../../../core/utils/app_sizes.dart';
import '../../../expenses/presentation/pages/new_expenses_page.dart';
import '../../data/models/trips_model.dart';
import '../pages/maintenance_request_page.dart';
import '../pages/trips_details_page.dart';

/// Actions section with trip details and action buttons
class TripCardActions extends StatelessWidget {
  final TripModel trip;

  const TripCardActions({super.key, required this.trip});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ReusedOutlinedButton(
          width: double.maxFinite,
          text: 'تفاصيل الرحلة',
          onPressed: () =>
              context.navigateToPage(TripDetailsPage(tripId: trip.id)),
          color: AppColors.cPrimary,
          textStyle: AppStyles.title700.copyWith(
            fontSize: AppFontSize.f16,
            color: Colors.white,
          ),
          height: 55.h,
        ),
        12.sizedHeight,
        Row(
          children: [
            Expanded(
              child: _ActionButton(
                icon: AssetImagesPath.add,
                text: 'adding_expenses',
                onPressed: () =>
                    context.navigateToPage(NewExpensesPage(tripId: trip.id)),
              ),
            ),
            12.sizedWidth,
            Expanded(
              child: _ActionButton(
                icon: AssetImagesPath.buildRounded,
                text: 'طلب صيانة',
                onPressed: () => context.navigateToPage(
                  MaintenanceRequestPage(tripId: trip.id),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _ActionButton extends StatelessWidget {
  final String icon;
  final String text;
  final VoidCallback onPressed;

  const _ActionButton({
    required this.icon,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ReusedOutlinedButton(
      text: text,
      onPressed: onPressed,
      rowWidget: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomAssetSvgImage(icon),
          6.sizedWidth,
          Text(
            text,
            style: TextStyle(
              color: AppColors.cPrimary,
              fontWeight: FontWeight.w700,
              fontSize: 15.sp,
            ),
          ).tr(),
        ],
      ),
    );
  }
}
