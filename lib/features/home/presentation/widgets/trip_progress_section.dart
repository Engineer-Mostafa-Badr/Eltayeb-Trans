import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/themes/colors.dart';
import '../../../../config/themes/styles.dart';
import '../../../../core/extensions/widgets_extensions.dart';
import '../../../../core/utils/app_sizes.dart';

/// A progress indicator widget showing trip stages: Created, On Road, Delivered
class TripProgressSection extends StatelessWidget {
  final bool createdActive;
  final bool onRoadActive;
  final bool deliveredActive;

  const TripProgressSection({
    super.key,
    required this.createdActive,
    required this.onRoadActive,
    required this.deliveredActive,
  });

  @override
  Widget build(BuildContext context) {
    final stages = [
      _ProgressStage(label: 'تم الإنشاء', isActive: createdActive),
      _ProgressStage(
        label: 'في الطريق',
        isActive: onRoadActive,
        isLineActive: createdActive && onRoadActive,
      ),
      _ProgressStage(
        label: 'تم التوصيل',
        isActive: deliveredActive,
        isLineActive: onRoadActive && deliveredActive,
      ),
    ];

    return Column(
      children: [
        _ProgressIndicatorRow(stages: stages),
        4.sizedHeight,
        _ProgressLabelsRow(stages: stages),
      ],
    );
  }
}

class _ProgressStage {
  final String label;
  final bool isActive;
  final bool isLineActive;

  const _ProgressStage({
    required this.label,
    required this.isActive,
    this.isLineActive = false,
  });
}

class _ProgressIndicatorRow extends StatelessWidget {
  final List<_ProgressStage> stages;

  const _ProgressIndicatorRow({required this.stages});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppPadding.padding12.w),
      child: Row(
        children: [
          for (int i = 0; i < stages.length; i++) ...[
            _ProgressCircle(isActive: stages[i].isActive),
            if (i < stages.length - 1)
              Expanded(
                child: Container(
                  height: 3.h,
                  color: stages[i].isLineActive
                      ? AppColors.cSuccess
                      : AppColors.cPinColor,
                ),
              ),
          ],
        ],
      ),
    );
  }
}

class _ProgressCircle extends StatelessWidget {
  final bool isActive;

  const _ProgressCircle({required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24.w,
      height: 24.w,
      decoration: BoxDecoration(
        color: isActive ? AppColors.cSuccess : Colors.white,
        shape: BoxShape.circle,
        border: Border.all(
          color: isActive ? AppColors.cSuccess : AppColors.cFillBorderLight,
          width: 2,
        ),
      ),
      child: isActive
          ? Icon(Icons.check, size: 14.sp, color: Colors.white)
          : null,
    );
  }
}

class _ProgressLabelsRow extends StatelessWidget {
  final List<_ProgressStage> stages;

  const _ProgressLabelsRow({required this.stages});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: stages
          .map(
            (stage) => Expanded(
              child: Center(
                child: Text(
                  stage.label,
                  style: AppStyles.subtitle400.copyWith(
                    color: stage.isActive
                        ? AppColors.cSuccess
                        : AppColors.cTextSubtitleLight,
                    fontSize: AppFontSize.f11,
                  ),
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
