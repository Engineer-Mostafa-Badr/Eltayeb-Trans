import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:eltyp_delivery/config/themes/colors.dart';
import 'package:eltyp_delivery/config/themes/styles.dart';
import 'package:eltyp_delivery/core/components/utils/widgets.dart';

class EmptyBody extends StatelessWidget {
  const EmptyBody({super.key, this.text, this.fillRemaining, this.emptyImage});

  final String? text;
  final String? emptyImage;
  final bool? fillRemaining;

  @override
  Widget build(BuildContext context) {
    if (fillRemaining != null) {
      return SliverFillRemaining(
        // hasScrollBody: false,
        child: _BaseEmptyWidget(text: text, emptyImage: emptyImage),
      );
    }

    return _BaseEmptyWidget(text: text, emptyImage: emptyImage);
  }
}

class _BaseEmptyWidget extends StatelessWidget {
  const _BaseEmptyWidget({this.text, this.emptyImage});

  final String? text;
  final String? emptyImage;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (emptyImage != null)
          AssetSvgImage(emptyImage!, height: 104.h, width: 108.w)
        else
          const MyAppLogo(),
        const SizedBox(height: 20),
        Text(
          (text ?? 'no_data_found').tr(),
          textAlign: TextAlign.center,
          style: GoogleFonts.cairo(
            textStyle: AppStyles.title700.copyWith(
              fontSize: 20.sp,
              color: AppColors.cEmptyText,
            ),
          ),
        ).tr(),
      ],
    );
  }
}
