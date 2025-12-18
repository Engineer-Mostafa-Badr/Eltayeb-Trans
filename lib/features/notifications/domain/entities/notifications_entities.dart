import 'package:equatable/equatable.dart';

class NotificationsEntities extends Equatable {
  const NotificationsEntities({
    required this.id,
    required this.title,
    required this.type,
    required this.seenAt,
    required this.createdAt,
    required this.image,
    required this.createdAtHuman,
  });

  final int id;
  final String title;
  final String type;
  final String seenAt;
  final String createdAtHuman;
  final String createdAt;
  final String image;

  @override
  List<Object?> get props => [
    id,
    title,
    type,
    seenAt,
    createdAt,
    image,
    createdAtHuman,
  ];
}
