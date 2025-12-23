import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/components/buttons/outlined_button.dart';
import '../../../../../core/components/utils/custom_rounded_container.dart';
import '../../../../../core/extensions/navigation_extensions.dart';
import '../../../../../core/utils/app_sizes.dart';
import '../../../../../config/themes/styles.dart';
import '../../pages/change_driver_page.dart';

class DriverInfoCard extends StatelessWidget {
  const DriverInfoCard({
    super.key,
    required this.driverName,
  });

  final String driverName;

  @override
  Widget build(BuildContext context) {
    return CustomRoundedContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'السائق الحالي:',
            style: AppStyles.title700.copyWith(
              fontSize: AppFontSize.f16,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 12.h),
          Text(
            driverName,
            style: AppStyles.title600.copyWith(
              fontSize: AppFontSize.f15,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 16.h),
          ReusedOutlinedButton(
            text: 'select_driver',
            onPressed: () {
              context.navigateToPage(const ChangeDriverPage());
            },
            height: 40,
          ),
        ],
      ),
    );
  }
}
