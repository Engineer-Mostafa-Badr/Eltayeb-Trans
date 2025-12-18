import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

class UpdateProfileParams extends Equatable {
  final String name;
  final String email;
  final String phone;
  final String image;
  final int galleryId;

  Future<Map<String, dynamic>> toJson() async {
    return {
      if (name.isNotEmpty) 'name': name,
      if (phone.isNotEmpty) 'phone': phone,
      if (image.isNotEmpty) 'image': await MultipartFile.fromFile(image),
      if (email.isNotEmpty) 'email': email,
      if (galleryId != 0) 'gallery_id': galleryId,
    };
  }

  const UpdateProfileParams({
    this.name = '',
    this.phone = '',
    this.email = '',
    this.image = '',
    this.galleryId = 0,
  });

  @override
  List<Object?> get props => [name, phone, email, image, galleryId];
}
