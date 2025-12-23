import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:eltyp_delivery/config/themes/styles.dart';
import 'package:eltyp_delivery/core/components/buttons/outlined_button.dart';
import 'package:eltyp_delivery/core/components/utils/custom_rounded_container.dart';
import 'package:eltyp_delivery/core/extensions/widgets_extensions.dart';
import 'package:eltyp_delivery/core/utils/app_sizes.dart';

class ResourceCard extends StatelessWidget {
  const ResourceCard({
    super.key,
    required this.title,
    required this.value,
    required this.buttonText,
    required this.onSelect,
  });

  final String title;
  final String value;
  final String buttonText;
  final VoidCallback onSelect;

  @override
  Widget build(BuildContext context) {
    return CustomRoundedContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppStyles.title700.copyWith(fontSize: AppFontSize.f16),
          ).tr(),
          12.sizedHeight,
          Text(
            value,
            style: AppStyles.title600.copyWith(fontSize: AppFontSize.f15),
          ),
          16.sizedHeight,
          ReusedOutlinedButton(
            text: buttonText,
            onPressed: onSelect,
            height: 40,
          ),
        ],
      ),
    );
  }
}

