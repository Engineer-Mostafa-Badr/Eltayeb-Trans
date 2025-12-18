import 'package:easy_localization/easy_localization.dart';
import 'package:eltyp_delivery/core/extensions/widgets_extensions.dart';
import 'package:flutter/material.dart';

import '../../../../../config/themes/colors.dart';
import '../../../../../core/components/textformfields/reused_textformfield.dart';
import '../../../../../core/utils/app_sizes.dart';

class MaintenanceInputWidgets extends StatefulWidget {
  const MaintenanceInputWidgets({super.key});

  @override
  State<MaintenanceInputWidgets> createState() => _MaintenanceInputWidgetsState();
}

class _MaintenanceInputWidgetsState extends State<MaintenanceInputWidgets> {
  final TextEditingController truckController = TextEditingController();
  final TextEditingController problemDescriptionController = TextEditingController();
  final TextEditingController partTypeController = TextEditingController();

  @override
  void dispose() {
    truckController.dispose();
    problemDescriptionController.dispose();
    partTypeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ReusedTextFormField(
          controller: truckController,
          title: 'truck'.tr(),
          hintText: 'truck_example_text'.tr(),
          readOnly: true,
          withBorder: true,
          textColor: AppColors.cTextSubtitleLight,
          textAlign: TextAlign.right,
          contentPadding: const EdgeInsets.symmetric(horizontal: AppPadding.mediumPadding, vertical: AppPadding.padding14),
        ),
        AppPadding.padding24.sizedHeight,

        ReusedTextFormField(
          controller: problemDescriptionController,
          title: 'problem_description'.tr(),
          hintText: 'write_fault_details_or_note_here'.tr(),
          keyboardType: TextInputType.multiline,
          maxLines: 5,
          withBorder: true,
          textColor: AppColors.cTextSubtitleLight,
          textAlign: TextAlign.right,
          contentPadding: const EdgeInsets.symmetric(horizontal: AppPadding.mediumPadding, vertical: AppPadding.padding14),
        ),
        AppPadding.padding24.sizedHeight,

        ReusedTextFormField(
          controller: partTypeController,
          title: 'spare_part'.tr(),
          hintText: 'choose_spare_part_type'.tr(),
          readOnly: true,
          withBorder: true,
          textColor: AppColors.cTextSubtitleLight,
          textAlign: TextAlign.right,
          suffixIcon: Icons.keyboard_arrow_down_rounded,
          contentPadding: const EdgeInsets.symmetric(horizontal: AppPadding.mediumPadding, vertical: AppPadding.padding14),
          onTap: () {},
        ),
        AppPadding.padding24.sizedHeight,
      ],
    );
  }
}
