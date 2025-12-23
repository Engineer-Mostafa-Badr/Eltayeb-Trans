import 'package:eltyp_delivery/core/components/images/custom_asset_svg_image.dart';
import 'package:eltyp_delivery/core/res/app_images.dart';
import 'package:flutter/material.dart';

class ChangeDriverHeader extends StatelessWidget {
  const ChangeDriverHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: Row(
            children: [
              _buildBackButton(context),
              const SizedBox(width: 12),
              _buildLanguageFlag(),
              const Expanded(
                child: Center(
                  child: Text(
                    'تغيير السائق',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1A1A1A),
                    ),
                  ),
                ),
              ),
              _buildProfileIcon(),
            ],
          ),
        ),
        const Divider(
          height: 1,
          thickness: 1,
          color: Color(0xFFEEEEEE),
        ),
      ],
    );
  }

  Widget _buildBackButton(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: IconButton(
        icon: const CustomAssetSvgImage(
          AssetImagesPath.IconSvg,
          width: 24,
          height: 24,
          color: Colors.black87,
        ),
        onPressed: () => Navigator.of(context).pop(),
        padding: EdgeInsets.zero,
        constraints: const BoxConstraints(),
      ),
    );
  }

  Widget _buildLanguageFlag() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 12,
            backgroundColor: Colors.transparent,
            backgroundImage: NetworkImage('https://flagcdn.com/w40/eg.png'),
          ),
          const SizedBox(width: 6),
          Text(
            'AR',
            style: TextStyle(
              color: Colors.grey[800],
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileIcon() {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0xFFF5F5F5),
      ),
      child: const Icon(
        Icons.person_outline,
        color: Color(0xFF5D0000),
      ),
    );
  }
}

