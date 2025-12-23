import 'package:eltyp_delivery/core/extensions/navigation_extensions.dart';
import 'package:eltyp_delivery/features/home/presentation/pages/trip_representative_page.dart';
import 'package:flutter/material.dart';

class TruckDetailsBottomNav extends StatelessWidget {
  const TruckDetailsBottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        child: Container(
          height: 60,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(
                icon: Icons.home_filled,
                label: 'الرحلات',
                onTap: () => Navigator.of(context).pop(),
              ),
              _buildNavItem(
                icon: Icons.notifications_none,
                label: 'الإشعارات',
                onTap: () {
                  context.navigateToPageWithClearStack(
                    const TripsRepresentativePage(initialIndex: 1),
                  );
                },
              ),
              _buildNavItem(
                icon: Icons.person_outline,
                label: 'البروفايل',
                onTap: () {
                  context.navigateToPageWithClearStack(
                    const TripsRepresentativePage(initialIndex: 2),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.grey, size: 24),
            const SizedBox(height: 4),
            Text(
              label,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

