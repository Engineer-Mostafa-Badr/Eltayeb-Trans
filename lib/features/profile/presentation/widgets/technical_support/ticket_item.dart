import 'package:eltyp_delivery/core/extensions/navigation_extensions.dart';
import 'package:eltyp_delivery/core/extensions/widgets_extensions.dart';
import 'package:eltyp_delivery/features/profile/presentation/pages/ticket_details_page.dart';
import 'package:flutter/material.dart';

import '../../../../../config/themes/colors.dart';
import '../../../../../core/components/utils/custom_rounded_container.dart';
import '../../../../../core/utils/app_sizes.dart';
import 'ticket_content_section.dart';
import 'ticket_footer_section.dart';
import 'ticket_header_section.dart';

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
            TicketHeaderSection(
              ticketNumber: ticketNumber,
              date: date,
              statusText: statusText,
              statusColor: statusColor,
              statusTextColor: statusTextColor,
            ),
            const Divider(color: AppColors.cFillBorderLight),
            TicketContentSection(title: title, description: description),
            TicketFooterSection(time: time),
            AppPadding.padding18.sizedHeight,
          ],
        ),
      ),
    );
  }
}
