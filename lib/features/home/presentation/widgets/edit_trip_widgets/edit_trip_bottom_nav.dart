import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eltyp_delivery/config/themes/colors.dart';
import 'package:eltyp_delivery/core/extensions/navigation_extensions.dart';
import 'package:eltyp_delivery/features/notifications/presentation/pages/notifications_representative_page.dart';
import 'package:eltyp_delivery/features/profile/presentation/pages/profile_page.dart';

class EditTripBottomNav extends StatelessWidget {
  const EditTripBottomNav({super.key});

  void _handleNavTap(BuildContext context, int index) {
    final routes = [
      null,
      () => context.navigateToPage(const NotificationsRepresentativePage()),
      () => context.navigateToPage(const ProfilePage()),
    ];
    routes[index]?.call();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: AppColors.cNavBarBorder)),
      ),
      child: BottomNavigationBar(
        currentIndex: 2,
        onTap: (index) => _handleNavTap(context, index),
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: AppColors.cPrimary,
        unselectedItemColor: AppColors.cTextSubtitleLight,
        selectedFontSize: 12.sp,
        unselectedFontSize: 12.sp,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.person_outline),
            label: 'profile'.tr(),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.notifications_none),
            label: 'notification'.tr(),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.home_outlined),
            label: 'tracks'.tr(),
          ),
        ],
      ),
    );
  }
}

