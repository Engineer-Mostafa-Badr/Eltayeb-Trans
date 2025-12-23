import 'package:eltyp_delivery/core/components/scaffold/shared_home_scaffold.dart';
import '../../../../core/components/images/custom_asset_svg_image.dart';
import '../../../../core/components/widgets/custom_app_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../config/themes/colors.dart';
import '../../../../core/res/app_images.dart';
import 'package:flutter/material.dart';
import 'governorate_selector.dart';

class TripsAppBar extends StatefulWidget implements PreferredSizeWidget {
  final bool isRepresentative;

  const TripsAppBar({super.key, this.isRepresentative = false});

  @override
  State<TripsAppBar> createState() => _TripsAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(72.h);
}

class _TripsAppBarState extends State<TripsAppBar> {
  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      toolbarHeight: 72.h,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.08),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        child: Stack(
          children: [
            // Logo in center (absolute position)
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 35),
                child: Image.asset(AssetImagesPath.appLogo, height: 55.h),
              ),
            ),
            // Left and right sides with balanced layout
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: 8.h),
                child: Row(
                  children: [
                    // Left side: Profile icon + Governorate selection dropdown
                    Expanded(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            child: CircleAvatar(
                              radius: 22.r,
                              backgroundColor: widget.isRepresentative
                                  ? Colors.grey[300]
                                  : Colors.white,
                              child: CustomAssetSvgImage(
                                widget.isRepresentative
                                    ? AssetImagesPath.profile
                                    : AssetImagesPath.PersonIconSvg,
                                color: widget.isRepresentative
                                    ? AppColors.cPrimary
                                    : Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(width: 8.w),
                          const GovernorateSelector(),
                        ],
                      ),
                    ),

                    // Spacer to push right side to the end
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const LanguageSwitcherRow(text: 'AR'),
                          SizedBox(width: 12.w),
                          CircleAvatar(
                            backgroundColor: AppColors.cPinColor,
                            radius: 20.r,
                            child: CustomAssetSvgImage(
                              AssetImagesPath.notification,
                              color: AppColors.cPrimary,
                              height: 18.h,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Keep the function for backward compatibility
PreferredSizeWidget tripsAppBar({bool isRepresentative = false}) {
  return TripsAppBar(isRepresentative: isRepresentative);
}
