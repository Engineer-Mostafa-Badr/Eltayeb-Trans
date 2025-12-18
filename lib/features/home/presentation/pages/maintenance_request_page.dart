import 'package:easy_localization/easy_localization.dart';
import 'package:eltyp_delivery/core/components/scaffold/shared_home_scaffold.dart';
import 'package:eltyp_delivery/core/extensions/widgets_extensions.dart';
import 'package:eltyp_delivery/features/home/presentation/widgets/maintenance_request_widgets/maintenance_input_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/themes/colors.dart';
import '../../../../config/themes/styles.dart';
import '../../../../core/components/buttons/outlined_button.dart';
import '../../../../core/utils/app_sizes.dart';
import '../widgets/maintenance_request_widgets/attach_image_card.dart';
import '../widgets/maintenance_request_widgets/maintenance_warning_banner.dart';
import '../widgets/maintenance_request_widgets/priority_selector.dart';

class MaintenanceRequestPage extends StatefulWidget {
  const MaintenanceRequestPage({super.key, required this.tripId});
  final int tripId;
  @override
  State<MaintenanceRequestPage> createState() => _MaintenanceRequestPageState();
}

class _MaintenanceRequestPageState extends State<MaintenanceRequestPage> {
  int selectedPriority = 1;

  @override
  Widget build(BuildContext context) {
    return SharedHomeScaffold(
      title: 'maintenance_request',
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.largePadding,
          vertical: AppPadding.padding16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const MaintenanceWarningBanner(),
            AppPadding.padding24.sizedHeight,

            const MaintenanceInputWidgets(),

            Text(
              'priority',
              style: AppStyles.title700.copyWith(
                fontSize: AppFontSize.f15,
                color: AppColors.cDarkBlueColor,
              ),
              textAlign: TextAlign.right,
            ).tr(),
            AppPadding.padding12.sizedHeight,
            PrioritySelector(
              selectedIndex: selectedPriority,
              onChanged: (index) {
                setState(() {
                  selectedPriority = index;
                });
              },
            ),
            AppPadding.padding24.sizedHeight,

            Row(
              children: [
                Text(
                  'attach_image',
                  style: AppStyles.title700.copyWith(
                    fontSize: AppFontSize.f14,
                    color: AppColors.cDarkBlueColor,
                  ),
                  textAlign: TextAlign.right,
                ).tr(),
                5.sizedWidth,
                Text(
                  '(optional)',
                  style: AppStyles.title500.copyWith(
                    fontSize: 14,
                    color: AppColors.cDarkBlueColor,
                  ),
                  textAlign: TextAlign.right,
                ).tr(),
              ],
            ),
            AppPadding.padding12.sizedHeight,
            AttachImageCard(onTap: () {}),

            AppPadding.padding32.sizedHeight,
            ReusedOutlinedButton(
              height: 50.h,
              text: 'send_maintenance_request',
              onPressed: () {},
              color: AppColors.cPrimary,
              textColor: Colors.white,
              fontSize: AppFontSize.f16,
            ),
            AppPadding.padding16.sizedHeight,
          ],
        ),
      ),
    );
  }
}
