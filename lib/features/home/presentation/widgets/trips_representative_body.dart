import 'package:flutter/material.dart';
import '../../data/models/trips_model.dart';
import 'trip_card.dart';

class TripsRepresentativeBody extends StatelessWidget {
  const TripsRepresentativeBody({super.key, required this.trips});

  final List<TripModel> trips;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * .04),
      child: Column(
        children: [
          const SizedBox(height: 12),
          _buildFilters(),
          const SizedBox(height: 12),
          Expanded(
            child: ListView.separated(
              itemCount: trips.length,
              separatorBuilder: (_, _) => const SizedBox(height: 12),
              itemBuilder: (_, index) {
                return TripCard(trip: trips[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilters() {
    return Column(
      children: [
        _filterBox(
          child: const Row(
            children: [
              Icon(Icons.calendar_today_outlined, size: 18),
              SizedBox(width: 8),
              Expanded(child: Text('الكل')),
              Icon(Icons.keyboard_arrow_down),
            ],
          ),
        ),
        const SizedBox(height: 8),
        _filterBox(
          child: const Row(
            children: [
              Icon(Icons.search, size: 18),
              SizedBox(width: 8),
              Text('ابحث عن رحلة'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _filterBox({required Widget child}) {
    return Container(
      height: 48,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: child,
    );
  }
}
