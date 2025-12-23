import 'package:eltyp_delivery/core/extensions/widgets_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../config/themes/colors.dart';
import '../../../../../config/themes/styles.dart';
import '../../../../../core/components/widgets/custom_elevated_button.dart';
import '../../../../../core/utils/app_sizes.dart';
import '../../bloc/profile_bloc.dart';

class ProfileRepresentativeErrorWidget extends StatelessWidget {
  final String? errorMessage;
  final VoidCallback? onRetry;

  const ProfileRepresentativeErrorWidget({
    super.key,
    this.errorMessage,
    this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error_outline, size: 48.r, color: AppColors.cError),
          AppPadding.padding16.sizedHeight,
          Text(
            errorMessage ?? 'حدث خطأ في تحميل البيانات',
            style: AppStyles.subtitle500.copyWith(
              fontSize: AppFontSize.f14,
              color: AppColors.cTextSubtitleLight,
            ),
            textAlign: TextAlign.center,
          ),
          AppPadding.padding16.sizedHeight,
          CustomElevatedButton(
            onPressed:
                onRetry ??
                () {
                  ProfileBloc.get(context).add(const GetEmployeeProfileEvent());
                },
            text: 'إعادة المحاولة',
            backgroundColor: AppColors.cPrimary,
            foregroundColor: Colors.white,
            borderRadius: AppBorderRadius.radius12.r,
          ),
        ],
      ),
    );
  }
}
