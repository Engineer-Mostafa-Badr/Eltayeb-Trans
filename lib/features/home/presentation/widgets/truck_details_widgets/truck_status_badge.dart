import 'package:flutter/material.dart';

enum TruckStatus { available, busy, maintenance }

class TruckStatusBadge extends StatelessWidget {
  final TruckStatus status;

  const TruckStatusBadge({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    final statusData = _getStatusData(status);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: statusData.backgroundColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        statusData.label,
        style: TextStyle(
          color: statusData.textColor,
          fontWeight: FontWeight.bold,
          fontSize: 11,
        ),
      ),
    );
  }

  _StatusData _getStatusData(TruckStatus status) {
    switch (status) {
      case TruckStatus.available:
        return const _StatusData(
          backgroundColor: Color(0xFFE0F7FA),
          textColor: Color(0xFF00695C),
          label: 'متاحة',
        );
      case TruckStatus.busy:
        return const _StatusData(
          backgroundColor: Color(0xFFFFEBEE),
          textColor: Color(0xFFC62828),
          label: 'مشغولة',
        );
      case TruckStatus.maintenance:
        return const _StatusData(
          backgroundColor: Color(0xFFFFF8E1),
          textColor: Color(0xFFF57F17),
          label: 'صيانة',
        );
    }
  }

  static TruckStatus parseStatus(String? status) {
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
}

class _StatusData {
  final Color backgroundColor;
  final Color textColor;
  final String label;

  const _StatusData({
    required this.backgroundColor,
    required this.textColor,
    required this.label,
  });
}

