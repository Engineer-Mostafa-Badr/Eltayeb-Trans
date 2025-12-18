import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eltyp_delivery/core/components/utils/widgets.dart';
import 'package:eltyp_delivery/core/res/app_images.dart';

class BackIconButton extends StatelessWidget {
  const BackIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        if (Navigator.of(context).canPop()) Navigator.of(context).pop();
      },
      icon:  AssetSvgImage(AssetImagesPath.backButtonSVG,height: 55.h,),
    );
  }
}
