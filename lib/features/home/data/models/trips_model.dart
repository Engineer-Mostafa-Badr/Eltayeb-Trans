import 'package:eltyp_delivery/features/home/domain/entities/trips_entities.dart';

class TripsModel extends TripsEntities {
  const TripsModel({
    required super.trips,
    required super.activeTripsCount,
    required super.monthlyTripsCount,
  });

  factory TripsModel.fromJson(Map<String, dynamic> json) {
    return TripsModel(
      trips: (json['trips'] as List<dynamic>? ?? [])
          .map((e) => TripModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      activeTripsCount: json['active_trips_count'] ?? 0,
      monthlyTripsCount: json['monthly_trips_count'] ?? 0,
    );
  }

  TripsModel copyWith({
    List<TripModel>? trips,
    int? activeTripsCount,
    int? monthlyTripsCount,
  }) {
    return TripsModel(
      trips: trips ?? this.trips,
      activeTripsCount: activeTripsCount ?? this.activeTripsCount,
      monthlyTripsCount: monthlyTripsCount ?? this.monthlyTripsCount,
    );
  }
}

class TripModel extends TripEntities {
  const TripModel({
    required super.id,
    required super.status,
    required super.quantity,
    required super.price,
    required super.tax,
    required super.total,
    required super.fromCity,
    required super.toCity,
    required super.company,
    required super.date,
    super.goodsType,
    super.driver,
    super.track,
  });

  factory TripModel.fromJson(Map<String, dynamic> json) {
    return TripModel(
      id: json['id'] ?? 0,
      status: json['status'] ?? '',
      quantity: json['quantity'] ?? 0,
      price: double.tryParse(json['price'].toString()) ?? 0.0,
      tax: double.tryParse(json['tax'].toString()) ?? 0.0,
      total: double.tryParse(json['total'].toString()) ?? 0.0,
      fromCity: CityModel.fromJson(json['from_city'] ?? {}),
      toCity: CityModel.fromJson(json['to_city'] ?? {}),
      company: CompanyModel.fromJson(json['company'] ?? {}),
      date: json['date'] ?? '',
      goodsType: json['goods_type'] != null
          ? GoodsTypeModel.fromJson(json['goods_type'])
          : null,
      driver: json['driver'] != null
          ? DriverModel.fromJson(json['driver'])
          : null,
      track: json['truck'] != null
          ? TruckModel.fromJson(json['truck'])
          : null,
    );
  }
}

class CityModel {
  final int id;
  final String name;

  const CityModel({
    required this.id,
    required this.name,
  });

  factory CityModel.fromJson(Map<String, dynamic> json) {
    return CityModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
    );
  }
}
class TruckModel {
  final int id;
  final String name;
  final String truckNumber;

  const TruckModel({
    required this.id,
    required this.name,
    required this.truckNumber,
  });

  factory TruckModel.fromJson(Map<String, dynamic> json) {
    return TruckModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      truckNumber: json['truck_number'] ?? '',
    );
  }
}

class CompanyModel {
  final int id;
  final String name;

  const CompanyModel({
    required this.id,
    required this.name,
  });

  factory CompanyModel.fromJson(Map<String, dynamic> json) {
    return CompanyModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
    );
  }
}

class GoodsTypeModel {
  final int id;
  final String name;

  const GoodsTypeModel({
    required this.id,
    required this.name,
  });

  factory GoodsTypeModel.fromJson(Map<String, dynamic> json) {
    return GoodsTypeModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
    );
  }
}

class DriverModel {
  final int id;
  final String name;
  final String type;
  final String email;
  final String? image;
  final String phone;

  const DriverModel({
    required this.id,
    required this.name,
    required this.type,
    required this.email,
    required this.image,
    required this.phone,
  });

  factory DriverModel.fromJson(Map<String, dynamic> json) {
    return DriverModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      type: json['type'] ?? '',
      email: json['email'] ?? '',
      image: json['image'],
      phone: json['phone'] ?? '',
    );
  }
}
