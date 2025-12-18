import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/themes/colors.dart';
import '../../../../../config/themes/styles.dart';
import '../../../../../core/components/utils/custom_rounded_container.dart';
import '../../../../../core/extensions/widgets_extensions.dart';
import '../../../../../core/utils/app_sizes.dart';

class DocumentsHeaderBanner extends StatelessWidget {
  const DocumentsHeaderBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomRoundedContainer(
      color: AppColors.cHomeLiteCard,
      child: Row(
        children: [
          Icon(Icons.info_outline, color: AppColors.cDarkBlueColor, size: 22.h),
          AppPadding.padding10.sizedWidth,
          Expanded(
            child: Text(
              'upload_required_documents_to_complete_your_account_data',
              style: AppStyles.subtitle400.copyWith(
                fontSize: AppFontSize.f14,
                color: AppColors.cTextSubtitleLight,
              ),
              textAlign: TextAlign.right,
            ).tr(),
          ),
        ],
      ),
    );
  }
}
