import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/components/buttons/outlined_button.dart';
import '../../../../../core/components/utils/custom_rounded_container.dart';
import '../../../../../core/extensions/navigation_extensions.dart';
import '../../../../../core/utils/app_sizes.dart';
import '../../../../../config/themes/styles.dart';
import '../../pages/truck_details_page.dart';

class TruckInfoCard extends StatelessWidget {
  const TruckInfoCard({
    super.key,
    required this.truckNumber,
  });

  final String truckNumber;

  @override
  Widget build(BuildContext context) {
    return CustomRoundedContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'الشاحنة الحالية:',
            style: AppStyles.title700.copyWith(
              fontSize: AppFontSize.f16,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 12.h),
          Text(
            truckNumber,
            style: AppStyles.title600.copyWith(
              fontSize: AppFontSize.f15,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 16.h),
          ReusedOutlinedButton(
            text: 'select_truck',
            onPressed: () {
              context.navigateToPageWithClearStack(const TruckDetailsPage());
            },
            height: 40,
          ),
        ],
      ),
    );
  }
}
