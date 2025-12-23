import 'package:flutter/material.dart';
import '../../../../core/components/widgets/custom_text_field.dart';

class EditableInfoCard extends StatelessWidget {
  const EditableInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'المعلومات القابلة للتعديل',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            CustomTextField(
              labelText: 'رقم الموبايل',
              keyboardType: TextInputType.phone,
              borderRadius: 12,
            ),
            const SizedBox(height: 12),
            OutlinedButton(
              onPressed: () {},
              child: const Text('تغيير الصورة الشخصية'),
            ),
            const SizedBox(height: 8),
            OutlinedButton(
              onPressed: () {},
              child: const Text('تغيير كلمة المرور'),
            ),
          ],
        ),
      ),
    );
  }
}
