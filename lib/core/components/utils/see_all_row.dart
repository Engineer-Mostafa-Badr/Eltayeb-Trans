import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:eltyp_delivery/config/themes/colors.dart';
import 'package:eltyp_delivery/config/themes/styles.dart';
import 'package:eltyp_delivery/core/extensions/widgets_extensions.dart';
import 'package:eltyp_delivery/core/utils/app_sizes.dart';

class SeeAllRow extends StatelessWidget {
  const SeeAllRow({super.key, required this.title, this.onPressed});

  final String title;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: AppStyles.title500.copyWith(fontSize: AppFontSize.f16),
          ).tr(),
        ),
        if (onPressed != null)
          Text(
            'see_all',
            style: AppStyles.title400.copyWith(color: AppColors.cSecondary),
          ).tr().addAction(onTap: onPressed),
      ],
    );
  }
}
