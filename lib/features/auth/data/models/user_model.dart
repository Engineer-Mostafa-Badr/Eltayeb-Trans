import 'package:eltyp_delivery/features/auth/domain/entities/user_entities.dart';

class UserModel extends UserEntities {
  const UserModel({
    required super.id,
    required super.name,
    required super.phone,
    required super.email,
    required super.image,
    required super.notificationsCount,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      phone: json['phone'] ?? '',
      email: json['email'] ?? '',
      image: json['image'] ?? '',
      notificationsCount: json['notifications_count'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'phone': phone,
      'email': email,
      'image': image,
      'notifications_count': notificationsCount,
    };
  }

  UserModel copyWith({
    int? id,
    String? name,
    String? slug,
    String? phone,
    String? email,
    String? image,
    int? notificationsCount,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      image: image ?? this.image,
      notificationsCount: notificationsCount ?? this.notificationsCount,
    );
  }
}
