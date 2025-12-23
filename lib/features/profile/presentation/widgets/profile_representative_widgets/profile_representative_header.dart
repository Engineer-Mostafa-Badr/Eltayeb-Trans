import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../config/themes/colors.dart';
import '../../../../../config/themes/styles.dart';
import '../../../../../core/components/utils/custom_rounded_container.dart';
import '../../../../../core/extensions/widgets_extensions.dart';
import '../../../../../core/utils/app_sizes.dart';
import '../../../../auth/data/models/user_model.dart';

class ProfileRepresentativeHeader extends StatelessWidget {
  final UserModel userData;

  const ProfileRepresentativeHeader({
    super.key,
    required this.userData,
  });

  @override
  Widget build(BuildContext context) {
    return CustomRoundedContainer(
      padding: EdgeInsets.all(AppPadding.padding24.r),
      child: Column(
        children: [
          _buildAvatar(),
          AppPadding.padding16.sizedHeight,
          _buildName(),
          AppPadding.padding8.sizedHeight,
          _buildRole(),
        ],
      ),
    );
  }

  Widget _buildAvatar() {
    return Container(
      width: 80.r,
      height: 80.r,
      decoration: BoxDecoration(
        color: AppColors.cPrimary,
        shape: BoxShape.circle,
        image: userData.image.isNotEmpty
            ? DecorationImage(
                image: NetworkImage(userData.image),
                fit: BoxFit.cover,
              )
            : null,
      ),
      child: userData.image.isEmpty
          ? Icon(
              Icons.person_outline,
              color: Colors.white,
              size: 40.r,
            )
          : null,
    );
  }

  Widget _buildName() {
    return Text(
      userData.name.isNotEmpty ? userData.name : 'غير محدد',
      style: AppStyles.title700.copyWith(
        fontSize: AppFontSize.f18,
        color: AppColors.cDarkBlueColor,
      ),
    );
  }

  Widget _buildRole() {
    return Text(
      'مندوب',
      style: AppStyles.subtitle500.copyWith(
        fontSize: AppFontSize.f14,
        color: AppColors.cTextSubtitleLight,
      ),
    );
  }
}

