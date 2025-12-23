import 'package:easy_localization/easy_localization.dart';
import 'package:eltyp_delivery/core/components/widgets/custom_elevated_button.dart';
import 'package:eltyp_delivery/config/themes/colors.dart';
import 'package:eltyp_delivery/core/utils/app_sizes.dart';
import 'package:flutter/material.dart';

class TruckDetailsBottomAction extends StatelessWidget {
  final bool isEnabled;
  final VoidCallback? onPressed;

  const TruckDetailsBottomAction({
    super.key,
    required this.isEnabled,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: CustomElevatedButton(
        text: 'confirm_truck_change'.tr(),
        onPressed: isEnabled ? onPressed : null,
        backgroundColor: AppColors.cTruckDetailsButton,
        foregroundColor: Colors.white,
        borderRadius: AppBorderRadius.radius16,
        minimumSize: const Size(double.infinity, 55),
        textStyle: TextStyle(
          fontSize: AppFontSize.f16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

