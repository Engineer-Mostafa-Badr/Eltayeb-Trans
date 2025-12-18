import 'package:easy_localization/easy_localization.dart';
import 'package:eltyp_delivery/core/components/scaffold/shared_home_scaffold.dart';
import 'package:eltyp_delivery/core/extensions/navigation_extensions.dart';
import 'package:eltyp_delivery/core/extensions/widgets_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/themes/colors.dart';
import '../../../../config/themes/styles.dart';
import '../../../../core/components/buttons/outlined_button.dart';
import '../../../../core/components/textformfields/reused_textformfield.dart';
import '../../../../core/utils/app_sizes.dart';
import '../widgets/flight_delivery_widgets/odometer_image_card.dart';
import '../widgets/flight_delivery_widgets/warning_banner.dart';

class DeliverTripPage extends StatefulWidget {
  const DeliverTripPage({super.key});

  @override
  State<DeliverTripPage> createState() => _DeliverTripPageState();
}

class _DeliverTripPageState extends State<DeliverTripPage> {
  final TextEditingController kmController = TextEditingController();
  final TextEditingController notesController = TextEditingController();

  @override
  void dispose() {
    kmController.dispose();
    notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SharedHomeScaffold(
      title: 'flight_delivery',
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.padding16,
          vertical: AppPadding.padding24,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const WarningBanner(),
            AppPadding.padding24.sizedHeight,
            ReusedTextFormField(
              controller: kmController,
              title: 'number_of_kilometers_(km)'.tr(),
              hintText: 'example:248'.tr(),
              keyboardType: TextInputType.number,
              textAlign: TextAlign.right,
              withBorder: true,
              textColor: AppColors.cTextSubtitleLight,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: AppPadding.mediumPadding,
                vertical: AppPadding.padding14,
              ),
            ),
            AppPadding.padding24.sizedHeight,
            Text(
              "image_of_a_car's_speedometer",
              style: AppStyles.title500.copyWith(fontSize: 14),
              textAlign: TextAlign.right,
            ).tr(),
            AppPadding.padding12.sizedHeight,
            OdometerImageCard(onTap: () {}),
            AppPadding.padding20.sizedHeight,
            ReusedTextFormField(
              controller: notesController,
              title: 'notes_(optional)',
              hintText: 'add_a_note...',
              keyboardType: TextInputType.multiline,
              textAlign: TextAlign.right,
              maxLines: 5,
              withBorder: true,
              textColor: AppColors.cTextSubtitleLight,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: AppPadding.mediumPadding,
                vertical: AppPadding.padding14,
              ),
            ),
            AppPadding.padding24.sizedHeight,
            ReusedOutlinedButton(
              height: 50.h,
              text: 'flight_delivery',
              onPressed: () {
                context.navigateToPage(const DeliverTripPage());
              },
              color: AppColors.cPrimary,
              borderColor: AppColors.cDarkBlueColor,
              textColor: Colors.white,
              fontSize: AppFontSize.f16,
            ),
            AppPadding.padding16.sizedHeight,
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppPadding.mediumPadding,
                vertical: AppPadding.padding12,
              ),
              decoration: BoxDecoration(
                color: const Color(0xFFFFF7E6),
                borderRadius: BorderRadius.circular(AppBorderRadius.radius10),
                border: Border.all(color: const Color(0xFFFFE5A8), width: .7),
              ),
              child: Text(
                'i_will_send_the_reading_and_the_image_for_review_by_the_administration.',
                style: AppStyles.subtitle500.copyWith(fontSize: 12),
                textAlign: TextAlign.center,
              ).tr(),
            ),
          ],
        ),
      ),
    );
  }
}
