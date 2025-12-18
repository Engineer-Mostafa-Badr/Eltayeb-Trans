import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../config/themes/colors.dart';
import '../../../../../config/themes/styles.dart';
import '../../../../../core/utils/app_sizes.dart';

class TicketInputBar extends StatelessWidget {
  const TicketInputBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppPadding.padding30,
        vertical: AppPadding.padding10,
      ),
      decoration: const BoxDecoration(color: Colors.white),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: const Color(0xFFF6F7FB),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: .08),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: const Icon(Icons.attach_file_rounded, size: 20, color: AppColors.cPrimary),
            ),

            const SizedBox(width: 12),

            Expanded(
              child: TextField(
                textAlign: TextAlign.right,
                decoration: InputDecoration(
                  hintText: 'write_your_message_here'.tr(),
                  border: InputBorder.none,
                  hintStyle: AppStyles.subtitle500.copyWith(
                    fontSize: 13,
                    color: AppColors.cTextSubtitleLight,
                  ),
                ),
              ),
            ),

            const SizedBox(width: 12),

            Container(
              width: 45,
              height: 45,
              decoration: const BoxDecoration(color: AppColors.cPrimary, shape: BoxShape.circle),
              child: const Icon(Icons.send_rounded, size: 22, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
