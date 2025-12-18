import 'package:flutter/material.dart';

import '../../../../config/themes/colors.dart';
import '../../../../config/themes/styles.dart';
import '../../../../core/utils/app_sizes.dart';

class LoginTitleSection extends StatelessWidget {
  const LoginTitleSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'تسجيل الدخول',
          textAlign: TextAlign.right,
          style: AppStyles.title800.copyWith(fontSize: AppFontSize.f32, color: AppColors.cDarkBlueColor),
        ),
        const SizedBox(height: 8),
        Text(
          'أدخل رقم هاتفك للمتابعة',
          textAlign: TextAlign.right,
          style: AppStyles.subtitle400.copyWith(fontSize: AppFontSize.f16),
        ),
      ],
    );
  }
}
