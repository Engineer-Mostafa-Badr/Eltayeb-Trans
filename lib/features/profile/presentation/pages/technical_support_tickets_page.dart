import 'package:easy_localization/easy_localization.dart';
import 'package:eltyp_delivery/core/extensions/widgets_extensions.dart';
import 'package:flutter/material.dart';

import '../../../../config/themes/colors.dart';
import '../../../../config/themes/styles.dart';
import '../../../../core/components/scaffold/shared_home_scaffold.dart';
import '../../../../core/utils/app_sizes.dart';
import '../widgets/technical_support/technical_support_tickets_header.dart';
import '../widgets/technical_support/ticket_item.dart';

class TechnicalSupportTicketsPage extends StatelessWidget {
  const TechnicalSupportTicketsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SharedHomeScaffold(
      title: 'technical_support_tickets',
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.padding36,
          vertical: AppPadding.padding24,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const TechnicalSupportTicketsHeader(),
            AppPadding.padding24.sizedHeight,
            Text(
              'my_tickets',
              style: AppStyles.title700.copyWith(
                fontSize: AppFontSize.f16,
                color: AppColors.cDarkBlueColor,
              ),
              textAlign: TextAlign.right,
            ).tr(),
            AppPadding.padding16.sizedHeight,
            TicketItem(
              statusText: 'open',
              statusColor: AppColors.cProfileGreen.withValues(alpha: .1),
              statusTextColor: AppColors.cProfileGreen,
              ticketNumber: '#T-10294',
              date: '12 يناير 2025',
              title: 'لا يمكن تحديث حالة الرحلة',
              description:
                  'حاولت أغير حالة الرحلة  إلى "تم التوصيل" لكن الزر لا يستجيب. أرجو مراجعة المشكلة.',
              time: 'آخر تحديث: منذ 10 دقائق',
            ),
            AppPadding.padding14.sizedHeight,
            TicketItem(
              statusText: 'under_review',
              statusColor: AppColors.cSecondary.withValues(alpha: .1),
              statusTextColor: AppColors.cSecondary,
              ticketNumber: '#T-10275',
              date: '11 يناير 2025',
              title: 'لا يمكن تحديث حالة الرحلة',
              description:
                  'حاولت أغير حالة الرحلة  إلى "تم التوصيل" لكن الزر لا يستجيب. أرجو مراجعة المشكلة.',
              time: 'آخر تحديث: منذ 10 دقائق',
            ),
            AppPadding.padding14.sizedHeight,
            const TicketItem(
              statusText: 'closed',
              statusColor: AppColors.cProfileGray,
              statusTextColor: AppColors.cTextSubtitleLight,
              ticketNumber: '#T-10198',
              date: '8 يناير 2025',
              title: 'لا يمكن تحديث حالة الرحلة',
              description: 'حاولت أغير حالة الرحلة  إلى "تم التوصيل" لكن الزر لا يستجيب. أرجو مراجعة المشكلة.',
              time: 'آخر تحديث: منذ 10 دقائق',
            ),
          ],
        ),
      ),
    );
  }
}
