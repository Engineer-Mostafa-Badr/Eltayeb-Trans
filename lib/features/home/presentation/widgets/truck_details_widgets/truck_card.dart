import 'package:eltyp_delivery/features/home/domain/entities/trucks_entities.dart';
import 'package:eltyp_delivery/features/home/presentation/widgets/truck_details_widgets/truck_status_badge.dart';
import 'package:flutter/material.dart';

class TruckCard extends StatelessWidget {
  final TruckListItemEntities truck;
  final bool isSelected;
  final VoidCallback onTap;

  const TruckCard({
    super.key,
    required this.truck,
    required this.isSelected,
    required this.onTap,
  });

  static const Color maroonColor = Color(0xFF680006);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
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
            _buildRadioButton(),
            const SizedBox(width: 12),
            _buildTruckIcon(),
            const SizedBox(width: 12),
            Expanded(child: _buildTruckInfo()),
            TruckStatusBadge(
              status: TruckStatusBadge.parseStatus(truck.status),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRadioButton() {
    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: isSelected ? maroonColor : Colors.grey.shade300,
          width: 2,
        ),
      ),
      child: isSelected
          ? Center(
              child: Container(
                width: 12,
                height: 12,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: maroonColor,
                ),
              ),
            )
          : null,
    );
  }

  Widget _buildTruckIcon() {
    return Container(
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
    );
  }

  Widget _buildTruckInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          truck.truckNumber.isNotEmpty ? truck.truckNumber : truck.name,
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
    );
  }
}

