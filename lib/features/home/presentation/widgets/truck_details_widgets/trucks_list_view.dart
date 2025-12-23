import 'package:eltyp_delivery/core/components/screen_status/empty_widget.dart';
import 'package:eltyp_delivery/features/home/domain/entities/trucks_entities.dart';
import 'package:eltyp_delivery/features/home/presentation/widgets/truck_details_widgets/truck_card.dart';
import 'package:flutter/material.dart';

class TrucksListView extends StatelessWidget {
  final List<TruckListItemEntities> trucks;
  final int? selectedTruckId;
  final ValueChanged<int?> onTruckSelected;

  const TrucksListView({
    super.key,
    required this.trucks,
    required this.selectedTruckId,
    required this.onTruckSelected,
  });

  @override
  Widget build(BuildContext context) {
    if (trucks.isEmpty) {
      return const EmptyBody(text: 'لا توجد شاحنات متاحة');
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
          onTap: () => onTruckSelected(truck.id),
        );
      },
    );
  }
}

