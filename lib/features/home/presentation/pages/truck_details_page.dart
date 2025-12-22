import 'package:eltyp_delivery/core/enum/enums.dart';
import 'package:eltyp_delivery/features/home/domain/entities/trucks_entities.dart';
import 'package:eltyp_delivery/features/home/presentation/bloc/trucks_bloc.dart';
import 'package:eltyp_delivery/core/components/images/custom_asset_svg_image.dart';
import 'package:eltyp_delivery/core/res/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eltyp_delivery/core/extensions/navigation_extensions.dart';
import 'trip_representative_page.dart';

class TruckDetailsPage extends StatefulWidget {
  const TruckDetailsPage({super.key});

  @override
  State<TruckDetailsPage> createState() => _TruckDetailsPageState();
}

class _TruckDetailsPageState extends State<TruckDetailsPage> {
  int? selectedTruckId;

  @override
  void initState() {
    super.initState();
    // Fetch trucks when page loads
    context.read<TrucksBloc>().add(const GetTrucksEvent());
  }

  @override
  Widget build(BuildContext context) {
    // Force RTL for Arabic layout
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFFF9F9F9),
        body: SafeArea(
          child: Column(
            children: [
              _buildAppBar(),
              Expanded(
                child: BlocBuilder<TrucksBloc, TrucksState>(
                  builder: (context, state) {
                    if (state.requestState == RequestState.loading) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (state.requestState == RequestState.error) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              state.response.msg ?? 'حدث خطأ في جلب الشاحنات',
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.red,
                              ),
                            ),
                            const SizedBox(height: 16),
                            ElevatedButton(
                              onPressed: () {
                                context.read<TrucksBloc>().add(
                                  const GetTrucksEvent(),
                                );
                              },
                              child: const Text('إعادة المحاولة'),
                            ),
                          ],
                        ),
                      );
                    }

                    final trucks = state.response.data?.trucks ?? [];

                    if (trucks.isEmpty) {
                      return const Center(
                        child: Text(
                          'لا توجد شاحنات متاحة',
                          style: TextStyle(fontSize: 16),
                        ),
                      );
                    }

                    return ListView.separated(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 10,
                      ),
                      itemCount: trucks.length,
                      separatorBuilder: (c, i) => const SizedBox(height: 12),
                      itemBuilder: (context, index) {
                        final truck = trucks[index];
                        return _buildTruckCard(truck, index);
                      },
                    );
                  },
                ),
              ),
              _buildBottomAction(),
            ],
          ),
        ),
        bottomNavigationBar: _buildBottomNavBar(),
      ),
    );
  }

  Widget _buildAppBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          // Back Button
          Directionality(
            textDirection: TextDirection.ltr,
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFEEEEEE),
              ),
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
              ),
            ),
          ),
          const SizedBox(width: 12),

          // Language/Flag
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: const Row(
              children: [
                // Simple representation of Egypt Flag
                Text('🇪🇬', style: TextStyle(fontSize: 16)),
                SizedBox(width: 4),
                Text(
                  'AR',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                ),
              ],
            ),
          ),

          const Expanded(
            child: Text(
              'تفاصيل الشاحنة',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ),

          // Profile Icon
          Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFFF5F5F5),
            ),
            padding: const EdgeInsets.all(8),
            child: const Icon(Icons.person_outline, color: Colors.brown),
          ),
        ],
      ),
    );
  }

  Widget _buildTruckCard(TruckListItemEntities truck, int index) {
    final bool isSelected = selectedTruckId == truck.id;
    const Color maroonColor = Color(0xFF680006);

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedTruckId = truck.id;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: isSelected
              ? Border.all(color: maroonColor, width: 1.5)
              : null,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            // Radio Button Custom
            _buildRadioButton(isSelected, maroonColor),
            const SizedBox(width: 12),

            // Truck Icon Box
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: maroonColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(
                Icons.local_shipping_outlined,
                color: Colors.white,
                size: 24,
              ),
            ),
            const SizedBox(width: 12),

            // Text Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    truck.truckNumber.isNotEmpty
                        ? truck.truckNumber
                        : truck.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Color(0xFF2C3E50),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Text(
                        'النوع: ',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      Text(
                        truck.type ?? 'غير محدد',
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Status Badge
            _buildStatusBadge(_parseStatus(truck.status)),
          ],
        ),
      ),
    );
  }

  TruckStatus _parseStatus(String? status) {
    if (status == null) return TruckStatus.available;

    switch (status.toLowerCase()) {
      case 'available':
      case 'متاح':
        return TruckStatus.available;
      case 'busy':
      case 'مشغول':
      case 'مشغولة':
        return TruckStatus.busy;
      case 'maintenance':
      case 'صيانة':
        return TruckStatus.maintenance;
      default:
        return TruckStatus.available;
    }
  }

  Widget _buildRadioButton(bool isSelected, Color color) {
    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: isSelected ? color : Colors.grey.shade300,
          width: 2,
        ),
      ),
      child: isSelected
          ? Center(
              child: Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(shape: BoxShape.circle, color: color),
              ),
            )
          : null,
    );
  }

  Widget _buildStatusBadge(TruckStatus status) {
    Color bgColor;
    Color textColor;
    String text;

    switch (status) {
      case TruckStatus.available:
        bgColor = const Color(0xFFE0F7FA); // Light Green/Teal
        textColor = const Color(0xFF00695C);
        text = 'متاحة';
        break;
      case TruckStatus.busy:
        bgColor = const Color(0xFFFFEBEE); // Light Red
        textColor = const Color(0xFFC62828);
        text = 'مشغولة';
        break;
      case TruckStatus.maintenance:
        bgColor = const Color(0xFFFFF8E1); // Light Yellow
        textColor = const Color(0xFFF57F17);
        text = 'صيانة';
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontWeight: FontWeight.bold,
          fontSize: 11,
        ),
      ),
    );
  }

  Widget _buildBottomAction() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        width: double.infinity,
        height: 55,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF680006), // Dark Maroon
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 2,
            disabledBackgroundColor: Colors.grey,
          ),
          onPressed: selectedTruckId != null
              ? () {
                  // TODO: Implement confirm truck change logic
                  Navigator.of(context).pop(selectedTruckId);
                }
              : null,
          child: const Text(
            'تأكيد تغيير الشاحنة',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBottomNavBar() {
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
                  context.navigateToPageWithClearStack(
                    const TripsRepresentativePage(initialIndex: 1),
                  );
                },
              ),
              _buildNavItem(
                icon: Icons.person_outline,
                label: 'البروفايل',
                onTap: () {
                  // Go to profile page via main page
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

// --- Data Models ---

enum TruckStatus { available, busy, maintenance }
