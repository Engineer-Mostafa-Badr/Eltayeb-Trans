import 'package:equatable/equatable.dart';

class UserEntities extends Equatable {
  const UserEntities({
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
    required this.image,
    required this.notificationsCount,
  });

  final int id;
  final String name;
  final String phone;
  final String email;
  final String image;

  final int notificationsCount;

  @override
  List<Object?> get props => [id, name, phone, email, image, notificationsCount];
}
