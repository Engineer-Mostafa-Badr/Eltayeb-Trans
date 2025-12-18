import 'package:easy_localization/easy_localization.dart';
import 'package:eltyp_delivery/config/themes/styles.dart';
import 'package:eltyp_delivery/core/extensions/widgets_extensions.dart';
import 'package:eltyp_delivery/core/res/app_images.dart';
import 'package:eltyp_delivery/core/utils/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/themes/colors.dart';
import '../../../../core/components/buttons/outlined_button.dart';
import '../../../../core/components/images/custom_asset_svg_image.dart';
import '../../../../core/components/scaffold/shared_home_scaffold.dart';
import '../../../../core/components/textformfields/reused_textformfield.dart';

class NewExpensesPage extends StatefulWidget {
  const NewExpensesPage({super.key, required this.tripId});
  final int tripId;
  @override
  State<NewExpensesPage> createState() => _NewExpensesPageState();
}

class _NewExpensesPageState extends State<NewExpensesPage> {
  @override
  Widget build(BuildContext context) {
    return SharedHomeScaffold(
      title: 'add_expense',
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: AppPadding.largePadding, vertical: AppPadding.padding16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: AppPadding.largePadding, vertical: AppPadding.padding20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(AppBorderRadius.radius20),
                boxShadow: AppStyles.secondUsedBoxShadow(opacity: 0.05),
              ),
              child: const ExpensesInputWidgets(),
            ),
            AppPadding.padding32.sizedHeight,
            ReusedOutlinedButton(
              height: 50.h,
              text: 'save_expense',
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

class ExpensesInputWidgets extends StatefulWidget {
  const ExpensesInputWidgets({super.key});

  @override
  State<ExpensesInputWidgets> createState() => _ExpensesInputWidgetsState();
}

class _ExpensesInputWidgetsState extends State<ExpensesInputWidgets> {
  final TextEditingController expenseTypeController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  final TextEditingController notesController = TextEditingController();

  @override
  void dispose() {
    expenseTypeController.dispose();
    amountController.dispose();
    notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.padding6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ReusedTextFormField(
            controller: expenseTypeController,
            title: 'expense_type'.tr(),
            hintText: 'choose_expense_type'.tr(),
            readOnly: true,
            withBorder: true,
            textColor: AppColors.cTextSubtitleLight,
            textAlign: TextAlign.right,
            suffixIcon: Icons.keyboard_arrow_down_rounded,
            contentPadding: const EdgeInsets.symmetric(horizontal: AppPadding.mediumPadding, vertical: AppPadding.padding14),
            onTap: () {},
          ),
          AppPadding.padding24.sizedHeight,
          ReusedTextFormField(
            controller: amountController,
            title: 'amount'.tr(),
            hintText: '0.00',
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            withBorder: true,
            textColor: AppColors.cTextSubtitleLight,
            textAlign: TextAlign.right,
            contentPadding: const EdgeInsets.symmetric(horizontal: AppPadding.mediumPadding, vertical: AppPadding.padding14),
            prefix: FittedBox(fit: BoxFit.scaleDown,child: CustomAssetSvgImage(AssetImagesPath.dollar,height: 23.h,)),
            suffixWidget:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'جنيه'.tr(),
                  style: AppStyles.subtitle400.copyWith(fontSize: AppFontSize.f14, color: AppColors.cDarkBlueColor),
                ),
              ],
            ),
          ),
          AppPadding.padding24.sizedHeight,
          ReusedTextFormField(
            controller: notesController,
            widgetTitle: Row(
              children: [
                Text(
                  'notes',
                  style: AppStyles.title700.copyWith(
                    color: AppColors.cDarkBlueColor,
                    fontSize: AppFontSize.f14,
                  ),
                ).tr(),
                5.sizedWidth,
                Text(
                  '(optional)',
                  style: AppStyles.subtitle400.copyWith(
                    fontSize: AppFontSize.f14,
                  ),
                ).tr()
              ],
            ),
            hintText: 'add_any_additional_notes'.tr(),
            keyboardType: TextInputType.multiline,
            maxLines: 4,
            minLines: 4,
            withBorder: true,
            textColor: AppColors.cTextSubtitleLight,
            textAlign: TextAlign.right,
            contentPadding: const EdgeInsets.symmetric(horizontal: AppPadding.mediumPadding, vertical: AppPadding.padding14),
          ),
          AppPadding.padding24.sizedHeight,
          Row(
            children: [
              Text(
                'receipt_image',
                style: AppStyles.title700.copyWith(fontSize: AppFontSize.f14, color: AppColors.cDarkBlueColor),
                textAlign: TextAlign.right,
              ).tr(),
              5.sizedWidth,
              Text(
                '(optional)',
                style: AppStyles.title500.copyWith(fontSize: 14, color: AppColors.cDarkBlueColor),
                textAlign: TextAlign.right,
              ).tr(),
            ],
          ),
          AppPadding.padding12.sizedHeight,
          UploadReceiptCard(onTap: () {}),
        ],
      ),
    );
  }
}

class UploadReceiptCard extends StatelessWidget {
  final VoidCallback onTap;

  const UploadReceiptCard({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppBorderRadius.radius10),
      child: Container(
        height: 160.h,
        decoration: BoxDecoration(
          color: AppColors.cPinColor,
          borderRadius: BorderRadius.circular(AppBorderRadius.radius10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CustomAssetSvgImage(AssetImagesPath.uploadImage),
            AppPadding.padding10.sizedHeight,
            Text('upload_receipt_image', style: AppStyles.title700.copyWith(fontSize: AppFontSize.f14), textAlign: TextAlign.center).tr(),
            5.sizedHeight,
            Text(
              'max_5mb_png_jpg_pdf',
              style: AppStyles.subtitle500.copyWith(color: AppColors.cTextSubtitleLight, fontSize: AppFontSize.f12),
              textAlign: TextAlign.center,
            ).tr(),
          ],
        ),
      ),
    );
  }
}
