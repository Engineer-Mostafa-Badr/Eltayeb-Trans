import 'package:equatable/equatable.dart';
import 'package:eltyp_delivery/features/home/data/models/trips_model.dart';

class TripsEntities extends Equatable {
  final List<TripModel> trips;
  final int activeTripsCount;
  final int monthlyTripsCount;

  const TripsEntities({
    required this.trips,
    required this.activeTripsCount,
    required this.monthlyTripsCount,
  });

  @override
  List<Object?> get props => [
    trips,
    activeTripsCount,
    monthlyTripsCount,
  ];
}

class TripEntities extends Equatable {
  final int id;
  final String status;
  final int quantity;
  final double price;
  final double tax;
  final double total;
  final CityModel fromCity;
  final CityModel toCity;
  final CompanyModel company;
  final String date;
  final GoodsTypeModel? goodsType;
  final DriverModel? driver;
  final TruckModel? track;

  const TripEntities({
    required this.id,
    required this.status,
    required this.quantity,
    required this.price,
    required this.tax,
    required this.total,
    required this.fromCity,
    required this.toCity,
    required this.company,
    required this.date,
    this.goodsType,
    this.driver,
    this.track,
  });

  @override
  List<Object?> get props => [
    id,
    status,
    quantity,
    price,
    tax,
    total,
    fromCity,
    toCity,
    company,
    date,
    goodsType,
    driver,
    track,
  ];
}
