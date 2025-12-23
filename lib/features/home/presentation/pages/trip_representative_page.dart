import '../../../notifications/presentation/pages/notifications_representative_page.dart';
import '../../../profile/presentation/pages/profile_representative_page.dart';
import '../widgets/trip_representative_content.dart';
import 'package:flutter/material.dart';
import '../widgets/trips_app_bar.dart';
import '../../../../core/components/widgets/custom_bottom_navigation_bar.dart';

class TripsRepresentativePage extends StatefulWidget {
  final int? initialIndex;

  const TripsRepresentativePage({super.key, this.initialIndex});

  @override
  State<TripsRepresentativePage> createState() =>
      _TripsRepresentativePageState();
}

class _TripsRepresentativePageState extends State<TripsRepresentativePage> {
  static const _primaryColor = Color(0xFF6B1D1D);
  static const _backgroundColor = Color(0xFFF8F9FB);
  static const _navItems = [
    (icon: Icons.home_filled, label: 'الرحلات'),
    (icon: Icons.notifications_none, label: 'الإشعارات'),
    (icon: Icons.person_outline, label: 'البروفايل'),
  ];

  late int _selectedIndex = widget.initialIndex ?? 0;

  final _pages = const [
    TripRepresentativeContent(),
    NotificationsRepresentativePage(),
    ProfileRepresentativePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _selectedIndex == 0
            ? tripsAppBar(isRepresentative: true)
            : null,
        backgroundColor: _backgroundColor,
        body: IndexedStack(index: _selectedIndex, children: _pages),
        bottomNavigationBar: CustomBottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (index) => setState(() => _selectedIndex = index),
          selectedItemColor: _primaryColor,
          unselectedItemColor: Colors.grey,
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          items: _navItems
              .map(
                (item) => BottomNavigationBarItem(
                  icon: Icon(item.icon),
                  label: item.label,
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
