import 'package:flutter/material.dart';
import '../../../../core/res/app_images.dart';

class LoginRepresentativeHeader extends StatelessWidget {
  const LoginRepresentativeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      children: [
        SizedBox(height: size.height * 0.08),
        Image.asset(AssetImagesPath.appLogo, height: size.height * 0.12),
        SizedBox(height: size.height * 0.05),
        const Text(
          'تسجيل الدخول',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Color(0xFF0D1B4C),
            fontFamily: 'Cairo',
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'أدخل بيانات حسابك للوصول إلى لوحة التحكم',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14,
            color: Colors.black.withValues(alpha: 0.6),
            fontFamily: 'Cairo',
          ),
        ),
        SizedBox(height: size.height * 0.04),
      ],
    );
  }
}
