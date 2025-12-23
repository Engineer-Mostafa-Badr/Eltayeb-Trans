import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/components/images/custom_asset_svg_image.dart';
import '../../../../../core/components/widgets/custom_app_bar.dart';
import '../../../../../core/res/app_images.dart';

class TripDetailsAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TripDetailsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      leading: Directionality(
        textDirection: ui.TextDirection.ltr,
        child: IconButton(
          icon: const CustomAssetSvgImage(
            AssetImagesPath.IconSvg,
            width: 24,
            height: 24,
            color: Colors.black,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      title: const Text(
        'تفاصيل الرحلة',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w700,
          color: Color(0xFF101828),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.transparent),
                ),
                child: Row(
                  children: [
                    ClipOval(
                      child: Container(
                        width: 20,
                        height: 20,
                        color: Colors.white,
                        alignment: Alignment.center,
                        child: const Text(
                          '🇪🇬',
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                    ),
                    const SizedBox(width: 6),
                    const Text(
                      'AR',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF101828),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              Container(
                width: 44,
                height: 44,
                decoration: const BoxDecoration(
                  color: Color(0xFFF2F4F7),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.person_outline,
                  color: Color(0xFF6D1B1B),
                  size: 22,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight.h);
}
