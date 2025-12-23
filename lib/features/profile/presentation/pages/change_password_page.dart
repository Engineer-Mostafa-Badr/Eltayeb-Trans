import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eltyp_delivery/core/enum/enums.dart';
import 'package:eltyp_delivery/core/components/scaffold/shared_home_scaffold.dart';
import 'package:eltyp_delivery/core/components/widgets/custom_elevated_button.dart';
import 'package:eltyp_delivery/core/components/widgets/custom_bottom_navigation_bar.dart';
import 'package:eltyp_delivery/core/utils/app_sizes.dart';
import 'package:eltyp_delivery/core/extensions/widgets_extensions.dart';
import 'package:eltyp_delivery/config/themes/colors.dart';
import 'package:eltyp_delivery/features/profile/domain/entities/update_password_params.dart';
import 'package:eltyp_delivery/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:eltyp_delivery/features/profile/presentation/widgets/password_widgets/password_form_card.dart';
import 'package:eltyp_delivery/features/profile/presentation/widgets/password_widgets/password_tips_card.dart';
import 'package:eltyp_delivery/features/profile/presentation/widgets/password_widgets/password_validator.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final _currentPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  int _selectedIndex = 2;

  @override
  void dispose() {
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _handlePasswordUpdate(BuildContext context, ProfileState state) {
    final error = PasswordValidator.validateForm(
      currentPassword: _currentPasswordController.text,
      newPassword: _newPasswordController.text,
      confirmPassword: _confirmPasswordController.text,
    );

    if (error != null) {
      _showErrorSnackBar(context, error);
      return;
    }

    ProfileBloc.get(context).add(
      UpdatePasswordEvent(
        UpdatePasswordParams(
          currentPassword: _currentPasswordController.text,
          newPassword: _newPasswordController.text,
          confirmPassword: _confirmPasswordController.text,
        ),
      ),
    );
  }

  void _showErrorSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: Colors.red),
    );
  }

  void _showSuccessSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.green,
        duration: const Duration(seconds: 3),
      ),
    );
  }

  void _clearFields() {
    _currentPasswordController.clear();
    _newPasswordController.clear();
    _confirmPasswordController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return SharedHomeScaffold(
      title: 'كلمة المرور',
      bottomNavigationBar: _buildBottomNavigationBar(),
      body: BlocConsumer<ProfileBloc, ProfileState>(
        listener: (context, state) {
          if (state.updatePasswordState == RequestState.loaded) {
            _showSuccessSnackBar(
              context,
              state.updatePasswordResponse.msg ?? 'تم تحديث كلمة المرور بنجاح',
            );
            _clearFields();
            Navigator.of(context).pop();
          } else if (state.updatePasswordState == RequestState.error) {
            _showErrorSnackBar(
              context,
              state.updatePasswordResponse.msg ??
                  'حدث خطأ في تحديث كلمة المرور',
            );
          }
        },
        builder: (context, state) {
          final isLoading = state.updatePasswordState == RequestState.loading;

          return SingleChildScrollView(
            padding: const EdgeInsets.all(AppPadding.padding16),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  PasswordFormCard(
                    currentPasswordController: _currentPasswordController,
                    newPasswordController: _newPasswordController,
                    confirmPasswordController: _confirmPasswordController,
                  ),
                  AppPadding.padding16.sizedHeight,
                  const PasswordTipsCard(),
                  AppPadding.padding24.sizedHeight,
                  _buildSubmitButton(context, state, isLoading),
                  AppPadding.padding20.sizedHeight,
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildSubmitButton(
    BuildContext context,
    ProfileState state,
    bool isLoading,
  ) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: CustomElevatedButton(
        onPressed: isLoading
            ? null
            : () => _handlePasswordUpdate(context, state),
        text: 'حفظ كلمة المرور الجديدة',
        backgroundColor: AppColors.cPrimary,
        foregroundColor: Colors.white,
        enabled: !isLoading,
        borderRadius: AppBorderRadius.radius16,
        textStyle: TextStyle(
          fontSize: AppFontSize.f16,
          fontWeight: FontWeight.bold,
        ),
        child: isLoading
            ? const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              )
            : null,
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            // ignore: deprecated_member_use
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: CustomBottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        backgroundColor: Colors.white,
        selectedItemColor: AppColors.cPrimary,
        unselectedItemColor: Colors.grey.shade400,
        selectedFontSize: AppFontSize.f12,
        unselectedFontSize: AppFontSize.f12,
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
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'البروفايل'),
        ],
      ),
    );
  }
}
