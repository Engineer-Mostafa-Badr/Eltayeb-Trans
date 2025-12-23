import 'package:flutter/material.dart';

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
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? const Color(0xFF5D0000) : Colors.transparent,
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
            _buildRadioButton(),
            const SizedBox(width: 12),
            _buildAvatar(),
            const SizedBox(width: 12),
            Expanded(child: _buildDriverInfo()),
            _buildStatusBadge(),
          ],
        ),
      ),
    );
  }

  Widget _buildRadioButton() {
    return Container(
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
    );
  }

  Widget _buildAvatar() {
    return Container(
      height: 48,
      width: 48,
      decoration: const BoxDecoration(
        color: Color(0xFF5D0000),
        shape: BoxShape.circle,
      ),
      child: const Icon(Icons.person, color: Colors.white, size: 28),
    );
  }

  Widget _buildDriverInfo() {
    return Column(
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
                fontFamily: 'Roboto',
              ),
            ),
            const SizedBox(width: 4),
            Icon(Icons.phone, size: 14, color: Colors.grey[500]),
          ],
        ),
      ],
    );
  }

  Widget _buildStatusBadge() {
    final statusBgColor = isAvailable
        ? const Color(0xFFE8F5E9)
        : const Color(0xFFFFEBEE);
    final statusTextColor = isAvailable
        ? const Color(0xFF2E7D32)
        : const Color(0xFFC62828);
    final statusText = isAvailable ? 'متاح' : 'مشغول';

    return Container(
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
    );
  }
}

