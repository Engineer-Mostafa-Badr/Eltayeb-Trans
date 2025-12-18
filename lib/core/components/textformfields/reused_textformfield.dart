import 'package:easy_debounce/easy_debounce.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eltyp_delivery/config/themes/colors.dart';
import 'package:eltyp_delivery/config/themes/styles.dart';
import 'package:eltyp_delivery/core/components/utils/widgets.dart';
import 'package:eltyp_delivery/core/extensions/widgets_extensions.dart';
import 'package:eltyp_delivery/core/utils/app_sizes.dart';

class ReusedTextFormField extends StatefulWidget {
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validator;
  final String hintText;
  final String? helperText;
  final String? title;
  final Widget? widgetTitle;
  final IconData? suffixIcon;
  final String? prefixIcon;
  final String? suffixText;
  final String? pickFileText;
  final bool readOnly;
  final GestureTapCallback? onTap;
  final int minLines;
  final int maxLines;
  final bool isPassword;
  final bool withBorder;
  final Widget? suffixWidget;
  final Widget? prefix;
  final List<TextInputFormatter>? inputFormatters;
  final Function(String)? onChanged;
  final Color? textColor;
  final EdgeInsetsGeometry? contentPadding;
  final bool dispose;
  final TextAlign textAlign;
  final Color fillColor;
  final Color titleColor;
  final InputBorder? border;
  final double titleFontSize;

  final bool withShadow;
  final List<BoxShadow>? boxShadow;

  const ReusedTextFormField({
    super.key,
    this.controller,
    this.keyboardType,
    this.textAlign = TextAlign.start,
    this.textInputAction,
    this.validator,
    this.hintText = '',
    this.textColor,
    this.helperText,
    this.contentPadding,
    this.suffixText,
    this.titleColor = AppColors.cDarkBlueColor,
    this.pickFileText,
    this.title,
    this.widgetTitle,
    this.suffixIcon,
    this.prefixIcon,
    this.withBorder = false,
    this.readOnly = false,
    this.dispose = true,
    this.onTap,
    this.minLines = 1,
    this.maxLines = 1,
    this.isPassword = false,
    this.suffixWidget,
    this.onChanged,
    this.prefix,
    this.inputFormatters,
    this.fillColor = Colors.white,
    this.border,
    this.titleFontSize = 16,
    this.withShadow = false,
    this.boxShadow,
  });

  @override
  State<ReusedTextFormField> createState() => _ReusedTextFormFieldState();
}

class _ReusedTextFormFieldState extends State<ReusedTextFormField>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword;
  }

  @override
  void dispose() {
    if (widget.dispose && widget.controller != null) {
      widget.controller!.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    final border =
        widget.border ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppBorderRadius.radius14),
              borderSide: const BorderSide(
                color: AppColors.cFillBorderLight,
                width: .5,
              ),
            );

    final withNoBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppBorderRadius.radius14),
      borderSide: const BorderSide(color: Colors.transparent),
    );

    final effectiveBoxShadow =
        widget.boxShadow ?? AppStyles.secondUsedBoxShadow(opacity: 0.12);

    final textFormField = TextFormField(
      onTapOutside: (pointer) {
        FocusScope.of(context).unfocus();
      },
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      obscureText: _obscureText,
      readOnly: widget.readOnly,
      onTap: widget.onTap,
      validator: widget.validator,
      onChanged: (value) {
        EasyDebounce.debounce(
          'search_debounce',
          const Duration(milliseconds: 500),
              () {
            widget.onChanged?.call(value);
          },
        );
      },
      minLines: widget.minLines,
      maxLines: widget.maxLines,
      cursorColor: AppColors.cSecondary,
      inputFormatters:
      widget.inputFormatters ??
          [
            if (widget.keyboardType == TextInputType.number)
              FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}'))
            else if (widget.keyboardType == TextInputType.emailAddress)
              FilteringTextInputFormatter.deny(RegExp(r'\s'))
            else if (widget.keyboardType == TextInputType.url)
                FilteringTextInputFormatter.deny(RegExp(r'\s'))
              else if (widget.keyboardType == TextInputType.name)
                  FilteringTextInputFormatter.deny(
                    RegExp(r'[0-9!@#<>?":_`~;[\]\\|=+)(*&^%0-9]'),
                  )
                else if (widget.keyboardType == TextInputType.phone) ...[
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(10),
                  ],
          ],
      style: AppStyles.title400.copyWith(color: Colors.black),
      textAlign: widget.textAlign,
      decoration: InputDecoration(
        hintText: widget.hintText.tr(),
        filled: true,
        contentPadding:
        widget.contentPadding ??
            const EdgeInsets.symmetric(
              horizontal: AppPadding.mediumPadding,
              vertical: AppPadding.padding4,
            ),
        fillColor: widget.fillColor,
        suffixText: widget.suffixText,
        suffixStyle: AppStyles.title600,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        hintStyle: Theme.of(context)
            .inputDecorationTheme
            .hintStyle!
            .copyWith(color: widget.textColor),
        border: widget.withBorder == false ? withNoBorder : border,
        disabledBorder: widget.withBorder == false ? withNoBorder : border,
        enabledBorder: widget.withBorder == false ? withNoBorder : border,
        focusedBorder: widget.withBorder == false ? withNoBorder : border,
        errorBorder: widget.withBorder == false
            ? withNoBorder
            : border.copyWith(
          borderSide: border.borderSide.copyWith(
            color: AppColors.cError,
            width: .5,
          ),
        ),
        focusedErrorBorder:
        widget.withBorder == false ? withNoBorder : border,
        prefixIcon: widget.prefix ??
            (widget.prefixIcon != null
                ? Padding(
              padding: const EdgeInsets.all(
                AppPadding.smallPadding,
              ).h,
              child: AssetSvgImage(
                widget.prefixIcon!,
                width: 22,
                height: 22,
              ),
            )
                : null),
        suffixIcon: widget.isPassword
            ? IconButton(
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
          icon: Icon(
            _obscureText ? Icons.visibility : Icons.visibility_off,
            color: AppColors.cTextSubtitleLight,
          ),
        )
            : widget.suffixWidget ??
            (widget.suffixIcon != null
                ? Icon(
              widget.suffixIcon,
              color: AppColors.cTextSubtitleLight,
            )
                : null),
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.title != null||widget.widgetTitle!=null) ...[
        if(widget.widgetTitle!=null)widget.widgetTitle! else Text(
            widget.title!,
            style: AppStyles.title700.copyWith(
              color: widget.titleColor,
              fontSize: widget.titleFontSize.sp,
            ),
          ).tr(),
          AppPadding.padding12.sizedHeight,
        ],
        if (widget.withShadow)
          Container(
            decoration: BoxDecoration(
              boxShadow: effectiveBoxShadow,
              borderRadius:
              BorderRadius.circular(AppBorderRadius.radius14),
            ),
            child: textFormField,
          )
        else
          textFormField,
        if (widget.helperText != null) ...[
          AppPadding.padding6.sizedHeight,
          Text(
            widget.helperText!,
            style:
            AppStyles.subtitle600.copyWith(fontSize: AppFontSize.f10),
          ).tr(),
        ],
      ],
    );
  }
}
