import 'package:eltyp_delivery/core/extensions/navigation_extensions.dart';
import '../pages/adding_custodyrecord_page.dart';
import '../pages/change_driver_page.dart';
import '../pages/truck_details_page.dart';
import 'package:flutter/material.dart';

class TripActionButtons extends StatelessWidget {
  const TripActionButtons({super.key});

  static const _buttonHeight = 40.0;
  static const _buttonStyle = TextStyle(
    fontWeight: FontWeight.w900,
    fontSize: 11,
  );
  static const _primaryColor = Color(0xFF6B1D1D);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildButton(
          context: context,
          label: 'تحديد السائق',
          onPressed: () => context.navigateToPage(const ChangeDriverPage()),
        ),
        const SizedBox(width: 8),
        _buildButton(
          context: context,
          label: 'تحديد الشاحنة',
          onPressed: () => context.navigateToPageWithClearStack(
            const TruckDetailsPage(),
          ),
        ),
        const SizedBox(width: 8),
        _buildButton(
          context: context,
          label: 'إضافة عهدة',
          onPressed: () => context.navigateToPage(const AddCustodyRecordPage()),
        ),
      ],
    );
  }

  Widget _buildButton({
    required BuildContext context,
    required String label,
    required VoidCallback onPressed,
  }) {
    return Expanded(
      child: SizedBox(
        height: _buttonHeight,
        child: OutlinedButton(
          onPressed: onPressed,
          style: OutlinedButton.styleFrom(
            side: const BorderSide(color: _primaryColor),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            foregroundColor: _primaryColor,
            padding: const EdgeInsets.symmetric(horizontal: 4),
          ),
          child: Text(
            label,
            style: _buttonStyle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

