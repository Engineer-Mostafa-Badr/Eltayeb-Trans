import 'dart:ui' as ui show TextDirection;
import 'package:easy_localization/easy_localization.dart';
import 'package:eltyp_delivery/config/themes/colors.dart';
import 'package:eltyp_delivery/core/components/screen_status/empty_widget.dart';
import 'package:eltyp_delivery/core/components/screen_status/error_widget.dart';
import 'package:eltyp_delivery/core/components/widgets/custom_elevated_button.dart';
import 'package:eltyp_delivery/core/enum/enums.dart';
import 'package:eltyp_delivery/features/home/presentation/bloc/trucks_bloc.dart';
import 'package:eltyp_delivery/features/home/presentation/widgets/truck_details_widgets/truck_details_app_bar.dart';
import 'package:eltyp_delivery/features/home/presentation/widgets/truck_details_widgets/truck_details_bottom_action.dart';
import 'package:eltyp_delivery/features/home/presentation/widgets/truck_details_widgets/truck_details_bottom_nav.dart';
import 'package:eltyp_delivery/features/home/presentation/widgets/truck_details_widgets/truck_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TruckDetailsPage extends StatefulWidget {
  const TruckDetailsPage({super.key});

  @override
  State<TruckDetailsPage> createState() => _TruckDetailsPageState();
}

class _TruckDetailsPageState extends State<TruckDetailsPage> {
  int? selectedTruckId;

  @override
  void initState() {
    super.initState();
    context.read<TrucksBloc>().add(const GetTrucksEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: ui.TextDirection.rtl,
      child: Scaffold(
        backgroundColor: AppColors.cTruckDetailsBackground,
        appBar: const TruckDetailsAppBar(),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(child: _buildTrucksList()),
              TruckDetailsBottomAction(
                isEnabled: selectedTruckId != null,
                onPressed: selectedTruckId != null
                    ? () => Navigator.of(context).pop(selectedTruckId)
                    : null,
              ),
            ],
          ),
        ),
        bottomNavigationBar: const TruckDetailsBottomNav(),
      ),
    );
  }

  Widget _buildTrucksList() {
    return BlocBuilder<TrucksBloc, TrucksState>(
      builder: (context, state) {
        if (state.requestState == RequestState.loading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state.requestState == RequestState.error) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ErrorBody(
                  errorMessage:
                      state.response.msg ?? 'error_loading_trucks'.tr(),
                ),
                const SizedBox(height: 16),
                CustomElevatedButton(
                  text: 'retry'.tr(),
                  onPressed: () =>
                      context.read<TrucksBloc>().add(const GetTrucksEvent()),
                ),
              ],
            ),
          );
        }

        final trucks = state.response.data?.trucks ?? [];

        if (trucks.isEmpty) {
          return EmptyBody(text: 'no_trucks_available'.tr());
        }

        return ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          itemCount: trucks.length,
          separatorBuilder: (_, __) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            final truck = trucks[index];
            return TruckCard(
              truck: truck,
              isSelected: selectedTruckId == truck.id,
              onTap: () => setState(() => selectedTruckId = truck.id),
            );
          },
        );
      },
    );
  }
}
