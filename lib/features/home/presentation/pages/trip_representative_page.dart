import '../../../notifications/presentation/pages/notifications_representative_page.dart';
import '../../../profile/presentation/pages/profile_representative_page.dart';
import 'package:eltyp_delivery/core/extensions/navigation_extensions.dart';
import 'package:eltyp_delivery/core/enum/enums.dart';
import 'package:eltyp_delivery/features/home/data/models/trips_model.dart';
import 'package:eltyp_delivery/features/home/domain/entities/get_trips_params.dart';
import 'package:eltyp_delivery/features/home/presentation/bloc/trips_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'change_driver_page.dart';
import 'truck_details_page.dart';

// 1. الشاشة الرئيسية التي تحتوي على البوتوم ناف بار والتحكم في التنقل
class TripsRepresentativePage extends StatefulWidget {
  const TripsRepresentativePage({super.key});

  @override
  State<TripsRepresentativePage> createState() =>
      _TripsRepresentativePageState();
}

class _TripsRepresentativePageState extends State<TripsRepresentativePage> {
  int _selectedIndex = 0;

  // قائمة الصفحات التي سيتم التنقل بينها
  final List<Widget> _pages = [
    const TripsPageContent(), // الصفحة 0: محتوى الرحلات (تم فصله)
    const NotificationsRepresentativePage(), // الصفحة 1: صفحة الإشعارات
    const ProfileRepresentativePage(), // الصفحة 2: صفحة البروفايل
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Force RTL for Arabic UI
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFFF8F9FB),

        // هنا يتم عرض الصفحة بناءً على الاندكس المختار
        body: _pages[_selectedIndex],

        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          selectedItemColor: const Color(0xFF6B1D1D),
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
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
      ),
    );
  }
}

// ---------------------------------------------------------
// 2. محتوى صفحة الرحلات (تم نقله هنا ليكون صفحة مستقلة)
// ---------------------------------------------------------
class TripsPageContent extends StatefulWidget {
  const TripsPageContent({super.key});

  @override
  State<TripsPageContent> createState() => _TripsPageContentState();
}

class _TripsPageContentState extends State<TripsPageContent> {
  final TextEditingController _searchController = TextEditingController();
  String? _selectedStatus;
  String? _fromDate;
  String? _toDate;

  @override
  void initState() {
    super.initState();
    // جلب الرحلات عند فتح الصفحة
    WidgetsBinding.instance.addPostFrameCallback((_) {
      TripsBloc.get(context).add(const GetTripsEvent());
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _loadTrips() {
    final params = GetTripsParams(
      filterStatus: _selectedStatus,
      search: _searchController.text.isNotEmpty ? _searchController.text : null,
      from: _fromDate,
      to: _toDate,
    );
    TripsBloc.get(context).add(GetTripsEvent(params: params));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<TripsBloc, TripsState>(
        listener: (context, state) {
          if (state.requestUtilsState == RequestState.error) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  state.responseUtils.msg ?? 'حدث خطأ ما',
                  style: const TextStyle(color: Colors.white),
                ),
                backgroundColor: Colors.red,
                duration: const Duration(seconds: 3),
              ),
            );
          }
        },
        builder: (context, state) {
          final trips = state.responseUtils.data?.trips ?? [];
          final isLoading = state.requestUtilsState == RequestState.loading;
          final hasError = state.requestUtilsState == RequestState.error;

          return Column(
            children: [
              const CustomHeader(),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8.0,
                ),
                child: FilterAndSearchSection(
                  searchController: _searchController,
                  selectedStatus: _selectedStatus,
                  fromDate: _fromDate,
                  toDate: _toDate,
                  onStatusChanged: (status) {
                    setState(() {
                      _selectedStatus = status;
                    });
                    _loadTrips();
                  },
                  onSearchChanged: () {
                    _loadTrips();
                  },
                  onDateRangeSelected: (from, to) {
                    setState(() {
                      _fromDate = from;
                      _toDate = to;
                    });
                    _loadTrips();
                  },
                ),
              ),
              Expanded(
                child: isLoading && trips.isEmpty
                    ? const Center(
                        child: CircularProgressIndicator(
                          color: Color(0xFF6B1D1D),
                        ),
                      )
                    : hasError && trips.isEmpty
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.error_outline,
                              size: 64,
                              color: Colors.red,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              state.responseUtils.msg ?? 'حدث خطأ ما',
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.red,
                              ),
                            ),
                            const SizedBox(height: 16),
                            ElevatedButton(
                              onPressed: () {
                                _loadTrips();
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF6B1D1D),
                              ),
                              child: const Text(
                                'إعادة المحاولة',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      )
                    : trips.isEmpty
                    ? const Center(
                        child: Text(
                          'لا توجد رحلات',
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      )
                    : ListView.separated(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 8.0,
                        ),
                        itemCount: trips.length,
                        separatorBuilder: (c, i) => const SizedBox(height: 12),
                        itemBuilder: (context, index) {
                          return TripCard(trip: trips[index]);
                        },
                      ),
              ),
            ],
          );
        },
      ),
    );
  }
}

