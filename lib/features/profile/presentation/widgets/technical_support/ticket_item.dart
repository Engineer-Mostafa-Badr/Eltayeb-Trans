import 'package:easy_localization/easy_localization.dart';
import 'package:eltyp_delivery/core/components/images/custom_asset_svg_image.dart';
import 'package:eltyp_delivery/core/extensions/navigation_extensions.dart';
import 'package:eltyp_delivery/core/extensions/widgets_extensions.dart';
import 'package:eltyp_delivery/core/res/app_images.dart';
import 'package:eltyp_delivery/features/profile/presentation/pages/ticket_details_page.dart';
import 'package:flutter/material.dart';

import '../../../../../config/themes/colors.dart';
import '../../../../../config/themes/styles.dart';
import '../../../../../core/components/utils/custom_rounded_container.dart';
import '../../../../../core/utils/app_sizes.dart';

class TicketItem extends StatelessWidget {
  final String statusText;
  final Color statusColor;
  final Color statusTextColor;
  final String ticketNumber;
  final String date;
  final String title;
  final String description;
  final String time;

  const TicketItem({
    super.key,
    required this.statusText,
    required this.statusColor,
    required this.statusTextColor,
    required this.ticketNumber,
    required this.date,
    required this.title,
    required this.description,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.navigateToPage(const TicketDetailsPage()),
      child: CustomRoundedContainer(
        padding: EdgeInsets.zero,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: AppPadding.padding18,
                left: AppPadding.padding18,
                right: AppPadding.padding18,
                bottom: AppPadding.padding8,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        ticketNumber,
                        style: AppStyles.title600.copyWith(
                          fontSize: 13,
                          color: AppColors.cDarkBlueColor,
                        ),
                      ),
                      AppPadding.padding6.sizedHeight,
                      Row(
                        children: [
                          const Icon(
                            Icons.calendar_today_outlined,
                            size: 16,
                            color: AppColors.cTextSubtitleLight,
                          ),
                          AppPadding.padding4.sizedWidth,
                          Text(
                            date,
                            style: AppStyles.subtitle500.copyWith(
                              fontSize: 12,
                              color: AppColors.cTextSubtitleLight,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppPadding.padding10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: statusColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      statusText,
                      style: AppStyles.title500.copyWith(fontSize: 12, color: statusTextColor),
                    ).tr(),
                  ),
                ],
              ),
            ),
            const Divider(color: AppColors.cFillBorderLight),
            Padding(
              padding: const EdgeInsets.only(
                top: AppPadding.padding8,
                left: AppPadding.padding18,
                right: AppPadding.padding18,
                bottom: AppPadding.padding18,
              ),

              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 38,
                        height: 38,
                        decoration: BoxDecoration(
                          color: AppColors.cPrimary.withValues(alpha: .1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const FittedBox(
                          fit: BoxFit.scaleDown,
                          child: CustomAssetSvgImage(
                            AssetImagesPath.chatIcon,
                            color: AppColors.cPrimary,
                          ),
                        ),
                      ),
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
                              style: AppStyles.subtitle500.copyWith(fontSize: AppFontSize.f14),
                            ).tr(),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Divider(color: AppColors.cFillBorderLight),
                  Row(
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
