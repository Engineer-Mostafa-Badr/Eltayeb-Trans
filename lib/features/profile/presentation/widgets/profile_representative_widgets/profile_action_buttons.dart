import 'package:eltyp_delivery/core/extensions/widgets_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../config/themes/colors.dart';
import '../../../../../config/themes/styles.dart';
import '../../../../../core/components/buttons/outlined_button.dart';
import '../../../../../core/components/widgets/custom_elevated_button.dart';
import '../../../../../core/enum/enums.dart';
import '../../../../../core/utils/app_sizes.dart';
import '../../bloc/profile_bloc.dart';

class ProfileActionButtons extends StatelessWidget {
  final ProfileState state;
  final VoidCallback? onSave;
  final VoidCallback? onLogout;

  const ProfileActionButtons({
    super.key,
    required this.state,
    this.onSave,
    this.onLogout,
  });

  @override
  Widget build(BuildContext context) {
    final isUpdating = state.updateProfileState == RequestState.loading;

    return Column(
      children: [
        _buildSaveButton(context, isUpdating),
        AppPadding.padding16.sizedHeight,
        _buildLogoutButton(context),
      ],
    );
  }

  Widget _buildSaveButton(BuildContext context, bool isUpdating) {
    return SizedBox(
      width: double.infinity,
      height: 50.h,
      child: CustomElevatedButton(
        onPressed: onSave,
        enabled: onSave != null && !isUpdating,
        backgroundColor: AppColors.cPrimary,
        foregroundColor: Colors.white,
        borderRadius: AppBorderRadius.radius12.r,
        minimumSize: Size(double.infinity, 50.h),
        textStyle: AppStyles.title700.copyWith(
          fontSize: AppFontSize.f16,
          color: Colors.white,
        ),
        child: isUpdating
            ? SizedBox(
                width: 20.w,
                height: 20.h,
                child: const CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              )
            : Text(
                'حفظ التعديلات',
                style: AppStyles.title700.copyWith(
                  fontSize: AppFontSize.f16,
                  color: Colors.white,
                ),
              ),
      ),
    );
  }

  Widget _buildLogoutButton(BuildContext context) {
    return ReusedOutlinedButton(
      text: 'تسجيل الخروج',
      onPressed: onLogout ?? () {},
      textColor: AppColors.cDarkBlueColor,
      borderColor: Colors.transparent,
      height: 50.h,
      textStyle: AppStyles.title600.copyWith(
        fontSize: AppFontSize.f15,
        color: AppColors.cDarkBlueColor,
      ),
    );
  }
}