// ---------------------------------------------------------
// 3. صفحات إضافية (وهمية) للإشعارات والبروفايل للتجربة
// ---------------------------------------------------------

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'صفحة الإشعارات',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.grey,
        ),
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'صفحة البروفايل',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.grey,
        ),
      ),
    );
  }
}

// ---------------------------------------------------------
// --- WIDGETS & COMPONENTS (نفس الكود السابق بدون تغيير) ---
// ---------------------------------------------------------

class CustomHeader extends StatelessWidget {
  const CustomHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            backgroundColor: Colors.grey[100],
            radius: 20,
            child: const Icon(Icons.person_outline, color: Color(0xFF6B1D1D)),
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.local_shipping,
                      color: Color(0xFF6B1D1D),
                      size: 20,
                    ),
                    SizedBox(width: 4),
                    Text(
                      'ELTAYEB',
                      style: TextStyle(
                        color: Color(0xFF6B1D1D),
                        fontWeight: FontWeight.w900,
                        fontSize: 16,
                        letterSpacing: 1,
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 2,
                  width: 40,
                  color: const Color(0xFF6B1D1D),
                  margin: const EdgeInsets.only(top: 2),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                child: Row(
                  children: [
                    ClipOval(
                      child: Container(
                        width: 20,
                        height: 20,
                        color: Colors.red,
                        alignment: Alignment.center,
                        child: const Text(
                          '🇪🇬',
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                    ),
                    const SizedBox(width: 4),
                    const Text(
                      'AR',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  const Icon(Icons.notifications_none_outlined, size: 28),
                  Positioned(
                    top: -2,
                    left: -2,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        color: Color(0xFF6B1D1D),
                        shape: BoxShape.circle,
                      ),
                      child: const Text(
                        '7',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class FilterAndSearchSection extends StatefulWidget {
  final TextEditingController searchController;
  final String? selectedStatus;
  final String? fromDate;
  final String? toDate;
  final Function(String?)? onStatusChanged;
  final VoidCallback? onSearchChanged;
  final Function(String?, String?)? onDateRangeSelected;

  const FilterAndSearchSection({
    super.key,
    required this.searchController,
    this.selectedStatus,
    this.fromDate,
    this.toDate,
    this.onStatusChanged,
    this.onSearchChanged,
    this.onDateRangeSelected,
  });

  @override
  State<FilterAndSearchSection> createState() => _FilterAndSearchSectionState();
}

class _FilterAndSearchSectionState extends State<FilterAndSearchSection> {
  final List<String> statusOptions = [
    'الكل',
    'مجدولة',
    'قيد التنفيذ',
    'مكتملة',
    'ملغاة',
  ];
  final Map<String, String?> statusMap = {
    'الكل': null,
    'مجدولة': 'scheduled',
    'قيد التنفيذ': 'in_progress',
    'مكتملة': 'completed',
    'ملغاة': 'cancelled',
  };

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
              ),
              child: IconButton(
                icon: const Icon(Icons.calendar_today_outlined, size: 20),
                color: const Color(0xFF6B1D1D),
                onPressed: () async {
                  // يمكن إضافة date picker هنا
                  final DateTimeRange? picked = await showDateRangePicker(
                    context: context,
                    firstDate: DateTime(2020),
                    lastDate: DateTime(2030),
                    locale: const Locale('ar', 'EG'),
                  );
                  if (picked != null) {
                    widget.onDateRangeSelected?.call(
                      picked.start.toIso8601String().split('T')[0],
                      picked.end.toIso8601String().split('T')[0],
                    );
                  }
                },
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => Container(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: statusOptions.map((status) {
                          return ListTile(
                            title: Text(status),
                            onTap: () {
                              widget.onStatusChanged?.call(statusMap[status]);
                              Navigator.pop(context);
                            },
                            trailing: widget.selectedStatus == statusMap[status]
                                ? const Icon(
                                    Icons.check,
                                    color: Color(0xFF6B1D1D),
                                  )
                                : null,
                          );
                        }).toList(),
                      ),
                    ),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  height: 48,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        statusOptions.firstWhere(
                          (s) => statusMap[s] == widget.selectedStatus,
                          orElse: () => 'الكل',
                        ),
                        style: const TextStyle(fontSize: 14),
                      ),
                      const Icon(
                        Icons.keyboard_arrow_down,
                        color: Color(0xFF6B1D1D),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Container(
          height: 48,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
          ),
          child: TextField(
            controller: widget.searchController,
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: 'ابحث عن رحلة',
              hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
              contentPadding: EdgeInsets.symmetric(vertical: 14),
              prefixIcon: SizedBox(width: 10),
              suffixIcon: Icon(Icons.search, color: Color(0xFF6B1D1D)),
            ),
            onChanged: (_) {
              // يمكن إضافة debounce هنا
              widget.onSearchChanged?.call();
            },
            onSubmitted: (_) {
              widget.onSearchChanged?.call();
            },
          ),
        ),
      ],
    );
  }
}

class TripCard extends StatelessWidget {
  final TripModel trip;
  const TripCard({super.key, required this.trip});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
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
              Text(
                'رحلة رقم ${trip.id}',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF6B1D1D),
                ),
              ),
              _buildStatusBadge(trip.status),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Text(
                trip.fromCity.name,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF2C3E50),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Icon(
                  Icons.arrow_back,
                  size: 16,
                  color: Color(0xFF6B1D1D),
                ),
              ),
              Text(
                trip.toCity.name,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF2C3E50),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            trip.date,
            style: TextStyle(fontSize: 13, color: Colors.grey[500]),
          ),
          const SizedBox(height: 16),
          const Divider(height: 1, color: Color(0xFFEEEEEE)),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 40,
                  child: OutlinedButton(
                    onPressed: () {
                      context.navigateToPageWithClearStack(
                        const ChangeDriverPage(),
                      );
                    },
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Color(0xFF6B1D1D)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      foregroundColor: const Color(0xFF6B1D1D),
                    ),
                    child: const Text(
                      'تحديد السائق',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: SizedBox(
                  height: 40,
                  child: OutlinedButton(
                    onPressed: () {
                      context.navigateToPageWithClearStack(
                        const TruckDetailsPage(),
                      );
                    },
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Color(0xFF6B1D1D)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      foregroundColor: const Color(0xFF6B1D1D),
                    ),
                    child: const Text(
                      'تحديد الشاحنة',
                      style: TextStyle(fontWeight: FontWeight.bold),
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

  Widget _buildStatusBadge(String status) {
    Color bg;
    Color text;
    String label;

    // تحويل status string إلى label عربي
    switch (status.toLowerCase()) {
      case 'scheduled':
      case 'مجدولة':
        bg = const Color(0xFFFFF8E1);
        text = const Color(0xFFFBC02D);
        label = 'مجدولة';
        break;
      case 'in_progress':
      case 'in progress':
      case 'قيد التنفيذ':
        bg = const Color(0xFFE3F2FD);
        text = const Color(0xFF1976D2);
        label = 'قيد التنفيذ';
        break;
      case 'completed':
      case 'مكتملة':
        bg = const Color(0xFFE8F5E9);
        text = const Color(0xFF388E3C);
        label = 'مكتملة';
        break;
      case 'cancelled':
      case 'ملغاة':
        bg = const Color(0xFFFFEBEE);
        text = const Color(0xFFD32F2F);
        label = 'ملغاة';
        break;
      default:
        bg = Colors.grey.shade200;
        text = Colors.grey.shade700;
        label = status;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: text,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
