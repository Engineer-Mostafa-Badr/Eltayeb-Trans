import 'package:flutter/material.dart';
import 'package:eltyp_delivery/core/res/app_images.dart';
import 'package:eltyp_delivery/config/themes/colors.dart';
import 'circle_icon_button.dart';

class CustodyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustodyAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Stack(
        alignment: Alignment.center,
        children: [
          const Text(
            'إضافة عهدة',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: AppColors.cCustodyTextDarkBlue,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Directionality(
                    textDirection: TextDirection.ltr,
                    child: CircleIconButton(
                      svgPath: AssetImagesPath.IconSvg,
                      iconSize: 22,
                      color: Colors.black,
                      onTap: () => Navigator.of(context).pop(),
                    ),
                  ),
                  const SizedBox(width: 12),
                  _buildLanguageSelector(),
                ],
              ),
              CircleIconButton(
                icon: Icons.person_outline,
                iconSize: 22,
                color: AppColors.cCustodyTextRed,
                backgroundColor: AppColors.cCustodyButtonBg,
                onTap: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLanguageSelector() {
    return Container(
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
              child: const Text('🇪🇬', style: TextStyle(fontSize: 14)),
            ),
          ),
          const SizedBox(width: 6),
          const Text(
            'AR',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.cCustodyTextDarkBlue,
            ),
          ),
        ],
      ),
    );
  }
}
