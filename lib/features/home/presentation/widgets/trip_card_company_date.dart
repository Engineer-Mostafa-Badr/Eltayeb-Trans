import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/themes/colors.dart';
import '../../../../config/themes/styles.dart';
import '../../../../core/extensions/widgets_extensions.dart';
import '../../../../core/utils/app_sizes.dart';
import '../../data/models/trips_model.dart';
import 'trip_model_extensions.dart';

/// Company and date information row
class TripCardCompanyDate extends StatelessWidget {
  final TripModel trip;

  const TripCardCompanyDate({super.key, required this.trip});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _InfoRow(
                icon: Container(
                  width: 6.w,
                  height: 6.w,
                  decoration: const BoxDecoration(
                    color: AppColors.cPrimary,
                    shape: BoxShape.circle,
                  ),
                ),
                text: trip.company.name,
                textStyle: AppStyles.title500.copyWith(
                  color: AppColors.cTextSubtitleDark,
                ),
              ),
              10.sizedHeight,
              _InfoRow(
                icon: const Icon(
                  Icons.calendar_today_outlined,
                  color: AppColors.cTextSubtitleLight,
                ),
                text: trip.dateText,
                textStyle: AppStyles.subtitle400,
                topPadding: AppPadding.padding6,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _InfoRow extends StatelessWidget {
  final Widget icon;
  final String text;
  final TextStyle textStyle;
  final double? topPadding;

  const _InfoRow({
    required this.icon,
    required this.text,
    required this.textStyle,
    this.topPadding,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        icon,
        10.sizedWidth,
        if (topPadding != null)
          Padding(
            padding: EdgeInsets.only(top: topPadding!),
            child: Text(text, style: textStyle),
          )
        else
          Text(text, style: textStyle),
      ],
    );
  }
}
