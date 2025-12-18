import 'package:eltyp_delivery/core/extensions/navigation_extensions.dart';
import '../../../home/presentation/pages/trip_representative_page.dart';
import 'package:eltyp_delivery/core/components/widgets/custom_elevated_button.dart';
import 'package:eltyp_delivery/core/components/widgets/custom_text_field.dart';
import '../../../../config/themes/colors.dart';
import '../../../../core/res/app_images.dart';
import 'package:flutter/material.dart';

class LoginRepresentativePage extends StatefulWidget {
  const LoginRepresentativePage({super.key});

  @override
  State<LoginRepresentativePage> createState() =>
      _LoginRepresentativePageState();
}

class _LoginRepresentativePageState extends State<LoginRepresentativePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.greyFAColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.07),
            child: Column(
              children: [
                SizedBox(height: size.height * 0.08),

                /// LOGO
                Image.asset(
                  AssetImagesPath.appLogo,
                  height: size.height * 0.12,
                ),

                SizedBox(height: size.height * 0.05),

                /// TITLE
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

                /// EMAIL
                const Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'البريد الالكتروني',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF0D1B4C),
                      fontFamily: 'Cairo',
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.01),

                const CustomTextField(
                  hintText: 'أدخل البريد الإلكتروني',
                  svgIconPath: AssetImagesPath.PersonIconSvg,
                  textDirection: TextDirection.rtl,
                ),

                SizedBox(height: size.height * 0.025),
                const Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'كلمة المرور',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF0D1B4C),
                      fontFamily: 'Cairo',
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.01),

                /// PASSWORD
                const CustomTextField(
                  hintText: 'أدخل كلمة المرور',
                  svgIconPath: AssetImagesPath.PasswordIconSvg,
                  isPassword: true,
                  textDirection: TextDirection.rtl,
                ),

                SizedBox(height: size.height * 0.03),

                /// LOGIN BUTTON
                CustomElevatedButton(
                  text: 'تسجيل دخول',
                  backgroundColor: AppColors.cIconLight,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 70),
                  textStyle: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Cairo',
                  ),
                  onPressed: () {
                    context.navigateToPageWithClearStack(
                      const TripsRepresentativePage(),
                    );
                  },
                ),

                SizedBox(height: size.height * 0.05),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
