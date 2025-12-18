import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../config/themes/colors.dart';
import '../../../config/themes/styles.dart';
import '../../utils/app_sizes.dart';

class PinTextFormField extends StatelessWidget {
  const PinTextFormField({
    super.key,
    required this.controller,
    this.validator,
    this.length = 4,
    required this.onChanged,
    required this.onComplete,
  });

  final TextEditingController controller;
  final FormFieldValidator<String>? validator;
  final int length;
  final Function(String) onChanged;
  final Function(String) onComplete;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: PinCodeTextField(
        appContext: context,
        length: length,
        controller: controller,
        keyboardType: TextInputType.number,
        animationType: AnimationType.fade,
        animationDuration: const Duration(milliseconds: 200),
        backgroundColor: Colors.transparent,
        cursorColor: Colors.white,
        pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(16),
          activeBorderWidth: 1.2,
          borderWidth: 1.2,
          selectedBorderWidth: 1.2,
          disabledBorderWidth: 1.2,
          errorBorderWidth: 1.2,
          inactiveBorderWidth: 1.2,
          fieldHeight: 80,
          fieldWidth: 60,
          activeFillColor: AppColors.cPinColor,
          selectedColor: AppColors.cPrimary,
          activeColor: AppColors.cPrimary,
          inactiveColor: AppColors.cPinColor,
        ),
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        validator: validator,
        // controller: textEditingController,
        textStyle: AppStyles.title600.copyWith(
          fontSize: AppFontSize.f16,
          color: Colors.black,
        ),
        onCompleted: onComplete,
        onChanged: onChanged,
        autoDisposeControllers: false,
        beforeTextPaste: (text) {
          return true;
        },
      ),
    );
  }
}
