import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:eltyp_delivery/config/themes/colors.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key, this.fillRemaining});

  final bool? fillRemaining;

  @override
  Widget build(BuildContext context) {
    if (fillRemaining != null) {
      return SliverFillRemaining(
        hasScrollBody: false,
        child: Center(
          child: SizedBox(
            width: 25.r,
            height: 25.r,
            // child: const CircularProgressIndicator.adaptive(),
            child: const SpinKitSquareCircle(
              size: 30,
              color: AppColors.cPrimary,
            ),
          ),
        ),
      );
    }
    return const Center(
      child: SpinKitSquareCircle(size: 30, color: AppColors.cPrimary),
    );
  }
}
