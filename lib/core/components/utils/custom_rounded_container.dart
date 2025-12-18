import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/themes/styles.dart';

class CustomRoundedContainer extends StatelessWidget {
  const CustomRoundedContainer({
    super.key,
    required this.child,
    this.padding,
    this.color,
  });
  final Widget child;
  final EdgeInsets? padding;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          padding ?? EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: color ?? Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: AppStyles.secondUsedBoxShadow(opacity: 0.12),
      ),
      child: child,
    );
  }
}
