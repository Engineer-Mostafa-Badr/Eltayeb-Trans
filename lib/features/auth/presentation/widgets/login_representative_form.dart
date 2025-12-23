import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../config/themes/colors.dart';
import '../../../../core/components/widgets/custom_elevated_button.dart';
import '../../../../core/components/widgets/custom_text_field.dart';
import '../../../../core/enum/enums.dart';
import '../../../../core/res/app_images.dart';
import '../bloc/login/login_bloc.dart';
import '../../domain/entities/login_representative_params.dart';

class LoginRepresentativeForm extends StatefulWidget {
  const LoginRepresentativeForm({super.key});

  @override
  State<LoginRepresentativeForm> createState() =>
      _LoginRepresentativeFormState();
}

class _LoginRepresentativeFormState extends State<LoginRepresentativeForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleLogin() {
    if (_formKey.currentState!.validate()) {
      context.read<LoginBloc>().add(
            LoginRepresentativeButtonPressedEvent(
              LoginrepresentativeParameters(
                email: _emailController.text.trim(),
                password: _passwordController.text,
              ),
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) =>
          previous.representativeLoginRequestState !=
          current.representativeLoginRequestState,
      builder: (context, state) {
        final isLoading =
            state.representativeLoginRequestState == RequestState.loading;

        return Form(
          key: _formKey,
          child: Column(
            children: [
              _buildEmailField(size),
              SizedBox(height: size.height * 0.025),
              _buildPasswordField(size),
              SizedBox(height: size.height * 0.03),
              _buildLoginButton(isLoading),
              SizedBox(height: size.height * 0.05),
            ],
          ),
        );
      },
    );
  }

  Widget _buildEmailField(Size size) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
        CustomTextField(
          controller: _emailController,
          hintText: 'أدخل البريد الإلكتروني',
          svgIconPath: AssetImagesPath.PersonIconSvg,
          textDirection: TextDirection.rtl,
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          style: const TextStyle(
            color: Colors.black,
            fontFamily: 'Cairo',
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'البريد الإلكتروني مطلوب';
            }
            if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
              return 'البريد الإلكتروني غير صحيح';
            }
            return null;
          },
        ),
      ],
    );
  }

  Widget _buildPasswordField(Size size) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
        CustomTextField(
          controller: _passwordController,
          hintText: 'أدخل كلمة المرور',
          svgIconPath: AssetImagesPath.PasswordIconSvg,
          isPassword: true,
          textDirection: TextDirection.rtl,
          textInputAction: TextInputAction.done,
          style: const TextStyle(
            color: Colors.black,
            fontFamily: 'Cairo',
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'كلمة المرور مطلوبة';
            }
            if (value.length < 6) {
              return 'كلمة المرور يجب أن تكون 6 أحرف على الأقل';
            }
            return null;
          },
        ),
      ],
    );
  }

  Widget _buildLoginButton(bool isLoading) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    return CustomElevatedButton(
      text: 'تسجيل دخول',
      backgroundColor: AppColors.cIconLight,
      foregroundColor: Colors.white,
      minimumSize: const Size(double.infinity, 70),
      textStyle: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        fontFamily: 'Cairo',
      ),
      onPressed: _handleLogin,
    );
  }
}

