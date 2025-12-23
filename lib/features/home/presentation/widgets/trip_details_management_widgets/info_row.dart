import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:eltyp_delivery/config/themes/colors.dart';
import 'package:eltyp_delivery/config/themes/styles.dart';
import 'package:eltyp_delivery/core/utils/app_sizes.dart';

class InfoRow extends StatelessWidget {
  const InfoRow({
    super.key,
    required this.label,
    required this.value,
  });

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$label: ',
          style: AppStyles.subtitle400.copyWith(
            color: AppColors.cTextSubtitleLight,
            fontSize: AppFontSize.f14,
          ),
        ).tr(),
        Expanded(
          child: Text(
            value,
            style: AppStyles.subtitle400.copyWith(
              color: AppColors.cTextSubtitleLight,
              fontSize: AppFontSize.f14,
            ),
          ),
        ),
      ],
    );
  }
}

