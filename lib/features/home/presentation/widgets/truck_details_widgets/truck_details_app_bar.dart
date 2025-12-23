import 'package:eltyp_delivery/core/components/images/custom_asset_svg_image.dart';
import 'package:eltyp_delivery/core/components/widgets/custom_app_bar.dart';
import 'package:eltyp_delivery/core/res/app_images.dart';
import 'package:flutter/material.dart';

class TruckDetailsAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TruckDetailsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      toolbarHeight: kToolbarHeight,
      leading: Directionality(
        textDirection: TextDirection.ltr,
        child: Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFFEEEEEE),
          ),
          child: IconButton(
            icon: const CustomAssetSvgImage(
              AssetImagesPath.IconSvg,
              width: 24,
              height: 24,
              color: Colors.black87,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
      ),
      title: const Text(
        'تفاصيل الشاحنة',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: Row(
            children: [
              _buildLanguageBadge(),
              const SizedBox(width: 12),
              _buildProfileIcon(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildLanguageBadge() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: const Row(
        children: [
          Text('🇪🇬', style: TextStyle(fontSize: 16)),
          SizedBox(width: 4),
          Text(
            'AR',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileIcon() {
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0xFFF5F5F5),
      ),
      padding: const EdgeInsets.all(8),
      child: const Icon(Icons.person_outline, color: Colors.brown),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

