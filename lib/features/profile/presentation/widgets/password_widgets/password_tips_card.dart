import 'package:eltyp_delivery/config/themes/styles.dart';
import 'package:flutter/material.dart';
import 'package:eltyp_delivery/config/themes/colors.dart';
import 'package:eltyp_delivery/core/utils/app_sizes.dart';
import 'package:eltyp_delivery/core/extensions/widgets_extensions.dart';

class PasswordTipsCard extends StatelessWidget {
  const PasswordTipsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppPadding.padding20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppBorderRadius.radius20),
        boxShadow: AppStyles.secondUsedBoxShadow(opacity: 0.03),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'نصائح لكلمة مرور قوية',
            style: TextStyle(
              color: AppColors.cPrimary,
              fontWeight: FontWeight.bold,
              fontSize: AppFontSize.f15,
            ),
          ),
          AppPadding.padding12.sizedHeight,
          _buildTipItem('استخدم 8 أحرف على الأقل'),
          _buildTipItem('اجمع بين الأحرف الكبيرة والصغيرة'),
          _buildTipItem('أضف أرقاماً ورموزاً خاصة'),
          _buildTipItem('تجنب المعلومات الشخصية الواضحة'),
        ],
      ),
    );
  }

  Widget _buildTipItem(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppPadding.padding8),
      child: Row(
        children: [
          Container(
            width: 4,
            height: 4,
            decoration: BoxDecoration(color: AppColors.cPrimary),
          ),
          AppPadding.padding10.sizedWidth,
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                color: Colors.blueGrey.shade700,
                fontSize: AppFontSize.f13,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
