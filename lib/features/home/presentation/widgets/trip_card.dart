import 'package:eltyp_delivery/features/home/presentation/widgets/trip_progress_section.dart';
import 'package:eltyp_delivery/features/expenses/presentation/pages/new_expenses_page.dart';
import 'package:eltyp_delivery/core/extensions/navigation_extensions.dart';
import '../../../../core/components/utils/custom_rounded_container.dart';
import '../../../../core/components/images/custom_asset_svg_image.dart';
import '../../../../core/components/buttons/outlined_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import '../pages/maintenance_request_page.dart';
import '../../../../config/themes/colors.dart';
import '../../../../config/themes/styles.dart';
import '../../../../core/utils/app_sizes.dart';
import '../../../../core/res/app_images.dart';
import '../../data/models/trips_model.dart';
import '../pages/trips_details_page.dart';
import 'package:flutter/material.dart';

extension TripUiX on TripModel {
  Color get statusColor {
    switch (status) {
      case 'pending':
        return AppColors.cRate;
      case 'in_progress':
        return AppColors.cLightBlueColor;
      case 'delivered':
        return AppColors.cSuccess;
      default:
        return AppColors.cLightBlueColor;
    }
  }

  String get statusLabel {
    switch (status) {
      case 'pending':
        return 'في الانتظار';
      case 'in_progress':
        return 'قيد التنفيذ';
      case 'delivered':
        return 'تم التوصيل';
      default:
        return status;
    }
  }

  bool get createdActive => true;

  bool get onRoadActive => status == 'in_progress' || status == 'delivered';

  bool get deliveredActive => status == 'delivered';

  bool get showMaintenanceBadge => false;

  String get dateText => date;
}

class TripCard extends StatelessWidget {
  final TripModel trip;

  const TripCard({super.key, required this.trip});

  @override
  Widget build(BuildContext context) {
    return CustomRoundedContainer(
      padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TripHeaderSection(trip: trip),
          SizedBox(height: 12.h),
          TripRouteRow(trip: trip),
          SizedBox(height: 12.h),
          TripCompanyDateRow(trip: trip),
          SizedBox(height: 16.h),
          TripProgressSection(
            createdActive: trip.createdActive,
            onRoadActive: trip.onRoadActive,
            deliveredActive: trip.deliveredActive,
          ),
          SizedBox(height: 16.h),
          TripActionsSection(trip: trip),
        ],
      ),
    );
  }
}

class TripActionsSection extends StatelessWidget {
  final TripModel trip;

  const TripActionsSection({super.key, required this.trip});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ReusedOutlinedButton(
          width: double.maxFinite,
          text: 'تفاصيل الرحلة',
          onPressed: () =>
              context.navigateToPage(TripDetailsPage(tripId: trip.id)),
          color: AppColors.cPrimary,
          textStyle: AppStyles.title700.copyWith(
            fontSize: AppFontSize.f16,
            color: Colors.white,
          ),
          height: 55.h,
        ),
        SizedBox(height: 12.h),
        Row(
          children: [
            Expanded(
              child: ReusedOutlinedButton(
                text: 'adding_expenses',
                onPressed: () =>
                    context.navigateToPage(NewExpensesPage(tripId: trip.id)),
                rowWidget: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CustomAssetSvgImage(AssetImagesPath.add),
                    SizedBox(width: 6.w),
                    Text(
                      'adding_expenses',
                      style: TextStyle(
                        color: AppColors.cPrimary,
                        fontWeight: FontWeight.w700,
                        fontSize: 15.sp,
                      ),
                    ).tr(),
                  ],
                ),
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: ReusedOutlinedButton(
                text: 'طلب صيانة',
                onPressed: () => context.navigateToPage(
                  MaintenanceRequestPage(tripId: trip.id),
                ),
                rowWidget: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CustomAssetSvgImage(AssetImagesPath.buildRounded),
                    SizedBox(width: 6.w),
                    Text(
                      'طلب صيانة',
                      style: TextStyle(
                        color: AppColors.cPrimary,
                        fontWeight: FontWeight.w700,
                        fontSize: 15.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class TripHeaderSection extends StatelessWidget {
  final TripModel trip;

  const TripHeaderSection({super.key, required this.trip});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              '${'trip_number'.tr()} ${trip.id}',
              style: AppStyles.title700.copyWith(
                color: AppColors.cDarkBlueColor,
                fontSize: AppFontSize.f16,
              ),
            ),
            const Spacer(),
            TripStatusChip(label: trip.statusLabel, color: trip.statusColor),
          ],
        ),
        const Divider(color: AppColors.cHomeLiteCard),
      ],
    );
  }
}

class TripStatusChip extends StatelessWidget {
  final String label;
  final Color color;

  const TripStatusChip({super.key, required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.10),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Text(label, style: AppStyles.subtitle500.copyWith(color: color)),
    );
  }
}

class TripRouteRow extends StatelessWidget {
  final TripModel trip;

  const TripRouteRow({super.key, required this.trip});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: AppColors.cHomeLiteCard,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          const Icon(Icons.location_on_outlined, color: AppColors.cPrimary),
          SizedBox(width: 8.w),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                trip.fromCity.name,
                style: AppStyles.title500.copyWith(fontSize: AppFontSize.f16),
              ),
              SizedBox(width: 4.w),
              Text(' ← ', style: AppStyles.title500),
              SizedBox(width: 4.w),
              Text(
                trip.toCity.name,
                style: AppStyles.title500.copyWith(fontSize: AppFontSize.f16),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class TripCompanyDateRow extends StatelessWidget {
  final TripModel trip;

  const TripCompanyDateRow({super.key, required this.trip});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 6.w,
                    height: 6.w,
                    decoration: const BoxDecoration(
                      color: AppColors.cPrimary,
                      shape: BoxShape.circle,
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Text(
                    trip.company.name,
                    style: AppStyles.title500.copyWith(
                      color: AppColors.cTextSubtitleDark,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              Row(
                children: [
                  const Icon(
                    Icons.calendar_today_outlined,
                    color: AppColors.cTextSubtitleLight,
                  ),
                  SizedBox(width: 10.w),
                  Padding(
                    padding: const EdgeInsets.only(top: AppPadding.padding6),
                    child: Text(trip.dateText, style: AppStyles.subtitle400),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
