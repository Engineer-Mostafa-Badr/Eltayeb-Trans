import 'package:equatable/equatable.dart';

class GetTripDetailsParams extends Equatable {
  const GetTripDetailsParams({this.tripId});

  final int? tripId;

  Future<Map<String, dynamic>> toJson() async {
    return {if (tripId != null) 'id': tripId};
  }

  @override
  List<Object?> get props => [tripId];
}
