import 'package:flutter/material.dart';
import 'package:eltyp_delivery/config/themes/styles.dart';
import 'package:eltyp_delivery/core/utils/app_sizes.dart';

class ContainerForBottomNavButtons extends StatelessWidget {
  const ContainerForBottomNavButtons({
    super.key,
    required this.child,
    this.isBottomNavVisible = true,
    this.isBottomNavigatorSheet = false,
    this.padding,
    this.border,
  });

  final Widget child;
  final bool isBottomNavVisible;
  final bool isBottomNavigatorSheet;
  final EdgeInsetsGeometry? padding;
  final BoxBorder? border;

  @override
  Widget build(BuildContext context) {
    return !isBottomNavVisible
        ? child
        : Container(
            padding:
                padding ??
                EdgeInsetsDirectional.only(
                  start: AppPadding.mediumPadding,
                  end: AppPadding.mediumPadding,
                  top: AppPadding.mediumPadding,
                  bottom: isBottomNavigatorSheet
                      ? AppPadding.largePadding
                      : AppPadding.bottomSheetPadding(context),
                ),
            decoration: BoxDecoration(
              border: border,
              // borderRadius: BorderRadius.vertical(
              //   top: Radius.circular(AppBorderRadius.radius24),
              // ),
              boxShadow: AppStyles.secondUsedBoxShadow(),
            ),
            child: child,
          );
  }
}
