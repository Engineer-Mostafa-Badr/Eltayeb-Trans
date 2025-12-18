import 'package:equatable/equatable.dart';

class PhotosEntities extends Equatable {
  //  {
  //       "id": 1,
  //       "image": "http://127.0.0.1:8000/uploads/galleries/1759652303slider image.png"
  //     }
  const PhotosEntities({required this.id, required this.image});

  final int id;
  final String image;

  @override
  List<Object?> get props => [id, image];
}
