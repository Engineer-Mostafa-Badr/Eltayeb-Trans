import 'package:easy_localization/easy_localization.dart';
import 'package:eltyp_delivery/config/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/themes/styles.dart';
import '../../../../core/components/buttons/outlined_button.dart';
import '../../../../core/components/images/custom_asset_svg_image.dart';
import '../../../../core/components/scaffold/shared_home_scaffold.dart';
import '../../../../core/extensions/widgets_extensions.dart';
import '../../../../core/res/app_images.dart';
import '../../../../core/utils/app_sizes.dart';
import '../widgets/profile_widgets/account_info_card.dart';
import '../widgets/profile_widgets/profile_header_card.dart';
import '../widgets/profile_widgets/quick_actions_card.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SharedHomeScaffold(
      title: 'my_account',
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: AppPadding.padding30, vertical: AppPadding.padding16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const ProfileHeaderCard(),
            AppPadding.padding20.sizedHeight,
            const AccountInfoCard(),
            AppPadding.padding20.sizedHeight,
            const QuickActionsCard(),
            AppPadding.padding32.sizedHeight,
            ReusedOutlinedButton(
              height: 52.h,
              text: 'logout',
              rowWidget: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CustomAssetSvgImage(AssetImagesPath.exit),
                  10.sizedWidth,
                  Text(
                    'logout',
                    style: AppStyles.title700.copyWith(fontSize: AppFontSize.f18, color: AppColors.cPrimary),
                  ).tr(),
                ],
              ),
              onPressed: () {},
              color: Colors.white,
              fontSize: AppFontSize.f16,
            ),
            AppPadding.padding16.sizedHeight,
          ],
        ),
      ),
    );
  }
}
