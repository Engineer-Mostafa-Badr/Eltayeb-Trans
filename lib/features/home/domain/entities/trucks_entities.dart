abstract class TrucksEntities {
  final List<TruckListItemEntities> trucks;

  const TrucksEntities({required this.trucks});
}

abstract class TruckListItemEntities {
  final int id;
  final String name;
  final String truckNumber;
  final String? type;
  final String? status; // available, busy, maintenance

  const TruckListItemEntities({
    required this.id,
    required this.name,
    required this.truckNumber,
    this.type,
    this.status,
  });
}
