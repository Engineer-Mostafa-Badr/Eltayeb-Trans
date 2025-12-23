import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../config/themes/colors.dart';
import '../../../../../config/themes/styles.dart';
import '../../../../../core/components/utils/custom_rounded_container.dart';
import '../../../../../core/components/widgets/custom_text_field.dart';
import '../../../../../core/extensions/widgets_extensions.dart';
import '../../../../../core/utils/app_sizes.dart';
import '../../../../auth/data/models/user_model.dart';
import '../../../../auth/presentation/pages/change_password_page.dart';

class EditableInfoCard extends StatelessWidget {
  final UserModel userData;
  final TextEditingController phoneController;
  final VoidCallback? onImageChange;

  const EditableInfoCard({
    super.key,
    required this.userData,
    required this.phoneController,
    this.onImageChange,
  });

  @override
  Widget build(BuildContext context) {
    return CustomRoundedContainer(
      padding: EdgeInsets.all(AppPadding.padding20.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle('المعلومات القابلة للتعديل'),
          AppPadding.padding20.sizedHeight,
          _buildPhoneField(),
          AppPadding.padding20.sizedHeight,
          _buildActionButtons(context),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: AppStyles.title700.copyWith(
        fontSize: AppFontSize.f15,
        color: AppColors.cDarkBlueColor,
      ),
    );
  }

  Widget _buildPhoneField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'رقم الموبايل',
          style: AppStyles.subtitle500.copyWith(
            fontSize: AppFontSize.f13,
            color: AppColors.cTextSubtitleLight,
          ),
        ),
        AppPadding.padding8.sizedHeight,
        CustomTextField(
          controller: phoneController,
          textAlign: TextAlign.left,
          keyboardType: TextInputType.phone,
          style: AppStyles.title500.copyWith(
            fontSize: AppFontSize.f15,
            color: AppColors.cDarkBlueColor,
          ),
          borderColor: AppColors.cFillBorderLight,
          focusedBorderColor: AppColors.cPrimary,
          borderRadius: AppBorderRadius.radius12.r,
          contentPadding: EdgeInsets.symmetric(
            horizontal: AppPadding.padding16.w,
            vertical: AppPadding.padding14.h,
          ),
        ),
      ],
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Column(
      children: [
        _buildOutlineButton(text: 'تغيير الصورة الشخصية', onTap: onImageChange),
        AppPadding.padding12.sizedHeight,
        _buildOutlineButton(
          text: 'تغيير كلمة المرور',
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const ChangePasswordPage(),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildOutlineButton({required String text, VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 48.h,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade200),
          borderRadius: BorderRadius.circular(AppBorderRadius.radius12.r),
          color: Colors.white,
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: AppStyles.title600.copyWith(
            fontSize: AppFontSize.f14,
            color: AppColors.cPrimary,
          ),
        ),
      ),
    );
  }
}
