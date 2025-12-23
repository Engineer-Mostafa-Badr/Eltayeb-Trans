import 'package:eltyp_delivery/core/components/images/custom_asset_svg_image.dart';
import 'package:eltyp_delivery/core/res/app_images.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? leading;
  final Widget? title;
  final List<Widget>? actions;
  final Color backgroundColor;
  final double elevation;
  final bool centerTitle;
  final double toolbarHeight;
  final Widget? flexibleSpace;

  const CustomAppBar({
    super.key,
    this.leading,
    this.title,
    this.actions,
    this.backgroundColor = Colors.white,
    this.elevation = 0,
    this.centerTitle = false,
    this.toolbarHeight = kToolbarHeight,
    this.flexibleSpace,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: leading,
      title: title,
      actions: actions,
      backgroundColor: backgroundColor,
      elevation: elevation,
      centerTitle: centerTitle,
      toolbarHeight: toolbarHeight,
      flexibleSpace: flexibleSpace,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(toolbarHeight);
}

class RepresentativeAppBar extends StatelessWidget {
  final VoidCallback? onNotificationTap;
  final VoidCallback? onProfileTap;
  final int notificationCount;
  final String languageCode;
  final String flagAssetPath;

  const RepresentativeAppBar({
    super.key,
    this.onNotificationTap,
    this.onProfileTap,
    this.notificationCount = 0,
    this.languageCode = 'AR',
    this.flagAssetPath = 'assets/images/svg/egypt_flag.svg',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: SafeArea(
        bottom: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Left: Notification Icon
            GestureDetector(
              onTap: onNotificationTap,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.transparent,
                    ),
                    child: const Icon(
                      Icons.notifications_none_outlined,
                      size: 28,
                      color: Color(0xFF4A0000),
                    ),
                  ),
                  if (notificationCount > 0)
                    Positioned(
                      right: -2,
                      top: -2,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                          color: Color(0xFF9B1B1B),
                          shape: BoxShape.circle,
                        ),
                        constraints: const BoxConstraints(
                          minWidth: 18,
                          minHeight: 18,
                        ),
                        child: Center(
                          child: Text(
                            notificationCount > 9
                                ? '9+'
                                : notificationCount.toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            // Center: Logo and Language
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Language and Flag
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        languageCode,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Color(0xFF4A0000),
                        ),
                      ),
                      const SizedBox(width: 6),
                      // Egypt Flag - using SVG or fallback to icon
                      if (flagAssetPath.contains('.svg'))
                        CustomAssetSvgImage(
                          flagAssetPath,
                          width: 24,
                          height: 24,
                        )
                      else
                        Container(
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.red,
                            border: Border.all(color: Colors.white),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(width: 16),
                  // Logo
                  Image.asset(
                    AssetImagesPath.appLogo,
                    height: 40,
                    errorBuilder: (context, error, stackTrace) => const Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'ELTAYEBO',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Color(0xFF4A0000),
                          ),
                        ),
                        Text(
                          'Transport services',
                          style: TextStyle(fontSize: 10, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Right: Profile Icon
            GestureDetector(
              onTap: onProfileTap,
              child: Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFF2F2F2),
                ),
                child: const Icon(
                  Icons.person_outline,
                  color: Color(0xFF4A0000),
                  size: 24,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
