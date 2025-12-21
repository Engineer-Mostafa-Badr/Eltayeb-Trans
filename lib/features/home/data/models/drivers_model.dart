import 'package:eltyp_delivery/features/home/domain/entities/drivers_entities.dart';

class DriversModel extends DriversEntities {
  const DriversModel({required super.drivers});

  factory DriversModel.fromJson(dynamic json) {
    // Handle both cases: if json is a list directly, or if it's a map with 'data' or 'drivers' key
    List<dynamic> driversList = [];

    if (json is List) {
      driversList = json;
    } else if (json is Map<String, dynamic>) {
      if (json['data'] is List) {
        driversList = json['data'] as List<dynamic>;
      } else if (json['drivers'] is List) {
        driversList = json['drivers'] as List<dynamic>;
      }
    }

    return DriversModel(
      drivers: driversList
          .map((e) => DriverListItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  DriversModel copyWith({List<DriverListItemModel>? drivers}) {
    return DriversModel(drivers: drivers ?? this.drivers);
  }
}

class DriverListItemModel extends DriverListItemEntities {
  const DriverListItemModel({
    required super.id,
    required super.name,
    required super.phone,
    required super.status,
    super.email,
    super.image,
  });

  factory DriverListItemModel.fromJson(Map<String, dynamic> json) {
    return DriverListItemModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      phone: json['phone'] ?? '',
      status: json['status'] ?? 'available', // available or busy
      email: json['email'],
      image: json['image'],
    );
  }
}
