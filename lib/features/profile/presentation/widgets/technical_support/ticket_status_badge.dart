import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../../config/themes/styles.dart';
import '../../../../../core/utils/app_sizes.dart';

class TicketStatusBadge extends StatelessWidget {
  final String statusText;
  final Color statusColor;
  final Color statusTextColor;

  const TicketStatusBadge({
    super.key,
    required this.statusText,
    required this.statusColor,
    required this.statusTextColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppPadding.padding10,
        vertical: 4,
      ),
      decoration: BoxDecoration(
        color: statusColor,
        borderRadius: BorderRadius.circular(AppBorderRadius.radius12),
      ),
      child: Text(
        statusText,
        style: AppStyles.title500.copyWith(
          fontSize: 12,
          color: statusTextColor,
        ),
      ).tr(),
    );
  }
}
