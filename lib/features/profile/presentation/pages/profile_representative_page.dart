import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eltyp_delivery/core/enum/enums.dart';
import 'package:eltyp_delivery/features/auth/data/models/user_model.dart';
import 'package:eltyp_delivery/features/profile/presentation/bloc/profile_bloc.dart';
// import 'package:eltyp_delivery/features/profile/domain/entities/update_profile_params.dart'; // Commented until edit functionality is implemented
import 'package:eltyp_delivery/features/profile/presentation/pages/change_password_page.dart';

class ProfileRepresentativePage extends StatefulWidget {
  const ProfileRepresentativePage({super.key});

  @override
  State<ProfileRepresentativePage> createState() =>
      _ProfileRepresentativePageState();
}

class _ProfileRepresentativePageState extends State<ProfileRepresentativePage> {
  final TextEditingController _phoneController = TextEditingController();
  String? _lastLoadedPhone;

  @override
  void initState() {
    super.initState();
    // Load employee profile when page opens
    ProfileBloc.get(context).add(const GetEmployeeProfileEvent());
  }

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  // Color Palette
  static const Color kPrimaryRed = Color(0xFF640005);
  static const Color kDarkBlue = Color(0xFF1D2B45);
  static const Color kGreyText = Color(0xFF667085);
  static const Color kBorderColor = Color(0xFFE4E7EC);
  static const Color kBgColor = Color(0xFFF8F9FD);

  @override
  Widget build(BuildContext context) {
    // Using Directionality to force RTL layout for Arabic
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: kBgColor,
        body: SafeArea(
          child: BlocConsumer<ProfileBloc, ProfileState>(
            listener: (context, state) {
              if (state.getEmployeeProfileState == RequestState.error) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      state.getEmployeeProfileResponse.msg ??
                          'حدث خطأ في تحميل البيانات',
                      style: const TextStyle(color: Colors.white),
                    ),
                    backgroundColor: Colors.red,
                    duration: const Duration(seconds: 3),
                  ),
                );
              }

