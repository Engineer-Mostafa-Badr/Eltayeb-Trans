import 'package:flutter/material.dart';

class GeneralInfoCard extends StatelessWidget {
  const GeneralInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    Widget row(String title, String value) => Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(color: Colors.grey)),
          Text(value),
        ],
      ),
    );

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'المعلومات العامة',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            row('البريد الإلكتروني', 'ahmed.ali@company.com'),
            row('الفرع', 'فرع الرياض الرئيسي'),
            row('القسم', 'قسم المبيعات'),
            row('المنصب', 'مندوب مبيعات'),
            row('رقم الهوية', '1234567890'),
            row('تاريخ الانضمام', '15 يناير 2023'),
          ],
        ),
      ),
    );
  }
}
