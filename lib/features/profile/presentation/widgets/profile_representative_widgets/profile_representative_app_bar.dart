import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../config/themes/colors.dart';
import '../../../../../config/themes/styles.dart';
import '../../../../../core/components/widgets/custom_app_bar.dart';
import '../../../../../core/extensions/widgets_extensions.dart';
import '../../../../../core/utils/app_sizes.dart';

class ProfileRepresentativeAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const ProfileRepresentativeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      backgroundColor: AppColors.greyF9Color,
      centerTitle: true,
      leading: Padding(
        padding: EdgeInsets.only(right: AppPadding.padding12.w),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildIconButton(
              icon: Icons.arrow_back,
              onPressed: () => Navigator.of(context).pop(),
            ),
            AppPadding.padding12.sizedWidth,
            _buildLanguageBadge(),
          ],
        ),
      ),
      title: Text(
        'الملف الشخصي',
        style: AppStyles.title700.copyWith(
          fontSize: AppFontSize.f18,
          color: AppColors.cDarkBlueColor,
        ),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(left: AppPadding.padding16.w),
          child: _buildIconButton(
            icon: Icons.person_outline,
            color: AppColors.cPrimary,
            backgroundColor: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget _buildIconButton({
    required IconData icon,
    VoidCallback? onPressed,
    Color? color,
    Color? backgroundColor,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.white,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: IconButton(
        icon: Icon(icon, color: color ?? AppColors.cDarkBlueColor, size: 20),
        onPressed: onPressed,
        padding: EdgeInsets.zero,
        constraints: const BoxConstraints(),
      ),
    );
  }

  Widget _buildLanguageBadge() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppPadding.padding8.w,
        vertical: AppPadding.padding4.h,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppBorderRadius.radius20.r),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('🇪🇬', style: TextStyle(fontSize: 16.sp)),
          AppPadding.padding4.sizedWidth,
          Text(
            'AR',
            style: AppStyles.title700.copyWith(
              fontSize: AppFontSize.f12,
              color: AppColors.cDarkBlueColor,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight.h);
}
