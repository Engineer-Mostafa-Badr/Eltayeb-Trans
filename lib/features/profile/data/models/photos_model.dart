import 'package:eltyp_delivery/features/profile/domain/entities/photos_entities.dart';

class PhotosModel extends PhotosEntities {
  //  {
  //       "id": 1,
  //       "image": "http://127.0.0.1:8000/uploads/galleries/1759652303slider image.png"
  //     }
  const PhotosModel({required super.id, required super.image});

  factory PhotosModel.fromJson(Map<String, dynamic> json) {
    return PhotosModel(id: json['id'] ?? 0, image: json['image'] ?? '');
  }
}
