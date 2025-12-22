import 'package:eltyp_delivery/core/extensions/navigation_extensions.dart';
import 'package:eltyp_delivery/features/injection_container.dart' as di;
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/login/login_bloc.dart';
import '../../../home/presentation/pages/trip_representative_page.dart';
import 'package:eltyp_delivery/core/components/widgets/custom_elevated_button.dart';
import 'package:eltyp_delivery/core/components/widgets/custom_text_field.dart';
import '../../../../config/themes/colors.dart';
import '../../../../core/res/app_images.dart';
import 'package:eltyp_delivery/core/enum/enums.dart';
import 'package:eltyp_delivery/features/auth/domain/entities/login_representative_params.dart';
import 'package:flutter/material.dart';

class LoginRepresentativePage extends StatefulWidget {
  const LoginRepresentativePage({super.key});

  @override
  State<LoginRepresentativePage> createState() =>
      _LoginRepresentativePageState();
}

class _LoginRepresentativePageState extends State<LoginRepresentativePage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BlocProvider(
      create: (context) => di.sl<LoginBloc>(),
      child: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state.representativeLoginRequestState == RequestState.loaded) {
            if (state.representativeLoginResponse.status == true) {
              context.navigateToPageWithClearStack(
                const TripsRepresentativePage(),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    state.representativeLoginResponse.msg ?? 'حدث خطأ',
                  ),
                  backgroundColor: Colors.red,
                ),
              );
            }
          } else if (state.representativeLoginRequestState ==
              RequestState.error) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  state.representativeLoginResponse.msg ?? 'حدث خطأ',
                ),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: AppColors.greyFAColor,
            body: SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.07),
                  child: Form(
                    key: _formKey,
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

                        CustomTextField(
                          controller: _emailController,
                          hintText: 'أدخل البريد الإلكتروني',
                          svgIconPath: AssetImagesPath.PersonIconSvg,
                          textDirection: TextDirection.rtl,
                          style: const TextStyle(
                            color: Colors.black,
                            fontFamily: 'Cairo',
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'البريد الإلكتروني مطلوب';
                            }
                            if (!RegExp(
                              r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                            ).hasMatch(value)) {
                              return 'البريد الإلكتروني غير صحيح';
                            }
                            return null;
                          },
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
                        CustomTextField(
                          controller: _passwordController,
                          hintText: 'أدخل كلمة المرور',
                          svgIconPath: AssetImagesPath.PasswordIconSvg,
                          isPassword: true,
                          textDirection: TextDirection.rtl,
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

                        SizedBox(height: size.height * 0.03),

                        /// LOGIN BUTTON
                        if (state.representativeLoginRequestState ==
                            RequestState.loading)
                          const Center(child: CircularProgressIndicator())
                        else
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
                            },
                          ),

                        SizedBox(height: size.height * 0.05),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
