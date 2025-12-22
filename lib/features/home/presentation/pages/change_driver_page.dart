import 'package:eltyp_delivery/core/enum/enums.dart';
import 'package:eltyp_delivery/features/home/presentation/bloc/drivers_bloc.dart';
import 'package:eltyp_delivery/features/onboarding/presentation/widgets/background_widget.dart';
import 'package:eltyp_delivery/core/res/app_images.dart';
import 'package:eltyp_delivery/core/extensions/navigation_extensions.dart';
import 'package:eltyp_delivery/core/components/images/custom_asset_svg_image.dart';
import 'package:eltyp_delivery/features/home/presentation/pages/trip_representative_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangeDriverPage extends StatefulWidget {
  const ChangeDriverPage({super.key});

  @override
  State<ChangeDriverPage> createState() => _ChangeDriverPageState();
}

class _ChangeDriverPageState extends State<ChangeDriverPage> {
  int? selectedDriverId;

  @override
  void initState() {
    super.initState();
    // Fetch drivers when page loads
    context.read<DriversBloc>().add(const GetDriversEvent());
  }

  @override
  Widget build(BuildContext context) {
    // Force RTL for Arabic Layout
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        extendBodyBehindAppBar: true,
        body: Stack(
          children: [
            const BackgroundWidget(image: AssetImagesPath.authBackground),
            SafeArea(
              child: Column(
                children: [
                  // Custom Header
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 12.0,
                    ),
                    child: Row(
                      children: [
                        Directionality(
                          textDirection: TextDirection.ltr,
                          child: IconButton(
                            icon: const CustomAssetSvgImage(
                              AssetImagesPath.IconSvg,
                              width: 24,
                              height: 24,
                              color: Colors.black87,
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(),
                          ),
                        ),
                        const SizedBox(width: 12),
                        // Flag and Language
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            children: [
                              const CircleAvatar(
                                radius: 12,
                                backgroundColor: Colors.transparent,
                                backgroundImage: NetworkImage(
                                  'https://flagcdn.com/w40/eg.png',
                                ), // Placeholder for Egypt Flag
                              ),
                              const SizedBox(width: 6),
                              Text(
                                'AR',
                                style: TextStyle(
                                  color: Colors.grey[800],
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Expanded(
                          child: Center(
                            child: Text(
                              'تغيير السائق',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF1A1A1A),
                              ),
                            ),
                          ),
                        ),
                        // Profile Icon placeholder for alignment
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFFF5F5F5),
                          ),
                          child: const Icon(
                            Icons.person_outline,
                            color: Color(0xFF5D0000),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Divider line
                  const Divider(
                    height: 1,
                    thickness: 1,
                    color: Color(0xFFEEEEEE),
                  ),

                  // List of Drivers
                  Expanded(
                    child: BlocBuilder<DriversBloc, DriversState>(
                      builder: (context, state) {
                        if (state.requestState == RequestState.loading) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }

                        if (state.requestState == RequestState.error) {
                          return Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  state.response.msg ??
                                      'حدث خطأ في جلب السائقين',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.red,
                                  ),
                                ),
                                const SizedBox(height: 16),
                                ElevatedButton(
                                  onPressed: () {
                                    context.read<DriversBloc>().add(
                                      const GetDriversEvent(),
                                    );
                                  },
                                  child: const Text('إعادة المحاولة'),
                                ),
                              ],
                            ),
                          );
                        }

                        final drivers = state.response.data?.drivers ?? [];

                        if (drivers.isEmpty) {
                          return const Center(
                            child: Text(
                              'لا توجد سائقين متاحين',
                              style: TextStyle(fontSize: 16),
                            ),
                          );
                        }

                        return ListView.builder(
                          padding: const EdgeInsets.all(16),
                          itemCount: drivers.length,
                          itemBuilder: (context, index) {
                            final driver = drivers[index];
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 12.0),
                              child: DriverCard(
                                name: driver.name,
                                phone: driver.phone,
                                isAvailable: driver.status == 'available',
                                isSelected: selectedDriverId == driver.id,
                                onTap: () {
                                  setState(() {
                                    selectedDriverId = driver.id;
                                  });
                                },
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),

                  // Confirm Button
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                    color: Colors.transparent,
                    child: ElevatedButton(
                      onPressed: selectedDriverId != null
                          ? () {
                              Navigator.of(context).pop(selectedDriverId);
                            }
                          : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF5D0000), // Deep Maroon
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 0,
                        disabledBackgroundColor: Colors.grey,
                      ),
                      child: const Text(
                        'تأكيد تغيير السائق',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),

        // Bottom Navigation Bar - Custom without selection
        bottomNavigationBar: Container(
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
                    onTap: () {
                      // Return to trips page
                      Navigator.of(context).pop();
                    },
                  ),
                  _buildNavItem(
                    icon: Icons.notifications_none,
                    label: 'الإشعارات',
                    onTap: () {
                      // Go to notifications page via main page
                      Navigator.of(context).pop(); // Pop current page
                      context.navigateToPageWithReplacement(
                        const TripsRepresentativePage(initialIndex: 1),
                      );
                    },
                  ),
                  _buildNavItem(
                    icon: Icons.person_outline,
                    label: 'البروفايل',
                    onTap: () {
                      // Go to profile page via main page
                      Navigator.of(context).pop(); // Pop current page
                      context.navigateToPageWithReplacement(
                        const TripsRepresentativePage(initialIndex: 2),
                      );
                    },
                  ),
                ],
              ),
            ),
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

class DriverCard extends StatelessWidget {
  final String name;
  final String phone;
  final bool isAvailable;
  final bool isSelected;
  final VoidCallback onTap;

  const DriverCard({
    super.key,
    required this.name,
    required this.phone,
    required this.isAvailable,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // Colors
    final borderColor = isSelected
        ? const Color(0xFF5D0000)
        : Colors.transparent;
    final statusBgColor = isAvailable
        ? const Color(0xFFE8F5E9)
        : const Color(0xFFFFEBEE);
    final statusTextColor = isAvailable
        ? const Color(0xFF2E7D32)
        : const Color(0xFFC62828);
    final statusText = isAvailable ? 'متاح' : 'مشغول';

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? borderColor : Colors.transparent,
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            // Radio Button Custom
            Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected
                      ? const Color(0xFF5D0000)
                      : Colors.grey.shade300,
                  width: 2,
                ),
              ),
              child: isSelected
                  ? Center(
                      child: Container(
                        height: 10,
                        width: 10,
                        decoration: const BoxDecoration(
                          color: Color(0xFF5D0000),
                          shape: BoxShape.circle,
                        ),
                      ),
                    )
                  : null,
            ),

            const SizedBox(width: 12),

            // Avatar
            Container(
              height: 48,
              width: 48,
              decoration: const BoxDecoration(
                color: Color(0xFF5D0000), // Maroon background for avatar
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.person, color: Colors.white, size: 28),
            ),

            const SizedBox(width: 12),

            // Name and Phone
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2D3436),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Text(
                        phone,
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey[600],
                          fontFamily: 'Roboto', // For numbers
                        ),
                      ),
                      const SizedBox(width: 4),
                      Icon(Icons.phone, size: 14, color: Colors.grey[500]),
                    ],
                  ),
                ],
              ),
            ),

            // Status Badge
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: statusBgColor,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                statusText,
                style: TextStyle(
                  color: statusTextColor,
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
