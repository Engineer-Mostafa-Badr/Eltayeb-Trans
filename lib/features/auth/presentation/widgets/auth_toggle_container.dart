import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eltyp_delivery/config/themes/colors.dart';
import 'package:eltyp_delivery/config/themes/styles.dart';
import 'package:eltyp_delivery/core/extensions/widgets_extensions.dart';
import 'package:eltyp_delivery/core/utils/app_sizes.dart';

enum AuthToggleType { login_with_phone, login_with_email }

class AuthToggleContainer extends StatelessWidget {
  const AuthToggleContainer({
    super.key,
    required this.title,
    this.isSelected = false,
    this.onToggle,
  });

  final String title;
  final bool isSelected;
  final Function()? onToggle;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      constraints: BoxConstraints(minWidth: 172.w),
      padding: const EdgeInsets.all(AppPadding.smallPadding),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.cPrimary : const Color(0xFFF0F0F0),
        borderRadius: BorderRadius.circular(AppBorderRadius.radius8),
      ),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: AppStyles.title600.copyWith(
          color: isSelected ? Colors.white : AppColors.cPrimary,
          fontSize: AppFontSize.f12,
        ),
      ).tr(),
    ).addAction(onTap: onToggle);
  }
}
