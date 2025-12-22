import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomTextField extends StatefulWidget {
  final String? hintText;
  final String? labelText;
  final String? svgIconPath;
  final IconData? icon;
  final bool isPassword;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool enabled;
  final int? maxLines;
  final int? minLines;
  final EdgeInsetsGeometry? contentPadding;
  final Color? fillColor;
  final Color? borderColor;
  final Color? focusedBorderColor;
  final double borderRadius;
  final TextDirection? textDirection;
  final TextAlign textAlign;
  final String? initialValue;
  final TextStyle? style;

  const CustomTextField({
    super.key,
    this.hintText,
    this.labelText,
    this.svgIconPath,
    this.icon,
    this.isPassword = false,
    this.controller,
    this.onChanged,
    this.validator,
    this.keyboardType,
    this.textInputAction,
    this.enabled = true,
    this.maxLines = 1,
    this.minLines,
    this.contentPadding,
    this.fillColor = Colors.white,
    this.borderColor,
    this.focusedBorderColor,
    this.borderRadius = 14,
    this.textDirection,
    this.textAlign = TextAlign.start,
    this.initialValue,
    this.style,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    final borderColor = widget.borderColor ?? Colors.grey.shade300;
    final focusedBorderColor =
        widget.focusedBorderColor ?? const Color(0xFF6A0000);

    return TextFormField(
      controller: widget.controller,
      initialValue: widget.initialValue,
      obscureText: _obscureText,
      onChanged: widget.onChanged,
      validator: widget.validator,
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      enabled: widget.enabled,
      maxLines: widget.maxLines,
      minLines: widget.minLines,
      textDirection: widget.textDirection,
      textAlign: widget.textAlign,
      style:
          widget.style ??
          const TextStyle(color: Colors.black, fontFamily: 'Cairo'),
      decoration: InputDecoration(
        hintText: widget.hintText,
        labelText: widget.labelText,
        hintStyle: const TextStyle(fontFamily: 'Cairo'),
        labelStyle: const TextStyle(fontFamily: 'Cairo'),
        hintTextDirection: widget.textDirection,
        prefixIcon: widget.svgIconPath != null
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: SizedBox(
                  width: 23,
                  height: 23,
                  child: SvgPicture.asset(widget.svgIconPath!),
                ),
              )
            : widget.icon != null
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Icon(widget.icon),
              )
            : null,
        prefixIconConstraints: const BoxConstraints(
          minWidth: 45,
          minHeight: 45,
        ),
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                  size: 22,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              )
            : null,
        filled: true,
        fillColor: widget.fillColor,
        contentPadding:
            widget.contentPadding ??
            const EdgeInsets.symmetric(vertical: 22, horizontal: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          borderSide: BorderSide(color: borderColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          borderSide: BorderSide(color: borderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          borderSide: BorderSide(color: focusedBorderColor),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          borderSide: const BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          borderSide: const BorderSide(color: Colors.red),
        ),
      ),
    );
  }
}
