import 'package:easy_localization/easy_localization.dart';
import 'package:eltyp_delivery/core/components/screen_status/empty_widget.dart';
import 'package:eltyp_delivery/core/components/screen_status/loading_widget.dart';
import 'package:eltyp_delivery/core/components/widgets/custom_elevated_button.dart';
import 'package:eltyp_delivery/core/enum/enums.dart';
import 'package:eltyp_delivery/features/home/presentation/bloc/drivers_bloc.dart';
import 'package:eltyp_delivery/features/home/presentation/widgets/change_driver_widgets/driver_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DriversListWidget extends StatelessWidget {
  final int? selectedDriverId;
  final ValueChanged<int?> onDriverSelected;

  const DriversListWidget({
    super.key,
    required this.selectedDriverId,
    required this.onDriverSelected,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DriversBloc, DriversState>(
      builder: (context, state) {
        if (state.requestState == RequestState.loading) {
          return const LoadingWidget();
        }

        if (state.requestState == RequestState.error) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  state.response.msg ?? 'error_loading_drivers'.tr(),
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.red,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                CustomElevatedButton(
                  text: 'retry'.tr(),
                  onPressed: () {
                    context.read<DriversBloc>().add(const GetDriversEvent());
                  },
                ),
              ],
            ),
          );
        }

        final drivers = state.response.data?.drivers ?? [];

        if (drivers.isEmpty) {
          return EmptyBody(
            text: 'no_drivers_available'.tr(),
            fillRemaining: true,
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: drivers.length,
          itemBuilder: (context, index) {
            final driver = drivers[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: DriverCard(
                name: driver.name,
                phone: driver.phone,
                isAvailable: driver.status == 'available',
                isSelected: selectedDriverId == driver.id,
                onTap: () => onDriverSelected(driver.id),
              ),
            );
          },
        );
      },
    );
  }
}

