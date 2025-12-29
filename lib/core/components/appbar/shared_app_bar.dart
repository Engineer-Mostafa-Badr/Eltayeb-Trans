import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:eltyp_delivery/config/themes/styles.dart';
import 'package:eltyp_delivery/core/components/widgets/custom_app_bar.dart';
import 'package:eltyp_delivery/core/utils/app_sizes.dart';
import 'package:eltyp_delivery/core/res/app_images.dart';
import 'package:flutter/material.dart';

class SharedAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SharedAppBar({
    super.key,
    required this.title,
    this.showBackButton = true,
    this.bottomWidget,
    this.appBarHeight = 70,
    this.actions = const [],
    this.haveShadow,
  });
  final bool? haveShadow;
  final String title;
  final bool showBackButton;
  final Widget? bottomWidget;
  final double appBarHeight;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: haveShadow == null
            ? AppStyles.secondUsedBoxShadow(opacity: 0.12)
            : null,
      ),
      child: CustomAppBar(
        toolbarHeight: appBarHeight.h,
        backgroundColor: Colors.transparent,
        leading: showBackButton
            ? Padding(
                padding: const EdgeInsets.only(right: 18.0),
                child: Image.asset(AssetImagesPath.appLogo),
              )
            : null,
        title: Padding(
          padding: EdgeInsets.only(right: showBackButton ? 0 : 16.w),
          child: Text(
            title,
            style: AppStyles.title700.copyWith(fontSize: AppFontSize.f20),
          ).tr(),
        ),
        actions: actions,
        flexibleSpace: bottomWidget != null
            ? Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 30.h),
                  child: bottomWidget,
                ),
              )
            : null,
      ),
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight((appBarHeight + (bottomWidget == null ? 0 : 30)).h);
}
