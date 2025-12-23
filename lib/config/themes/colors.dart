import 'package:flutter/material.dart';

class AppColors {
  /// primary colors
  static const MaterialColor cPrimary = MaterialColor(0xFF5A0000, <int, Color>{
    50: Color(0xFFFFEBEE),
    100: Color(0xFFFFCDD2),
    200: Color(0xFFEF9A9A),
    300: Color(0xFFE57373),
    400: Color(0xFFEF5350),
    500: Color(0xFF5A0000),
    600: Color(0xFFE53935),
    700: Color(0xFFD32F2F),
    800: Color(0xFFC62828),
    900: Color(0xFFB71C1C),
  });

  static const cPrimaryBold = Color(0xffE17100);
  static const cDarkBlueColor = Color(0xff00093B);
  static const cLightBlueColor = Color(0xff3B82F6);
  static const cSecondary = Color(0xffF9B815);
  static const cRate = Color(0xffFFC800);
  static const cBlack = Color(0xff000000);
  static const cAlert = Color(0xffE39233);
  static const cError = Color(0xFFE02136);
  static const cSuccess = Color(0xff38C558);
  static const cProfileGreen = Color(0xff00A63E);
  static const cProfileRed = Color(0xffE7000B);
  static const toastColor = Color(0xff404040);
  static const cyanDarkColor = Color(0xFF1E9D9F);
  static const cPinColor = Color(0xFFE5E5E5);
  static const cNavBarBorder = Color(0xFFF0F0F0);
  static const cHomeLiteCard = Color(0xFFFAFAFA);
  static const cCyan = Color(0xFFE5F7F2);
  static const cMoveLight = Color(0xFFF5ECFF);
  static const cNotificationTap = Color(0xFFF5F5F7);
  static const cProfileGray = Color(0xFFF3F4F6);

  /// backgrounds
  static const cScaffoldBackgroundColorLight = Colors.transparent;
  static const cScaffoldBackgroundColorDark = Colors.transparent;
  static const cAppBarLight = cScaffoldBackgroundColorLight;
  static const cAppBarDark = Colors.transparent;
  static const cBottomBarLight = Colors.white;
  static const cBottomBarDark = cScaffoldBackgroundColorDark;
  static const greyF9Color = Color(0xffF9F9F9);
  static const greyFAColor = Color(0xffFAFAFA);

  /// icons
  static const cSelectedIcon = cSecondary;
  static const cUnSelectedIconLight = Color(0xff9CA3AF);
  static const cUnSelectedIconDark = Colors.white;

  static const cAppBarIconLight = Colors.white;
  static const cAppBarIconDark = Colors.white;

  static const cIconLight = cPrimary;
  static const cIconDark = Colors.white;

  static const boldGreyColor = Color(0xff9CA3AF);
  static const greyBDColor = Color(0xffBDBDBD);
  static const greyD2Color = Color(0xffD2D2D2);

  // static const greyEFColor = Color(0xffEFEFEF);
  // static const greyDDColor = Color(0xffDDDDDD);

  /// textformfield
  static const cFillTextFieldLight = Color(0xffEDEAF1);
  static const cFillTextFieldDark = Color(0xffEFF2F5);
  static const cFillBorderLight = Color(0xffD1D5DC);
  static const cTextOfTextFormLight = Color(0xffB3BFCB);
  static const cTextOfTextFormDark = Color(0xffB3BFCB);
  static const cLowPrimaryTitle = Color(0xff6A798A);

  /// cards
  static const cCardLight = Color(0xffF5F5F5);
  static const cCardDark = Color(0xff0a1217);

  /// divider
  static const cDividerLight = Color(0xffE3E3E3);
  static const cDividerDark = Color(0xffA39797);

  /// text color
  static const cTextLight = Colors.white;
  static const cTextDark = Colors.white;
  static const cAppBarTextLight = Colors.white;
  static const cAppBarTextDark = cTextDark;
  static const cTextSubtitleLight = Color(0xff626262);
  static const cTextSubtitleDark = Color(0xffCBCED4);
  static const cWarmWhite = Color(0xff99A1AF);

  /// Onboarding colors
  static const cOnboardingPrimary = Color(0xFF020C3A);
  static const cOnboardingActiveIndicator = Color(0xFF00B062);
  static const cOnboardingInactiveIndicator = Color(0xFFD6D6D6);
  static const cOnboardingImageBackground = Color(0xFFF5F5F5);

  /// Additional colors used across the app
  static const cBackgroundLight = Color(0xFFF7F7F7);
  static const cPrimaryDark = Color(0xFF7A0000);
  static const cEmptyText = Color(0xFF8F8E71);

  /// Custody record page colors
  static const cCustodyPrimaryRed = Color(0xFF560000);
  static const cCustodyTextRed = Color(0xFF6D1B1B);
  static const cCustodyTextDarkBlue = Color(0xFF101828);
  static const cCustodyTextGray = Color(0xFF667085);
  static const cCustodyBorderGray = Color(0xFFEAECF0);
  static const cCustodyIconGray = Color(0xFF98A2B3);
  static const cCustodyBackground = Color(0xFFF9FAFB);
  static const cCustodyButtonBg = Color(0xFFF2F4F7);

  /// Hardcoded colors found in code - moved to AppColors
  static const cTruckDetailsBackground = Color(0xFFF9F9F9);
  static const cTruckDetailsButton = Color(0xFF680006);
  static const cChangeDriverButton = Color(0xFF5D0000);
  static const cDarkBlueText = Color(0xFF0D1B4C);
  static const cFilterStatusRed = Color(0xFF6B1D1D);
}
