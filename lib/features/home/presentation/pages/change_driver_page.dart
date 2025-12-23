import 'dart:ui' as ui show TextDirection;
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eltyp_delivery/core/components/scaffold/shared_home_scaffold.dart';
import 'package:eltyp_delivery/core/components/widgets/custom_elevated_button.dart';
import 'package:eltyp_delivery/config/themes/colors.dart';
import 'package:eltyp_delivery/core/utils/app_sizes.dart';
import 'package:eltyp_delivery/features/home/presentation/bloc/drivers_bloc.dart';
import 'package:eltyp_delivery/features/home/presentation/widgets/change_driver_widgets/change_driver_bottom_nav.dart';
import 'package:eltyp_delivery/features/home/presentation/widgets/change_driver_widgets/change_driver_header.dart';
import 'package:eltyp_delivery/features/home/presentation/widgets/change_driver_widgets/drivers_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangeDriverPage extends StatefulWidget {
  const ChangeDriverPage({super.key});

  @override
  State<ChangeDriverPage> createState() => _ChangeDriverPageState();
}

class _ChangeDriverPageState extends State<ChangeDriverPage> {
  int? _selectedDriverId;

  @override
  void initState() {
    super.initState();
    context.read<DriversBloc>().add(const GetDriversEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: ui.TextDirection.rtl,
      child: SharedHomeScaffold(
        bottomNavigationBar: const ChangeDriverBottomNav(),
        body: Column(
          children: [
            const ChangeDriverHeader(),
            Expanded(
              child: DriversListWidget(
                selectedDriverId: _selectedDriverId,
                onDriverSelected: (driverId) {
                  setState(() => _selectedDriverId = driverId);
                },
              ),
            ),
            _buildConfirmButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildConfirmButton() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: CustomElevatedButton(
        text: 'confirm_driver_change'.tr(),
        enabled: _selectedDriverId != null,
        backgroundColor: AppColors.cChangeDriverButton,
        foregroundColor: Colors.white,
        padding: EdgeInsets.symmetric(vertical: AppPadding.padding16.h),
        borderRadius: AppBorderRadius.radius12,
        elevation: 0,
        textStyle: TextStyle(
          fontSize: AppFontSize.f16,
          fontWeight: FontWeight.bold,
        ),
        onPressed: _selectedDriverId != null
            ? () => Navigator.of(context).pop(_selectedDriverId)
            : null,
      ),
    );
  }
}
