import 'package:flutter/material.dart';

import '../../../../../config/themes/colors.dart';
import '../../../../../config/themes/styles.dart';
import '../../../../../core/extensions/widgets_extensions.dart';
import '../../../../../core/utils/app_sizes.dart';
import 'ticket_status_badge.dart';

class TicketHeaderSection extends StatelessWidget {
  final String ticketNumber;
  final String date;
  final String statusText;
  final Color statusColor;
  final Color statusTextColor;

  const TicketHeaderSection({
    super.key,
    required this.ticketNumber,
    required this.date,
    required this.statusText,
    required this.statusColor,
    required this.statusTextColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: AppPadding.padding18,
        left: AppPadding.padding18,
        right: AppPadding.padding18,
        bottom: AppPadding.padding8,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _TicketInfo(ticketNumber: ticketNumber, date: date),
          const Spacer(),
          TicketStatusBadge(
            statusText: statusText,
            statusColor: statusColor,
            statusTextColor: statusTextColor,
          ),
        ],
      ),
    );
  }
}

class _TicketInfo extends StatelessWidget {
  final String ticketNumber;
  final String date;

  const _TicketInfo({
    required this.ticketNumber,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
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
        _DateRow(date: date),
      ],
    );
  }
}

class _DateRow extends StatelessWidget {
  final String date;

  const _DateRow({required this.date});

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}