              // Handle update profile states
              if (state.updateProfileState == RequestState.loaded) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      state.updateProfileResponse.msg ??
                          'تم تحديث البيانات بنجاح',
                      style: const TextStyle(color: Colors.white),
                    ),
                    backgroundColor: Colors.green,
                    duration: const Duration(seconds: 3),
                  ),
                );
                // Refresh profile data after successful update
                ProfileBloc.get(context).add(const GetEmployeeProfileEvent());
              } else if (state.updateProfileState == RequestState.error) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      state.updateProfileResponse.msg ??
                          'حدث خطأ في تحديث البيانات',
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
                  state.getEmployeeProfileState == RequestState.loading;
              final hasError =
                  state.getEmployeeProfileState == RequestState.error;
              final userData = state.getEmployeeProfileResponse.data;

              // Update phone controller when data is loaded
              if (userData != null &&
                  state.getEmployeeProfileState == RequestState.loaded &&
                  _lastLoadedPhone != userData.phone) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  if (mounted) {
                    _phoneController.text = userData.phone;
                    _lastLoadedPhone = userData.phone;
                  }
                });
              }

              return Column(
                children: [
                  // 1. Custom App Bar
                  _buildAppBar(),

                  // 2. Scrollable Body
                  Expanded(
                    child: isLoading
                        ? const Center(child: CircularProgressIndicator())
                        : hasError || userData == null
                        ? Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.error_outline,
                                  size: 48,
                                  color: Colors.red,
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  state.getEmployeeProfileResponse.msg ??
                                      'حدث خطأ في تحميل البيانات',
                                  style: const TextStyle(color: kGreyText),
                                ),
                                const SizedBox(height: 16),
                                ElevatedButton(
                                  onPressed: () {
                                    ProfileBloc.get(
                                      context,
                                    ).add(const GetEmployeeProfileEvent());
                                  },
                                  child: const Text('إعادة المحاولة'),
                                ),
                              ],
                            ),
                          )
                        : SingleChildScrollView(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16.0,
                              vertical: 10,
                            ),
                            child: Column(
                              children: [
                                _buildProfileHeader(userData),
                                const SizedBox(height: 16),
                                _buildEditableInfoCard(userData),
                                const SizedBox(height: 16),
                                _buildGeneralInfoCard(userData),
                                const SizedBox(height: 24),
                                _buildActionButtons(state),
                                const SizedBox(height: 20),
                              ],
                            ),
                          ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      color: kBgColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Left Side: Back Arrow + Flag
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.grey.shade200),
                ),
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                    color: kDarkBlue,
                    size: 20,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
              ),
              const SizedBox(width: 12),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.grey.shade200),
                ),
                child: const Row(
                  children: [
                    Text('🇪🇬', style: TextStyle(fontSize: 16)),
                    SizedBox(width: 4),
                    Text(
                      'AR',
                      style: TextStyle(
                        color: kDarkBlue,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          // Center: Title
          const Text(
            'الملف الشخصي',
            style: TextStyle(
              color: kDarkBlue,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          // Right: Profile Icon placeholder
          Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              color: Colors.white, // Or faint grey
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.person_outline, color: kPrimaryRed),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileHeader(UserModel userData) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: _cardDecoration(),
      child: Column(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: kPrimaryRed,
              shape: BoxShape.circle,
              image: userData.image.isNotEmpty
                  ? DecorationImage(
                      image: NetworkImage(userData.image),
                      fit: BoxFit.cover,
                    )
                  : null,
            ),
            child: userData.image.isEmpty
                ? const Icon(
                    Icons.person_outline,
                    color: Colors.white,
                    size: 40,
                  )
                : null,
          ),
          const SizedBox(height: 16),
          Text(
            userData.name.isNotEmpty ? userData.name : 'غير محدد',
            style: const TextStyle(
              color: kDarkBlue,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const Text('مندوب', style: TextStyle(color: kGreyText, fontSize: 14)),
        ],
      ),
    );
  }

  Widget _buildEditableInfoCard(UserModel userData) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: _cardDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle('المعلومات القابلة للتعديل'),
          const SizedBox(height: 20),

          // Phone Label
          const Text(
            'رقم الموبايل',
            style: TextStyle(color: kGreyText, fontSize: 13),
          ),
          const SizedBox(height: 8),

          // Phone Input (Editable)
          TextField(
            controller: _phoneController,
            textAlign: TextAlign.left, // LTR number
            keyboardType: TextInputType.phone,
            style: const TextStyle(
              color: kDarkBlue,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 14,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: kBorderColor),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: kBorderColor),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: kPrimaryRed, width: 2),
              ),
            ),
          ),

          const SizedBox(height: 20),

          // Buttons
          _buildOutlineButton('تغيير الصورة الشخصية'),
          const SizedBox(height: 12),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const ChangePasswordPage(),
                ),
              );
            },
            child: _buildOutlineButton('تغيير كلمة المرور'),
          ),
        ],
      ),
    );
  }

  Widget _buildGeneralInfoCard(UserModel userData) {
    // Extract additional data from response if available
    // For now, using UserModel fields and showing "غير محدد" for missing fields
    final email = userData.email.isNotEmpty ? userData.email : 'غير محدد';

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: _cardDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle('المعلومات العامة'),
          const SizedBox(height: 20),

          _buildInfoRow('البريد الإلكتروني', email, isLtr: true),
          _buildDivider(),
          // Note: These fields might come from API response but not in UserModel
          // If API returns them, we'll need to extend UserModel or parse them from JSON
          _buildInfoRow('الفرع', 'غير محدد'),
          _buildDivider(),
          _buildInfoRow('القسم', 'غير محدد'),
          _buildDivider(),
          _buildInfoRow('المنصب', 'مندوب'),
          _buildDivider(),
          _buildInfoRow('رقم الهوية', 'غير محدد', isLtr: true),
          _buildDivider(),
          _buildInfoRow('تاريخ الانضمام', 'غير محدد'),
        ],
      ),
    );
  }

  Widget _buildActionButtons(ProfileState state) {
    final isUpdating = state.updateProfileState == RequestState.loading;
    // final userData = state.getEmployeeProfileResponse.data; // Commented until edit functionality is implemented

    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
            onPressed: null, // Disabled until edit functionality is implemented
            // isUpdating || userData == null
            //     ? null
            //     : () {
            //         // Get updated phone value
            //         final updatedPhone = _phoneController.text.trim();

            //         // Create update parameters
            //         final updateParams = UpdateProfileParams(
            //           phone: updatedPhone.isNotEmpty
            //               ? updatedPhone
            //               : userData.phone,
            //           name: userData.name,
            //           email: userData.email,
            //           image: userData.image,
            //         );

            //         // Trigger update event
            //         ProfileBloc.get(
            //           context,
            //         ).add(UpdateProfileEvent(updateParams));
            //       },
            style: ElevatedButton.styleFrom(
              backgroundColor: kPrimaryRed,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 0,
              disabledBackgroundColor: Colors.grey,
            ),
            child: isUpdating
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  )
                : const Text(
                    'حفظ التعديلات',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
          ),
        ),
        const SizedBox(height: 16),
        TextButton(
          onPressed: () {},
          child: const Text(
            'تسجيل الخروج',
            style: TextStyle(
              color: kDarkBlue,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  // --- Helper Widgets --
  Widget _buildOutlineButton(String text) {
    return Container(
      width: double.infinity,
      height: 48,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      alignment: Alignment.center,
      child: Text(
        text,
        style: const TextStyle(
          color: kPrimaryRed,
          fontWeight: FontWeight.w600,
          fontSize: 14,
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        color: kDarkBlue,
        fontSize: 15,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildInfoRow(String label, String value, {bool isLtr = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(color: kGreyText, fontSize: 12)),
          const SizedBox(height: 4),
          SizedBox(
            width: double.infinity,
            child: Text(
              value,
              textAlign: isLtr ? TextAlign.left : TextAlign.right,
              style: const TextStyle(color: kGreyText, fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return const SizedBox(height: 8);
    // The image doesn't show visible lines, just spacing.
    // If lines needed: return Divider(color: kBorderColor, thickness: 0.5);
  }

  BoxDecoration _cardDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.03),
          blurRadius: 10,
          offset: const Offset(0, 4),
        ),
      ],
    );
  }
}
