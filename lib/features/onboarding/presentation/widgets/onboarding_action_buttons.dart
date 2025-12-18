import 'package:flutter/material.dart';
import 'package:eltyp_delivery/config/themes/colors.dart';
import 'package:eltyp_delivery/core/components/buttons/outlined_button.dart';
import 'package:eltyp_delivery/features/onboarding/domain/entities/onboarding_entities.dart';
import 'package:eltyp_delivery/features/onboarding/presentation/constants/onboarding_constants.dart';

/// Widget that displays action buttons for onboarding page
class OnboardingActionButtons extends StatelessWidget {
  final OnboardingEntity currentPageData;
  final VoidCallback onPrimaryPressed;
  final VoidCallback? onSecondaryPressed;
  final VoidCallback? onSkipPressed;

  const OnboardingActionButtons({
    super.key,
    required this.currentPageData,
    required this.onPrimaryPressed,
    this.onSecondaryPressed,
    this.onSkipPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: OnboardingConstants.horizontalPadding,
      ),
      child: Column(
        children: [
          _buildPrimaryButton(),
          const SizedBox(height: OnboardingConstants.buttonSpacing),
          if (currentPageData.hasSecondaryOutlinedButton)
            _buildSecondaryButton()
          else
            _buildSkipButton(),
          const SizedBox(height: OnboardingConstants.bottomSpacing),
        ],
      ),
    );
  }

  Widget _buildPrimaryButton() {
    return ReusedOutlinedButton(
      width: double.maxFinite,
      text: currentPageData.primaryText,
      onPressed: onPrimaryPressed,
      color: currentPageData.primaryColor,
      textColor: Colors.white,
    );
  }

  Widget _buildSecondaryButton() {
    return ReusedOutlinedButton(
      width: double.maxFinite,
      text: currentPageData.secondaryText,
      onPressed: onSecondaryPressed ?? () {},
      borderColor: AppColors.cDarkBlueColor,
      textColor: Colors.black,
    );
  }

  Widget _buildSkipButton() {
    return TextButton(
      onPressed: onSkipPressed ?? () {},
      child: const Text(
        'تخطي',
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: Colors.grey,
        ),
      ),
    );
  }
}
