import 'package:eltyp_delivery/features/home/domain/entities/trucks_entities.dart';

class TrucksModel extends TrucksEntities {
  const TrucksModel({required super.trucks});

  factory TrucksModel.fromJson(dynamic json) {
    // Handle both cases: if json is a list directly, or if it's a map with 'data' or 'trucks' key
    List<dynamic> trucksList = [];

    if (json is List) {
      trucksList = json;
    } else if (json is Map<String, dynamic>) {
      if (json['data'] is List) {
        trucksList = json['data'] as List<dynamic>;
      } else if (json['trucks'] is List) {
        trucksList = json['trucks'] as List<dynamic>;
      }
    }

    return TrucksModel(
      trucks: trucksList
          .map((e) => TruckListItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  TrucksModel copyWith({List<TruckListItemModel>? trucks}) {
    return TrucksModel(trucks: trucks ?? this.trucks);
  }
}

class TruckListItemModel extends TruckListItemEntities {
  const TruckListItemModel({
    required super.id,
    required super.name,
    required super.truckNumber,
    super.type,
    super.status,
  });

  factory TruckListItemModel.fromJson(Map<String, dynamic> json) {
    return TruckListItemModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      truckNumber: json['truck_number'] ?? json['truckNumber'] ?? '',
      type: json['type'],
      status: json['status'] ?? 'available', // available, busy, maintenance
    );
  }
}
