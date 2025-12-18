import 'package:eltyp_delivery/features/notifications/domain/entities/notifications_entities.dart';

class NotificationsModel extends NotificationsEntities {
  // {
  //     "id": 43,
  //     "title": "تهانينا! لقد حصلت على البطاقة البطاقة النادرة.",
  //     "type": "trophy",
  //     "seen_at": "2025-10-02 13:03:14",
  //     "created_at": "2025-09-24T10:08:59.000000Z"
  //   }
  const NotificationsModel({
    required super.id,
    required super.title,
    required super.type,
    required super.seenAt,
    required super.createdAt,
    required super.image,
    required super.createdAtHuman,
  });

  factory NotificationsModel.fromJson(Map<String, dynamic> json) {
    return NotificationsModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      type: json['type'] ?? '',
      seenAt: json['seen_at'] ?? '',
      createdAt: json['created_at'] ?? '',
      image: json['image'] ?? '',
      createdAtHuman: json['created_at_human'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'type': type,
      'seen_at': seenAt,
      'created_at': createdAt,
      'image': image,
      'created_at_human': createdAt,
    };
  }

  NotificationsModel copyWith({
    int? id,
    String? title,
    String? type,
    String? seenAt,
    String? createdAt,
    String? image,
    String? createdAtHuman,
  }) {
    return NotificationsModel(
      id: id ?? this.id,
      title: title ?? this.title,
      type: type ?? this.type,
      seenAt: seenAt ?? this.seenAt,
      createdAt: createdAt ?? this.createdAt,
      image: image ?? this.image,
      createdAtHuman: createdAtHuman ?? this.createdAtHuman,
    );
  }
}
