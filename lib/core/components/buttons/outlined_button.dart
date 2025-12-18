import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eltyp_delivery/config/themes/colors.dart';
import 'package:eltyp_delivery/core/components/screen_status/loading_widget.dart';

class ReusedOutlinedButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final Color color;
  final Color borderColor;
  final Color textColor;
  final TextStyle? textStyle;
  final Widget? rowWidget;
  final double fontSize;
  final double radius;
  final double height;
  final double? width;
  final bool isLoading;

  const ReusedOutlinedButton({
    required this.text,
    required this.onPressed,
    this.color = Colors.transparent,
    this.borderColor = AppColors.cPrimary,
    this.textColor = AppColors.cPrimary,
    this.rowWidget,
    this.fontSize = 14,
    this.radius = 16,
    this.height = 48,
    this.width,
    this.isLoading = false,
    this.textStyle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width?.w,
      height: height.h,
      child: TextButton(
        style: ButtonStyle(
          // elevation: MaterialStateProperty.all(0),
          overlayColor: WidgetStateProperty.all(
            Colors.grey.withValues(alpha: .5),
          ),
          alignment: Alignment.center,
          backgroundColor: WidgetStateProperty.all(color),
          foregroundColor: WidgetStateProperty.all(Colors.transparent),
          surfaceTintColor: WidgetStateProperty.all(Colors.transparent),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius.r),
              side: BorderSide(color: borderColor),
            ),
          ),
        ),
        onPressed: isLoading ? null : onPressed,
        child: isLoading
            ? const LoadingWidget()
            :rowWidget?? Text(
                text,
                style:textStyle?? TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.w700,
                  fontSize: fontSize.sp,
                ),
              ).tr(),
      ),
    );
  }
}
