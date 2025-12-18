import 'package:eltyp_delivery/config/themes/colors.dart';
import 'package:eltyp_delivery/core/res/app_images.dart';
import 'package:eltyp_delivery/features/onboarding/domain/entities/onboarding_entities.dart';

/// Constants and data for onboarding screens
class OnboardingConstants {
  OnboardingConstants._();

  /// List of onboarding pages data
  static const List<OnboardingEntity> onboardingPages = [
    OnboardingEntity(
      title: 'مرحباً في الطيب لخدمات النقل',
      description: 'شغلك واضح هنا ─ رحلاتك، عربيتك، ورصيدك\n لحظة بلحظة.',
      imagePath: AssetImagesPath.introOne,
      primaryText: 'ابدأ الآن',
      primaryColor: AppColors.cOnboardingPrimary,
      secondaryText: 'تخطي',
      hasSecondaryOutlinedButton: false,
    ),
    OnboardingEntity(
      title: 'شوف رحلاتك بسرعة',
      description:
          'استلم الرحلات، اعرف المسار، وابدأ التنفيذ وكل ده من الموبايل.',
      imagePath: AssetImagesPath.introTwo,
      primaryText: 'التالي',
      primaryColor: AppColors.cOnboardingPrimary,
      secondaryText: 'تخطي',
      hasSecondaryOutlinedButton: false,
    ),
    OnboardingEntity(
      title: 'سجل مصروفاتك وصيانة عربيتك',
      description:
          'سجل مصروفك، ارفع إيصال، واطلب صيانة\n بسهولة بكل عملية\n توصل للحسابات تلقائياً.',
      imagePath: AssetImagesPath.introThree,
      primaryText: 'ابدأ العمل الآن',
      primaryColor: AppColors.cPrimary,
      secondaryText: 'رجوع',
      hasSecondaryOutlinedButton: true,
    ),
  ];

  /// Animation durations
  static const Duration pageTransitionDuration = Duration(milliseconds: 300);
  static const Duration indicatorAnimationDuration = Duration(
    milliseconds: 250,
  );

  /// Page indicator dimensions
  static const double activeIndicatorWidth = 32.0;
  static const double inactiveIndicatorWidth = 8.0;
  static const double indicatorHeight = 8.0;
  static const double indicatorMargin = 4.0;

  /// Image container dimensions
  static const double imageContainerSize = 260.0;

  /// Spacing constants
  static const double logoTopSpacing = 40.0;
  static const double horizontalPadding = 32.0;
  static const double indicatorTopSpacing = 16.0;
  static const double buttonsTopSpacing = 30.0;
  static const double buttonSpacing = 12.0;
  static const double bottomSpacing = 24.0;
  static const double logoHeight = 75.0;
}
