import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget? child;
  final String? text;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double? elevation;
  final EdgeInsetsGeometry? padding;
  final double borderRadius;
  final Size? minimumSize;
  final Size? maximumSize;
  final bool enabled;
  final TextStyle? textStyle;

  const CustomElevatedButton({
    super.key,
    this.onPressed,
    this.child,
    this.text,
    this.backgroundColor,
    this.foregroundColor,
    this.elevation,
    this.padding,
    this.borderRadius = 14,
    this.minimumSize,
    this.maximumSize,
    this.enabled = true,
    this.textStyle,
  }) : assert(
         child != null || text != null,
         'Either child or text must be provided',
       );

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: enabled ? onPressed : null,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        elevation: elevation,
        padding: padding,
        minimumSize: minimumSize,
        maximumSize: maximumSize,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
      child: child ?? Text(text!, style: textStyle),
    );
  }
}
