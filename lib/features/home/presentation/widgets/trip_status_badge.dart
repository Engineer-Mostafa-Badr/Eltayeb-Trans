import 'package:flutter/material.dart';

class TripStatusBadge extends StatelessWidget {
  final String status;

  const TripStatusBadge({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    final statusData = _getStatusData(status);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: statusData.backgroundColor,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        statusData.label,
        style: TextStyle(
          color: statusData.textColor,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  _StatusData _getStatusData(String status) {
    switch (status.toLowerCase()) {
      case 'scheduled':
      case 'مجدولة':
        return const _StatusData(
          backgroundColor: Color(0xFFFFF8E1),
          textColor: Color(0xFFFBC02D),
          label: 'مجدولة',
        );
      case 'in_progress':
      case 'in progress':
      case 'قيد التنفيذ':
        return const _StatusData(
          backgroundColor: Color(0xFFE3F2FD),
          textColor: Color(0xFF1976D2),
          label: 'قيد التنفيذ',
        );
      case 'completed':
      case 'مكتملة':
        return const _StatusData(
          backgroundColor: Color(0xFFE8F5E9),
          textColor: Color(0xFF388E3C),
          label: 'مكتملة',
        );
      case 'cancelled':
      case 'ملغاة':
        return const _StatusData(
          backgroundColor: Color(0xFFFFEBEE),
          textColor: Color(0xFFD32F2F),
          label: 'ملغاة',
        );
      default:
        return _StatusData(
          backgroundColor: Colors.grey.shade200,
          textColor: Colors.grey.shade700,
          label: status,
        );
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
