import 'package:easy_localization/easy_localization.dart';
import 'package:eltyp_delivery/core/extensions/navigation_extensions.dart';
import 'package:eltyp_delivery/core/extensions/widgets_extensions.dart';
import 'package:eltyp_delivery/features/profile/presentation/pages/new_ticket_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/themes/colors.dart';
import '../../../../../config/themes/styles.dart';
import '../../../../../core/components/utils/custom_rounded_container.dart';
import '../../../../../core/utils/app_sizes.dart';

class TechnicalSupportTicketsHeader extends StatelessWidget {
  const TechnicalSupportTicketsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:() =>  context.navigateToPage(const NewSupportTicketPage()),
      child: CustomRoundedContainer(
        padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.padding24,
          vertical: AppPadding.padding24,
        ),
        child: Row(
          children: [
            Container(
              width: 56.w,
              height: 56.h,
              decoration: BoxDecoration(
                color: AppColors.cPrimary.withValues(alpha: .1),
                borderRadius: BorderRadius.circular(14),
              ),
              child: const Icon(
                Icons.add_circle_outline_outlined,
                color: AppColors.cPrimary,
                size: 26,
              ),
            ),
            AppPadding.padding12.sizedWidth,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'open_new_ticket',
                    style: AppStyles.title500.copyWith(
                      fontSize: AppFontSize.f16,
                      color: AppColors.cPrimary,
                    ),
                    textAlign: TextAlign.right,
                  ).tr(),
                  AppPadding.padding6.sizedHeight,
                  Text(
                    'tell_us_about_your_problem',
                    style: AppStyles.subtitle500.copyWith(
                      fontSize: 12,
                      color: AppColors.cTextSubtitleLight,
                    ),
                    textAlign: TextAlign.right,
                  ).tr(),
                ],
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 18,
              color: AppColors.cTextSubtitleLight,
            ),
          ],
        ),
      ),
    );
  }
}
