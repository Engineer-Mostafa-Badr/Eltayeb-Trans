import 'package:eltyp_delivery/core/extensions/navigation_extensions.dart';
import 'package:eltyp_delivery/features/home/data/models/trips_model.dart';
import '../pages/trips_details_page.dart';
import 'package:flutter/material.dart';
import 'trip_action_buttons.dart';
import 'trip_status_badge.dart';

class TripRepresentativeCard extends StatelessWidget {
  final TripModel trip;

  const TripRepresentativeCard({super.key, required this.trip});

  static const _primaryColor = Color(0xFF6B1D1D);
  static const _textColor = Color(0xFF2C3E50);
  static const _dividerColor = Color(0xFFEEEEEE);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.navigateToPage(TripDetailsPage(tripId: trip.id)),
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              // ignore: deprecated_member_use
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            const SizedBox(height: 12),
            _buildRouteInfo(),
            const SizedBox(height: 4),
            _buildDate(),
            const SizedBox(height: 16),
            const Divider(height: 1, color: _dividerColor),
            const SizedBox(height: 16),
            GestureDetector(
              onTap: () {}, // Stop event propagation to parent InkWell
              child: const TripActionButtons(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'رحلة رقم ${trip.id}',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: _primaryColor,
          ),
        ),
        TripStatusBadge(status: trip.status),
      ],
    );
  }

  Widget _buildRouteInfo() {
    return Row(
      children: [
        Text(
          trip.fromCity.name,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: _textColor,
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Icon(Icons.arrow_back, size: 16, color: _primaryColor),
        ),
        Text(
          trip.toCity.name,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: _textColor,
          ),
        ),
      ],
    );
  }

  Widget _buildDate() {
    return Text(
      trip.date,
      style: TextStyle(fontSize: 13, color: Colors.grey[500]),
    );
  }
}
