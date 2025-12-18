import '../../../notifications/presentation/pages/notifications_representative_page.dart';
import '../../../profile/presentation/pages/profile_representative_page.dart';
import 'package:eltyp_delivery/core/components/widgets/custom_app_bar.dart';
import 'package:eltyp_delivery/core/components/widgets/custom_bottom_navigation_bar.dart';
import 'package:eltyp_delivery/core/components/widgets/search_section_widget.dart';
import 'package:flutter/material.dart';

class TripsRepresentativePage extends StatefulWidget {
  const TripsRepresentativePage({super.key});

  @override
  State<TripsRepresentativePage> createState() =>
      _TripsRepresentativePageState();
}

class _TripsRepresentativePageState extends State<TripsRepresentativePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    TripsRepresentativeBody(),
    NotificationsRepresentativePage(),
    ProfileRepresentativePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),

      body: IndexedStack(index: _currentIndex, children: _pages),
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedItemColor: const Color(0xFF9B1B1B),
        unselectedItemColor: Colors.grey,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) => setState(() => _currentIndex = index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
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

/// ========================
/// Trips Page
/// ========================
class TripsRepresentativeBody extends StatelessWidget {
  const TripsRepresentativeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Column(
        children: [
          _buildAppBar(),
          const SearchSection(),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 4,
                    horizontal: 16,
                  ),
                  child: TripCard(
                    id: '254$index',
                    route: 'القاهرة ← الاسكندرية',
                    date: '12 مارس 2025',
                    status: index % 2 == 0 ? 'مجدولة' : 'مكتملة',
                    statusColor: index % 2 == 0
                        ? const Color(0xFFFFF4D2)
                        : const Color(0xFFDFF4E1),
                    textColor: index % 2 == 0
                        ? const Color(0xFFD4A017)
                        : const Color(0xFF27AE60),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppBar() {
    return const RepresentativeAppBar(notificationCount: 7);
  }
}

/// ========================
/// Search Section
/// ========================
class SearchSection extends StatelessWidget {
  const SearchSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SearchSectionWidget(
      filterOptions: const ['الكل'],
      selectedFilter: 'الكل',
      searchHint: 'ابحث عن رحلة',
    );
  }
}

/// ========================
/// TripCard Widget
/// ========================
class TripCard extends StatelessWidget {
  final String id;
  final String route;
  final String date;
  final String status;
  final Color statusColor;
  final Color textColor;

  const TripCard({
    super.key,
    required this.id,
    required this.route,
    required this.date,
    required this.status,
    required this.statusColor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: statusColor,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  status,
                  style: TextStyle(
                    color: textColor,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                'رحلة رقم $id',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Color(0xFF4A0000),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            route,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Color(0xFF2D3142),
            ),
          ),
          const SizedBox(height: 4),
          Text(date, style: const TextStyle(fontSize: 13, color: Colors.grey)),
          const Divider(height: 32),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Color(0xFF4A0000)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                  child: const Text(
                    'تحديد السائق',
                    style: TextStyle(
                      color: Color(0xFF4A0000),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Color(0xFF4A0000)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                  child: const Text(
                    'تحديد الشاحنة',
                    style: TextStyle(
                      color: Color(0xFF4A0000),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// ========================
/// Notifications Page
/// ========================
class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('الإشعارات'),
        backgroundColor: const Color(0xFF9B1B1B),
      ),
      body: const Center(child: Text('صفحة الإشعارات فارغة')),
    );
  }
}

/// ========================
/// Profile Page
/// ========================
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('البروفايل'),
        backgroundColor: const Color(0xFF9B1B1B),
      ),
      body: const Center(child: Text('صفحة البروفايل')),
    );
  }
}
