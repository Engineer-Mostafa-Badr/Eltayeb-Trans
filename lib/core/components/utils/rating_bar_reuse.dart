import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eltyp_delivery/config/themes/colors.dart';
import 'package:eltyp_delivery/core/components/utils/widgets.dart';
import 'package:eltyp_delivery/core/res/app_images.dart';
import 'package:eltyp_delivery/core/utils/app_sizes.dart';

class RatingBarReuse extends StatelessWidget {
  const RatingBarReuse({
    super.key,
    required this.rating,
    this.onRatingUpdate,
    this.itemPadding = AppPadding.padding4,
    this.size = 18,
    this.itemCount = 5,
    this.color = AppColors.cRate,
  });

  final double rating;
  final double size;
  final double itemPadding;
  final ValueChanged<double>? onRatingUpdate;
  final int itemCount;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      initialRating: rating,
      allowHalfRating: true,
      itemSize: size.sp,
      minRating: .5,
      glowColor: AppColors.cRate,
      textDirection: TextDirection.ltr,
      itemCount: itemCount,
      itemPadding: EdgeInsets.symmetric(horizontal: itemPadding),
      itemBuilder: (context, index) =>
          AssetSvgImage(AssetImagesPath.starSVG, color: color),
      unratedColor: color.withValues(alpha: .5),
      onRatingUpdate: onRatingUpdate ?? (double value) {},
      ignoreGestures: onRatingUpdate == null,
    );
  }
}
