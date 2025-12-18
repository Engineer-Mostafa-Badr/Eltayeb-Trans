import 'package:easy_localization/easy_localization.dart';
import 'package:eltyp_delivery/config/themes/colors.dart';
import 'package:eltyp_delivery/config/themes/styles.dart';
import 'package:eltyp_delivery/core/components/buttons/outlined_button.dart';
import 'package:eltyp_delivery/core/components/images/custom_asset_svg_image.dart';
import 'package:eltyp_delivery/core/components/scaffold/shared_home_scaffold.dart';
import 'package:eltyp_delivery/core/components/textformfields/custom_dropdown.dart';
import 'package:eltyp_delivery/core/components/utils/custom_rounded_container.dart';
import 'package:eltyp_delivery/core/extensions/widgets_extensions.dart';
import 'package:eltyp_delivery/core/res/app_images.dart';
import 'package:eltyp_delivery/core/utils/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/components/textformfields/reused_textformfield.dart';
import '../widgets/new_ticket_widgets/ticket_attachment_card.dart';
import '../widgets/new_ticket_widgets/ticket_priority_selector.dart';

class NewSupportTicketPage extends StatefulWidget {
  const NewSupportTicketPage({super.key});

  @override
  State<NewSupportTicketPage> createState() => _NewSupportTicketPageState();
}

class _NewSupportTicketPageState extends State<NewSupportTicketPage> {
  final TextEditingController requestTypeController = TextEditingController();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  int selectedPriority = 1;

  @override
  void dispose() {
    requestTypeController.dispose();
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SharedHomeScaffold(
      title: 'ticket_details',
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.padding14,
          vertical: AppPadding.padding36,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomRoundedContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CustomDropdownMenu(
                    items: const [],
                    controller: requestTypeController,
                    title: 'select_request_type'.tr(),
                    hintText: 'select_problem_type'.tr(),
                    borderColor: AppColors.cPrimary,
                  ),
                  AppPadding.padding22.sizedHeight,
                  ReusedTextFormField(
                    controller: titleController,
                    title: 'ticket_title'.tr(),
                    hintText: 'write_brief_ticket_title'.tr(),
                    withBorder: true,
                    textAlign: TextAlign.right,
                    textColor: AppColors.cTextSubtitleLight,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: AppPadding.mediumPadding,
                      vertical: AppPadding.padding14,
                    ),
                  ),
                  AppPadding.padding22.sizedHeight,
                  ReusedTextFormField(
                    controller: descriptionController,
                    title: 'problem_description'.tr(),
                    hintText: 'please_describe_the_problem_in_detail'.tr(),
                    keyboardType: TextInputType.multiline,
                    maxLines: 5,
                    minLines: 5,
                    withBorder: true,
                    textAlign: TextAlign.right,
                    textColor: AppColors.cTextSubtitleLight,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: AppPadding.mediumPadding,
                      vertical: AppPadding.padding14,
                    ),
                  ),
                  AppPadding.padding24.sizedHeight,
                  Row(
                    children: [
                      Text(
                        'attachments',
                        style: AppStyles.title700.copyWith(
                          fontSize: AppFontSize.f16,
                          color: AppColors.cDarkBlueColor,
                        ),
                        textAlign: TextAlign.right,
                      ).tr(),
                      6.sizedWidth,
                      Text(
                        '(optional)',
                        style: AppStyles.title400.copyWith(fontSize: 14),
                        textAlign: TextAlign.right,
                      ).tr(),
                    ],
                  ),
                  AppPadding.padding12.sizedHeight,
                  const TicketAttachmentCard(),
                  AppPadding.padding24.sizedHeight,
                  Text(
                    'priority',
                    style: AppStyles.title700.copyWith(
                      fontSize: AppFontSize.f16,
                      color: AppColors.cDarkBlueColor,
                    ),
                    textAlign: TextAlign.right,
                  ).tr(),
                  AppPadding.padding12.sizedHeight,
                  TicketPrioritySelector(
                    selectedIndex: selectedPriority,
                    onChanged: (index) {
                      setState(() {
                        selectedPriority = index;
                      });
                    },
                  ),
                  AppPadding.padding32.sizedHeight,
                  ReusedOutlinedButton(
                    height: 52.h,
                    text: 'send_ticket',
                    rowWidget: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CustomAssetSvgImage(AssetImagesPath.sent),
                        8.sizedWidth,
                        Text(
                          'send_ticket',
                          style: AppStyles.title500.copyWith(
                            fontSize: AppFontSize.f16,
                            color: Colors.white,
                          ),
                        ).tr(),
                      ],
                    ),
                    onPressed: () {},
                    color: AppColors.cPrimary,
                    textColor: Colors.white,
                    fontSize: AppFontSize.f16,
                  ),
                  AppPadding.padding16.sizedHeight,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
