import 'package:flutter/material.dart';

import '../../../../../config/themes/colors.dart';
import '../../../../../core/components/widgets/custom_bottom_navigation_bar.dart';
import '../../../../../core/extensions/navigation_extensions.dart';
import '../../../../../core/utils/app_sizes.dart';
import '../../../../notifications/presentation/pages/notifications_representative_page.dart';
import '../../../../profile/presentation/pages/profile_representative_page.dart';

class TripDetailsBottomNav extends StatelessWidget {
  const TripDetailsBottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: AppColors.cNavBarBorder)),
      ),
      child: CustomBottomNavigationBar(
        currentIndex: 0,
        onTap: (index) {
          if (index == 0) {
            Navigator.pop(context);
          } else if (index == 1) {
            context.navigateToPage(const NotificationsRepresentativePage());
          } else if (index == 2) {
            context.navigateToPage(const ProfileRepresentativePage());
          }
        },
        backgroundColor: Colors.white,
        selectedItemColor: AppColors.cPrimary,
        unselectedItemColor: AppColors.cTextSubtitleLight,
        selectedFontSize: AppFontSize.f12,
        unselectedFontSize: AppFontSize.f12,
        elevation: 0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: 'الرحلات',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_none),
            label: 'الإشعارات',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'البروفايل',
          ),
        ],
      ),
    );
  }
}
