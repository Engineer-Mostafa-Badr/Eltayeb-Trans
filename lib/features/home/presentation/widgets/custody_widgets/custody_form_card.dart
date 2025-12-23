import 'package:flutter/material.dart';
import 'package:eltyp_delivery/config/themes/colors.dart';

class CustodyFormCard extends StatelessWidget {
  final String amount;
  final ValueChanged<String>? onAmountChanged;

  const CustodyFormCard({
    super.key,
    this.amount = '0.00',
    this.onAmountChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'ادخل العهدة',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.cCustodyTextRed,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 40),
          const Text(
            'المبلغ',
            textAlign: TextAlign.right,
            style: TextStyle(
              color: AppColors.cCustodyTextDarkBlue,
              fontSize: 15,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 10),
          _buildAmountInput(),
        ],
      ),
    );
  }

  Widget _buildAmountInput() {
    return Container(
      height: 56,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.cCustodyBorderGray),
      ),
      child: Row(
        children: [
          const Text(
            'جنيه',
            style: TextStyle(
              color: AppColors.cCustodyTextDarkBlue,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Spacer(),
          Text(
            amount,
            style: const TextStyle(
              color: AppColors.cCustodyIconGray,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(width: 6),
          const Text(
            r'$',
            style: TextStyle(
              color: AppColors.cCustodyIconGray,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}

