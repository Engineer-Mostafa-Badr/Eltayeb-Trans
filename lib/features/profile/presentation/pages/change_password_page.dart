import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eltyp_delivery/core/enum/enums.dart';
import 'package:eltyp_delivery/features/profile/domain/entities/update_password_params.dart';
import 'package:eltyp_delivery/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:eltyp_delivery/features/onboarding/presentation/widgets/background_widget.dart';
import 'package:eltyp_delivery/core/res/app_images.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final Color primaryDarkRed = const Color(
    0xFF580a0f,
  ); // The dark red/maroon color
  int _selectedIndex = 2; // 'Profile' is selected in the image

  final TextEditingController _currentPasswordController =
      TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool _obscureCurrentPassword = true;
  bool _obscureNewPassword = true;
  bool _obscureConfirmPassword = true;

  @override
  void dispose() {
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          const BackgroundWidget(image: AssetImagesPath.authBackground),
          SafeArea(
            child: Column(
              children: [
                // --- Custom Header ---
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 12.0,
                  ),
                  child: Row(
                    children: [
                      // Back Button
                      GestureDetector(
                        onTap: () => Navigator.of(context).pop(),
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.white, // lighter grey/white
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.grey.shade200),
                          ),
                          child: const Icon(
                            Icons.arrow_back,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),

                      // Language/Country Flag Pill
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 4,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.grey.shade200),
                        ),
                        child: Row(
                          children: [
                            const CircleAvatar(
                              radius: 10,
                              backgroundColor: Colors.transparent,
                              backgroundImage: NetworkImage(
                                'https://flagcdn.com/w40/eg.png',
                              ), // Placeholder for Egypt flag
                            ),
                            const SizedBox(width: 6),
                            Text(
                              'AR',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blueGrey.shade800,
                                fontSize: 12,
                              ),
                            ),
                            const SizedBox(width: 8),
                          ],
                        ),
                      ),

                      // Centered Title
                      Expanded(
                        child: Center(
                          child: Text(
                            'كلمة المرور',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: Colors.blueGrey.shade900,
                            ),
                          ),
                        ),
                      ),

                      // Profile Icon (Right side)
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.person_outline,
                          color: primaryDarkRed,
                        ),
                      ),
                    ],
                  ),
                ),

                // --- Scrollable Body ---
                Expanded(
                  child: BlocConsumer<ProfileBloc, ProfileState>(
                    listener: (context, state) {
                      if (state.updatePasswordState == RequestState.loaded) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              state.updatePasswordResponse.msg ??
                                  'تم تحديث كلمة المرور بنجاح',
                              style: const TextStyle(color: Colors.white),
                            ),
                            backgroundColor: Colors.green,
                            duration: const Duration(seconds: 3),
                          ),
                        );
                        // Clear fields and go back
                        _currentPasswordController.clear();
                        _newPasswordController.clear();
                        _confirmPasswordController.clear();
                        Navigator.of(context).pop();
                      } else if (state.updatePasswordState ==
                          RequestState.error) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              state.updatePasswordResponse.msg ??
                                  'حدث خطأ في تحديث كلمة المرور',
                              style: const TextStyle(color: Colors.white),
                            ),
                            backgroundColor: Colors.red,
                            duration: const Duration(seconds: 3),
                          ),
                        );
                      }
                    },
                    builder: (context, state) {
                      final isLoading =
                          state.updatePasswordState == RequestState.loading;

                      return SingleChildScrollView(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            // First Card: Form Inputs
                            Container(
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.03),
                                    blurRadius: 10,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _buildLabeledInput(
                                    label: 'كلمة المرور الحالية',
                                    hint: 'أدخل كلمة المرور الحالية',
                                    controller: _currentPasswordController,
                                    isPassword: true,
                                    obscureText: _obscureCurrentPassword,
                                    onToggleVisibility: () {
                                      setState(() {
                                        _obscureCurrentPassword =
                                            !_obscureCurrentPassword;
                                      });
                                    },
                                  ),
                                  const SizedBox(height: 16),

                                  _buildLabeledInput(
                                    label: 'كلمة المرور الجديدة',
                                    hint: 'أدخل كلمة المرور الجديدة',
                                    controller: _newPasswordController,
                                    isPassword: true,
                                    obscureText: _obscureNewPassword,
                                    onToggleVisibility: () {
                                      setState(() {
                                        _obscureNewPassword =
                                            !_obscureNewPassword;
                                      });
                                    },
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      top: 8.0,
                                      right: 4.0,
                                    ),
                                    child: Text(
                                      'يجب أن تحتوي كلمة المرور على 8 أحرف على الأقل',
                                      style: TextStyle(
                                        color: Colors.grey.shade400,
                                        fontSize: 11,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 16),

                                  _buildLabeledInput(
                                    label: 'تأكيد كلمة المرور الجديدة',
                                    hint: 'أعد إدخال كلمة المرور الجديدة',
                                    controller: _confirmPasswordController,
                                    isPassword: true,
                                    obscureText: _obscureConfirmPassword,
                                    onToggleVisibility: () {
                                      setState(() {
                                        _obscureConfirmPassword =
                                            !_obscureConfirmPassword;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),

                            const SizedBox(height: 16),

                            // Second Card: Tips
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.03),
                                    blurRadius: 10,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'نصائح لكلمة مرور قوية',
                                    style: TextStyle(
                                      color: primaryDarkRed,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  _buildTipItem('استخدم 8 أحرف على الأقل'),
                                  _buildTipItem(
                                    'اجمع بين الأحرف الكبيرة والصغيرة',
                                  ),
                                  _buildTipItem('أضف أرقاماً ورموزاً خاصة'),
                                  _buildTipItem(
                                    'تجنب المعلومات الشخصية الواضحة',
                                  ),
                                ],
                              ),
                            ),

                            const SizedBox(height: 24),

                            // Action Button
                            SizedBox(
                              width: double.infinity,
                              height: 55,
                              child: ElevatedButton(
                                onPressed: isLoading
                                    ? null
                                    : () {
                                        // Validation
                                        if (_currentPasswordController
                                            .text
                                            .isEmpty) {
                                          ScaffoldMessenger.of(
                                            context,
                                          ).showSnackBar(
                                            const SnackBar(
                                              content: Text(
                                                'يرجى إدخال كلمة المرور الحالية',
                                              ),
                                              backgroundColor: Colors.red,
                                            ),
                                          );
                                          return;
                                        }

                                        if (_newPasswordController
                                                .text
                                                .isEmpty ||
                                            _newPasswordController.text.length <
                                                8) {
                                          ScaffoldMessenger.of(
                                            context,
                                          ).showSnackBar(
                                            const SnackBar(
                                              content: Text(
                                                'كلمة المرور الجديدة يجب أن تكون 8 أحرف على الأقل',
                                              ),
                                              backgroundColor: Colors.red,
                                            ),
                                          );
                                          return;
                                        }

                                        if (_newPasswordController.text !=
                                            _confirmPasswordController.text) {
                                          ScaffoldMessenger.of(
                                            context,
                                          ).showSnackBar(
                                            const SnackBar(
                                              content: Text(
                                                'كلمة المرور الجديدة وتأكيدها غير متطابقين',
                                              ),
                                              backgroundColor: Colors.red,
                                            ),
                                          );
                                          return;
                                        }

                                        // Trigger update password event
                                        ProfileBloc.get(context).add(
                                          UpdatePasswordEvent(
                                            UpdatePasswordParams(
                                              currentPassword:
                                                  _currentPasswordController
                                                      .text,
                                              newPassword:
                                                  _newPasswordController.text,
                                              confirmPassword:
                                                  _confirmPasswordController
                                                      .text,
                                            ),
                                          ),
                                        );
                                      },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: primaryDarkRed,
                                  foregroundColor: Colors.white,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  disabledBackgroundColor: Colors.grey,
                                ),
                                child: isLoading
                                    ? const SizedBox(
                                        width: 20,
                                        height: 20,
                                        child: CircularProgressIndicator(
                                          strokeWidth: 2,
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                                Colors.white,
                                              ),
                                        ),
                                      )
                                    : const Text(
                                        'حفظ كلمة المرور الجديدة',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                              ),
                            ),
                            const SizedBox(height: 20),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),

      // --- Bottom Navigation Bar ---
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          backgroundColor: Colors.white,
          selectedItemColor: primaryDarkRed,
          unselectedItemColor: Colors.grey.shade400,
          selectedLabelStyle: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: primaryDarkRed,
          ),
          unselectedLabelStyle: const TextStyle(fontSize: 12),
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'الرحلات',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications_outlined),
              label: 'الإشعارات',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'البروفايل',
            ),
          ],
        ),
      ),
    );
  }

  // --- Helper Widgets ---

  Widget _buildLabeledInput({
    required String label,
    required String hint,
    required TextEditingController controller,
    bool isPassword = false,
    bool obscureText = false,
    VoidCallback? onToggleVisibility,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: primaryDarkRed,
            fontWeight: FontWeight.w600,
            fontSize: 13,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          height: 50,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: TextField(
                    controller: controller,
                    obscureText: obscureText,
                    textAlign: TextAlign.right, // RTL alignment
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: hint,
                      hintStyle: TextStyle(
                        color: Colors.grey.shade400,
                        fontSize: 14,
                      ),
                      contentPadding: const EdgeInsets.only(bottom: 4),
                    ),
                  ),
                ),
              ),
              if (isPassword && onToggleVisibility != null)
                GestureDetector(
                  onTap: onToggleVisibility,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: Icon(
                      obscureText
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      color: primaryDarkRed,
                      size: 22,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTipItem(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          // Square Bullet
          Container(
            width: 4,
            height: 4,
            decoration: BoxDecoration(color: primaryDarkRed),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                color: Colors.blueGrey.shade700,
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
