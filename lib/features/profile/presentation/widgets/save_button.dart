import 'package:flutter/material.dart';
import '../../../../../config/themes/colors.dart';
import '../../../../../core/components/widgets/custom_elevated_button.dart';

class SaveButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const SaveButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: CustomElevatedButton(
        onPressed: onPressed,
        text: 'حفظ التعديلات',
        backgroundColor: AppColors.cPrimaryDark,
        borderRadius: 24,
        minimumSize: const Size(double.infinity, 48),
      ),
    );
  }
}
