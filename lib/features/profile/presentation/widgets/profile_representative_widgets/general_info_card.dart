import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../config/themes/colors.dart';
import '../../../../../config/themes/styles.dart';
import '../../../../../core/components/utils/custom_rounded_container.dart';
import '../../../../../core/extensions/widgets_extensions.dart';
import '../../../../../core/utils/app_sizes.dart';
import '../../../../auth/data/models/user_model.dart';

class GeneralInfoCard extends StatelessWidget {
  final UserModel userData;

  const GeneralInfoCard({
    super.key,
    required this.userData,
  });

  @override
  Widget build(BuildContext context) {
    return CustomRoundedContainer(
      padding: EdgeInsets.all(AppPadding.padding20.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle('المعلومات العامة'),
          AppPadding.padding20.sizedHeight,
          _buildInfoRow('البريد الإلكتروني', userData.email.isNotEmpty ? userData.email : 'غير محدد', isLtr: true),
          _buildDivider(),
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

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: AppStyles.title700.copyWith(
        fontSize: AppFontSize.f15,
        color: AppColors.cDarkBlueColor,
      ),
    );
  }

  Widget _buildInfoRow(String label, String value, {bool isLtr = false}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppPadding.padding8.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: AppStyles.subtitle500.copyWith(
              fontSize: AppFontSize.f12,
              color: AppColors.cTextSubtitleLight,
            ),
          ),
          AppPadding.padding4.sizedHeight,
          SizedBox(
            width: double.infinity,
            child: Text(
              value,
              textAlign: isLtr ? TextAlign.left : TextAlign.right,
              style: AppStyles.subtitle500.copyWith(
                fontSize: AppFontSize.f14,
                color: AppColors.cTextSubtitleLight,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return AppPadding.padding8.sizedHeight;
  }
}

