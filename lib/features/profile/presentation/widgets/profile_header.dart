import 'package:flutter/material.dart';
import '../../../../../config/themes/colors.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: const Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            CircleAvatar(
              radius: 36,
              backgroundColor: AppColors.cPrimaryDark,
              child: Icon(Icons.person, color: Colors.white, size: 36),
            ),
            SizedBox(height: 12),
            Text(
              'أحمد محمد العلي',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4),
            Text('مندوب', style: TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}
