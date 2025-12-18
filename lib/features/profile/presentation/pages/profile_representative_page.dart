import 'package:flutter/material.dart';
import '../../../../config/themes/colors.dart';
import '../widgets/profile_header.dart';
import '../widgets/editable_info_card.dart';
import '../widgets/general_info_card.dart';
import '../widgets/save_button.dart';

class ProfileRepresentativePage extends StatelessWidget {
  const ProfileRepresentativePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cBackgroundLight,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const ProfileHeader(),
            const SizedBox(height: 16),
            const EditableInfoCard(),
            const SizedBox(height: 16),
            const GeneralInfoCard(),
            const SizedBox(height: 24),
            const SaveButton(),
            const SizedBox(height: 12),
            TextButton(onPressed: () {}, child: const Text('تسجيل الخروج')),
          ],
        ),
      ),
    );
  }
}
