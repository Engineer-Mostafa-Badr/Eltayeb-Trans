import 'package:flutter/material.dart';

class TripCardWidget extends StatelessWidget {
  final String id;
  final String route;
  final String date;
  final String status;
  final Color statusColor;
  final Color textColor;
  final VoidCallback? onSelectDriver;
  final VoidCallback? onSelectTruck;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final Color? backgroundColor;
  final double borderRadius;
  final List<BoxShadow>? boxShadow;

  const TripCardWidget({
    super.key,
    required this.id,
    required this.route,
    required this.date,
    required this.status,
    required this.statusColor,
    required this.textColor,
    this.onSelectDriver,
    this.onSelectTruck,
    this.margin = const EdgeInsets.only(bottom: 16),
    this.padding = const EdgeInsets.all(16),
    this.backgroundColor = Colors.white,
    this.borderRadius = 12,
    this.boxShadow,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow:
            boxShadow ??
            [
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
                  onPressed: onSelectDriver,
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
                  onPressed: onSelectTruck,
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
