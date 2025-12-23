import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../config/themes/colors.dart';
import '../../../../../config/themes/styles.dart';
import '../../../../../core/utils/app_sizes.dart';

class TicketFooterSection extends StatelessWidget {
  final String time;

  const TicketFooterSection({
    super.key,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.padding18),
      child: Row(
        children: [
          Text(
            time,
            style: AppStyles.subtitle500.copyWith(
              fontSize: 11,
              color: AppColors.cTextSubtitleLight,
            ),
          ).tr(),
          const Spacer(),
          const Icon(
            Icons.arrow_forward_ios_rounded,
            size: 16,
            color: AppColors.cTextSubtitleLight,
          ),
        ],
      ),
    );
  }
}

