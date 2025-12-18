import 'package:flutter/material.dart';
import 'package:eltyp_delivery/config/themes/colors.dart';
import 'package:eltyp_delivery/features/onboarding/presentation/constants/onboarding_constants.dart';

/// Custom page indicator widget for onboarding screens
class OnboardingPageIndicator extends StatelessWidget {
  final int currentPage;
  final int totalPages;

  const OnboardingPageIndicator({
    super.key,
    required this.currentPage,
    required this.totalPages,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        totalPages,
        (index) => _buildIndicator(index == currentPage),
      ),
    );
  }

  Widget _buildIndicator(bool isActive) {
    return AnimatedContainer(
      duration: OnboardingConstants.indicatorAnimationDuration,
      margin: const EdgeInsets.symmetric(
        horizontal: OnboardingConstants.indicatorMargin,
      ),
      width: isActive
          ? OnboardingConstants.activeIndicatorWidth
          : OnboardingConstants.inactiveIndicatorWidth,
      height: OnboardingConstants.indicatorHeight,
      decoration: BoxDecoration(
        color: isActive
            ? AppColors.cOnboardingActiveIndicator
            : AppColors.cOnboardingInactiveIndicator,
        borderRadius: BorderRadius.circular(50),
      ),
    );
  }
}
