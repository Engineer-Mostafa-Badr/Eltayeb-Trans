import 'package:eltyp_delivery/config/themes/styles.dart';
import 'package:flutter/material.dart';
import 'package:eltyp_delivery/core/components/widgets/custom_text_field.dart';
import 'package:eltyp_delivery/config/themes/colors.dart';
import 'package:eltyp_delivery/core/utils/app_sizes.dart';
import 'package:eltyp_delivery/core/extensions/widgets_extensions.dart';

class PasswordFormCard extends StatelessWidget {
  final TextEditingController currentPasswordController;
  final TextEditingController newPasswordController;
  final TextEditingController confirmPasswordController;

  const PasswordFormCard({
    super.key,
    required this.currentPasswordController,
    required this.newPasswordController,
    required this.confirmPasswordController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppPadding.padding20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppBorderRadius.radius20),
        boxShadow: AppStyles.secondUsedBoxShadow(opacity: 0.03),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildPasswordField(
            label: 'كلمة المرور الحالية',
            hint: 'أدخل كلمة المرور الحالية',
            controller: currentPasswordController,
          ),
          AppPadding.padding16.sizedHeight,
          _buildPasswordField(
            label: 'كلمة المرور الجديدة',
            hint: 'أدخل كلمة المرور الجديدة',
            controller: newPasswordController,
            helperText: 'يجب أن تحتوي كلمة المرور على 8 أحرف على الأقل',
          ),
          AppPadding.padding16.sizedHeight,
          _buildPasswordField(
            label: 'تأكيد كلمة المرور الجديدة',
            hint: 'أعد إدخال كلمة المرور الجديدة',
            controller: confirmPasswordController,
          ),
        ],
      ),
    );
  }

  Widget _buildPasswordField({
    required String label,
    required String hint,
    required TextEditingController controller,
    String? helperText,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: AppColors.cPrimary,
            fontWeight: FontWeight.w600,
            fontSize: AppFontSize.f13,
          ),
        ),
        AppPadding.padding8.sizedHeight,
        CustomTextField(
          controller: controller,
          hintText: hint,
          isPassword: true,
          labelText: label,
          textAlign: TextAlign.right,
          textDirection: TextDirection.rtl,
          fillColor: Colors.white,
          borderColor: Colors.grey.shade300,
          focusedBorderColor: AppColors.cPrimary,
          borderRadius: AppBorderRadius.radius12,
        ),
        if (helperText != null)
          Padding(
            padding: const EdgeInsets.only(
              top: AppPadding.padding8,
              right: AppPadding.padding4,
            ),
            child: Text(
              helperText,
              style: TextStyle(
                color: Colors.grey.shade400,
                fontSize: AppFontSize.f11,
              ),
            ),
          ),
      ],
    );
  }
}
