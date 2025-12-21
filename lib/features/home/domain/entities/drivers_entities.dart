abstract class DriversEntities {
  final List<DriverListItemEntities> drivers;

  const DriversEntities({required this.drivers});
}

abstract class DriverListItemEntities {
  final int id;
  final String name;
  final String phone;
  final String status; // available or busy
  final String? email;
  final String? image;

  const DriverListItemEntities({
    required this.id,
    required this.name,
    required this.phone,
    required this.status,
    this.email,
    this.image,
  });
}
