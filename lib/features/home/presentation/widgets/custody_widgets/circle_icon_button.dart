import 'package:flutter/material.dart';
import 'package:eltyp_delivery/core/components/images/custom_asset_svg_image.dart';

class CircleIconButton extends StatelessWidget {
  final IconData? icon;
  final String? svgPath;
  final double iconSize;
  final Color color;
  final Color backgroundColor;
  final Color borderColor;
  final VoidCallback? onTap;

  const CircleIconButton({
    super.key,
    this.icon,
    this.svgPath,
    required this.iconSize,
    required this.color,
    this.backgroundColor = Colors.white,
    this.borderColor = Colors.transparent,
    this.onTap,
  }) : assert(icon != null || svgPath != null, 'Either icon or svgPath must be provided');

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(22),
        child: Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: backgroundColor,
            shape: BoxShape.circle,
            border: Border.all(color: borderColor),
          ),
          child: svgPath != null
              ? Center(
                  child: CustomAssetSvgImage(
                    svgPath!,
                    width: iconSize,
                    height: iconSize,
                    color: color,
                  ),
                )
              : Icon(icon, size: iconSize, color: color),
        ),
      ),
    );
  }
}

