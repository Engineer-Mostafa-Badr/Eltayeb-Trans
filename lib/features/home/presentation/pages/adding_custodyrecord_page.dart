import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:eltyp_delivery/config/themes/colors.dart';
import 'package:eltyp_delivery/core/components/widgets/custom_elevated_button.dart';
import 'package:eltyp_delivery/core/utils/app_sizes.dart';
import 'package:eltyp_delivery/features/home/presentation/widgets/custody_widgets/custody_app_bar.dart';
import 'package:eltyp_delivery/features/home/presentation/widgets/custody_widgets/custody_form_card.dart';

class AddCustodyRecordPage extends StatelessWidget {
  const AddCustodyRecordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cCustodyBackground,
      appBar: const CustodyAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: Column(
            children: [
              const CustodyFormCard(),
              const SizedBox(height: 30),
              _buildSubmitButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSubmitButton() {
    return SizedBox(
      width: double.infinity,
      height: 58,
      child: CustomElevatedButton(
        text: 'add_custody'.tr(),
        backgroundColor: AppColors.cCustodyPrimaryRed,
        foregroundColor: Colors.white,
        elevation: 0,
        borderRadius: AppBorderRadius.radius16,
        minimumSize: const Size(double.infinity, 58),
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
        onPressed: () {},
      ),
    );
  }
}
