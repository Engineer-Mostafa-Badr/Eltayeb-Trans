import 'package:flutter/material.dart';
import 'package:eltyp_delivery/config/themes/colors.dart';
import 'package:eltyp_delivery/config/themes/styles.dart';
import 'package:eltyp_delivery/core/components/images/custom_asset_svg_image.dart';
import 'package:eltyp_delivery/core/utils/app_sizes.dart';
import 'package:eltyp_delivery/features/onboarding/domain/entities/onboarding_entities.dart';
import 'package:eltyp_delivery/features/onboarding/presentation/constants/onboarding_constants.dart';

/// Widget that displays a single onboarding page content
class OnboardingPageView extends StatelessWidget {
  final OnboardingEntity data;

  const OnboardingPageView({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: Center(child: _buildImageContainer())),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: OnboardingConstants.horizontalPadding,
          ),
          child: _buildContent(),
        ),
      ],
    );
  }

  Widget _buildImageContainer() {
    return Container(
      width: OnboardingConstants.imageContainerSize,
      height: OnboardingConstants.imageContainerSize,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.cOnboardingImageBackground,
      ),
      child: Center(child: CustomAssetSvgImage(data.imagePath)),
    );
  }

  Widget _buildContent() {
    return Column(
      children: [
        Text(
          data.title,
          textAlign: TextAlign.center,
          style: AppStyles.title400.copyWith(color: AppColors.cPrimary),
        ),
        const SizedBox(height: AppPadding.padding12),
        Text(
          data.description,
          textAlign: TextAlign.center,
          style: AppStyles.title400.copyWith(color: AppColors.cDarkBlueColor),
        ),
      ],
    );
  }
}
