import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eltyp_delivery/config/themes/colors.dart';
import 'package:eltyp_delivery/config/themes/styles.dart';
import 'package:eltyp_delivery/core/components/images/avatar_with_edit_icon.dart';
import 'package:eltyp_delivery/core/components/utils/widgets.dart';
import 'package:eltyp_delivery/core/extensions/navigation_extensions.dart';
import 'package:eltyp_delivery/core/extensions/shared_extensions.dart';
import 'package:eltyp_delivery/core/extensions/widgets_extensions.dart';
import 'package:eltyp_delivery/core/res/app_images.dart';
import 'package:eltyp_delivery/core/utils/app_const.dart';
import 'package:eltyp_delivery/core/utils/app_sizes.dart';
import 'package:eltyp_delivery/features/home/presentation/bloc/trips_bloc.dart';
import 'package:eltyp_delivery/features/notifications/presentation/pages/notifications_representative_page.dart';
import 'package:eltyp_delivery/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:eltyp_delivery/features/profile/presentation/pages/profile_page.dart';

class SharedHomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SharedHomeAppBar({super.key, this.showBackButton = false});

  final bool showBackButton;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        final userModel = state.getProfileResponse.data;
        return AppBar(
          backgroundColor: Colors.transparent,
          leadingWidth: showBackButton && Navigator.canPop(context)
              ? null
              : 200.w,
          leading: showBackButton && Navigator.canPop(context)
              ? IconButton(
                  onPressed: () {
                    if (Navigator.canPop(context)) {
                      Navigator.pop(context);
                    }
                  },
                  icon: const AssetSvgImage(AssetImagesPath.backButtonSVG),
                )
              : Row(
                  children: [
                    AppPadding.mediumPadding.sizedWidth,
                    AvatarWithEditIcon(
                      imageUrl: AppConst.user?.image ?? userModel?.image,
                      containerSize: 46,
                      imageSize: 42,
                      padding: 4,
                      borderColor: AppColors.cPrimary,
                    ).addAction(
                      borderRadius: 100,
                      onTap: () {
                        context.navigateToPage(const ProfilePage());
                      },
                    ),
                    AppPadding.mediumPadding.sizedWidth,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Text(
                        //   'welcome'.isNowPM ? 'good_evening' : 'good_morning',
                        //   overflow: TextOverflow.ellipsis,
                        //   maxLines: 1,
                        //   style: AppStyles.title400.copyWith(
                        //     fontSize: AppFontSize.f13,
                        //   ),
                        // ).tr(),
                        Text(
                          // 'Welcome back',
                          (AppConst.user?.name ?? notSpecified).getFirstNWords(
                            2,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppStyles.title500,
                        ),
                      ],
                    ),
                  ],
                ),
          actions: [
            BlocBuilder<TripsBloc, TripsState>(
              builder: (context, state) {
                return Badge.count(
                  count: /*state.responseUtils.data?.unreadNotifications ??*/ 0,
                  backgroundColor: AppColors.cPrimary,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColors.cPrimary.withValues(alpha: 0.2),
                      ),
                    ),
                    child: const AssetSvgImage(AssetImagesPath.bellSVG),
                  ),
                ).addAction(
                  padding: EdgeInsetsDirectional.only(
                    end: AppPadding.mediumPadding.w,
                  ),
                  onTap: () {
                    TripsBloc.get(
                      context,
                    ).add(const MakeCounterNotificationZeroEvent());
                    context.navigateToPage(
                      const NotificationsRepresentativePage(),
                    );
                  },
                );
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight.h);
}
