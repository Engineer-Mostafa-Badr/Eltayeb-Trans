import 'dart:math' as math;

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eltyp_delivery/config/themes/colors.dart';
import 'package:eltyp_delivery/config/themes/styles.dart';
import 'package:eltyp_delivery/core/components/screen_status/loading_widget.dart';
import 'package:eltyp_delivery/core/extensions/widgets_extensions.dart';
import 'package:eltyp_delivery/core/utils/app_sizes.dart';

class ReusedRoundedButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final Color color; // Base color for gradient
  final Color textColor;
  final Widget? rowWidget;
  final double fontSize;
  final bool isLoading;
  final double height;
  final double radius;
  final double? width;
  final bool showShadow;
  final bool gradient;
  final double widthWidget;
  final BorderRadiusGeometry? borderRadius;

  const ReusedRoundedButton({
    required this.text,
    required this.onPressed,
    this.color = AppColors.cPrimary,
    this.textColor = Colors.black,
    this.rowWidget,
    this.fontSize = 14,
    this.height = 48,
    this.width,
    this.radius = 12,
    this.widthWidget = AppPadding.smallPadding,
    this.isLoading = false,
    this.showShadow = true,
    this.gradient = true,
    this.borderRadius,
    super.key,
  });

  // Build a vertical gradient (lighter at top, base color at bottom)
  LinearGradient _verticalGradientFrom(Color base) {
    final hsl = HSLColor.fromColor(base);
    final lighter = hsl
        .withLightness(math.min(1, hsl.lightness + 0.18))
        .toColor();
    return LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [lighter, base],
    );
  }

  @override
  Widget build(BuildContext context) {
    final br = borderRadius ?? BorderRadius.circular(radius.r);

    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: br,
        // Keep your original shadow style
        boxShadow: showShadow ? AppStyles.mostUsedBoxShadow : [],
      ),
      child: SizedBox(
        width: width != null ? width!.w : double.infinity,
        height: height.h,
        child: isLoading
            ? const LoadingWidget()
            : ElevatedButton(
                style: ButtonStyle(
                  overlayColor: WidgetStateProperty.all(
                    Colors.black.withValues(alpha: .05),
                  ),
                  alignment: Alignment.center,
                  elevation: WidgetStateProperty.all(0),
                  // Make the button transparent so the decoration inside Ink is visible
                  backgroundColor: gradient
                      ? WidgetStateProperty.all(Colors.transparent)
                      : WidgetStateProperty.all(color),
                  surfaceTintColor: gradient
                      ? WidgetStateProperty.all(Colors.transparent)
                      : WidgetStateProperty.all(color),
                  foregroundColor: gradient
                      ? WidgetStateProperty.all(Colors.transparent)
                      : WidgetStateProperty.all(color),
                  padding: WidgetStateProperty.all(EdgeInsets.zero),
                  shape: WidgetStateProperty.all(
                    RoundedRectangleBorder(borderRadius: br),
                  ),
                ),
                onPressed: isLoading ? () {} : onPressed,
                // Real decoration (gradient + highlight) is inside Ink
                child: Ink(
                  decoration: BoxDecoration(
                    borderRadius: br,
                    gradient: gradient ? _verticalGradientFrom(color) : null,
                  ),
                  child: ClipRRect(
                    borderRadius: br,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        // Top glossy highlight
                        Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            height: height.h * 0.38,
                            // margin: EdgeInsets.symmetric(
                            //   horizontal: (radius * 0.9).w,
                            //   vertical: (radius * 0.35).h,
                            // ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                (radius * 0.7).r,
                              ),
                              gradient: !gradient
                                  ? null
                                  : LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Colors.white.withValues(alpha: .55),
                                        Colors.white.withValues(alpha: .18),
                                        Colors.white.withValues(alpha: 0),
                                      ],
                                      stops: const [0.0, 0.35, 1.0],
                                    ),
                            ),
                          ),
                        ),
                        // Button text and optional row widget
                        Center(
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                if (rowWidget != null) ...[
                                  ?rowWidget,
                                  widthWidget.sizedWidth,
                                ],
                                Text(
                                  text,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: textColor,
                                    fontWeight: FontWeight.w700,
                                    fontSize: fontSize.sp,
                                  ),
                                ).tr(),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
