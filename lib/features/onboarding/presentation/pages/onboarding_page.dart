import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eltyp_delivery/core/extensions/navigation_extensions.dart';
import 'package:eltyp_delivery/core/res/app_images.dart';
import 'package:eltyp_delivery/core/storage/main_hive_box.dart';
import 'package:eltyp_delivery/core/utils/app_const.dart';
import 'package:eltyp_delivery/features/injection_container.dart' as di;
import 'package:eltyp_delivery/features/onboarding/presentation/constants/onboarding_constants.dart';
import 'package:eltyp_delivery/features/onboarding/presentation/widgets/onboarding_action_buttons.dart';
import 'package:eltyp_delivery/features/onboarding/presentation/widgets/onboarding_page_indicator.dart';
import 'package:eltyp_delivery/features/onboarding/presentation/widgets/onboarding_page_view.dart';
import '../../../auth/presentation/pages/login_representative_page.dart';

/// Onboarding page that displays introduction screens for first-time users
class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  late final PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            _buildLogo(),
            Expanded(child: _buildPageView()),
            SizedBox(height: OnboardingConstants.indicatorTopSpacing.h),
            _buildPageIndicator(),
            SizedBox(height: OnboardingConstants.buttonsTopSpacing.h),
            _buildActionButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return Column(
      children: [
        SizedBox(height: OnboardingConstants.logoTopSpacing.h),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: OnboardingConstants.horizontalPadding,
          ),
          child: Image.asset(
            AssetImagesPath.appLogo,
            height: OnboardingConstants.logoHeight,
            fit: BoxFit.contain,
          ),
        ),
      ],
    );
  }

  Widget _buildPageView() {
    return PageView.builder(
      controller: _pageController,
      itemCount: OnboardingConstants.onboardingPages.length,
      onPageChanged: _onPageChanged,
      itemBuilder: (context, index) {
        final pageData = OnboardingConstants.onboardingPages[index];
        return OnboardingPageView(data: pageData);
      },
    );
  }

  Widget _buildPageIndicator() {
    return OnboardingPageIndicator(
      currentPage: _currentPage,
      totalPages: OnboardingConstants.onboardingPages.length,
    );
  }

  Widget _buildActionButtons() {
    final currentPageData = OnboardingConstants.onboardingPages[_currentPage];
    return OnboardingActionButtons(
      currentPageData: currentPageData,
      onPrimaryPressed: _handlePrimaryButtonPress,
      onSecondaryPressed: currentPageData.hasSecondaryOutlinedButton
          ? _handleSecondaryButtonPress
          : null,
      onSkipPressed: _handleSkipPress,
    );
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  Future<void> _handlePrimaryButtonPress() async {
    if (_currentPage < OnboardingConstants.onboardingPages.length - 1) {
      _navigateToNextPage();
    } else {
      await _finishOnboarding();
    }
  }

  void _handleSecondaryButtonPress() {
    if (_currentPage > 0) {
      _navigateToPreviousPage();
    }
  }

  Future<void> _handleSkipPress() async {
    await _finishOnboarding();
  }

  void _navigateToNextPage() {
    _pageController.nextPage(
      duration: OnboardingConstants.pageTransitionDuration,
      curve: Curves.easeInOut,
    );
  }

  void _navigateToPreviousPage() {
    _pageController.previousPage(
      duration: OnboardingConstants.pageTransitionDuration,
      curve: Curves.easeInOut,
    );
  }

  Future<void> _finishOnboarding() async {
    await di.sl<MainSecureStorage>().putValue(AppConst.introFinishBox, true);
    if (mounted) {
      context.navigateToPageWithClearStack(const LoginRepresentativePage());
    }
  }
}
