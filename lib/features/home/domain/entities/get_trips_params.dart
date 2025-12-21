import 'package:equatable/equatable.dart';

class GetTripsParams extends Equatable {
  final String? filterStatus;
  final String? search;
  final String? from;
  final String? to;

  const GetTripsParams({this.filterStatus, this.search, this.from, this.to});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = {};
    if (filterStatus != null && filterStatus!.isNotEmpty) {
      json['filter_status'] = filterStatus;
    }
    if (search != null && search!.isNotEmpty) {
      json['search'] = search;
    }
    if (from != null && from!.isNotEmpty) {
      json['from'] = from;
    }
    if (to != null && to!.isNotEmpty) {
      json['to'] = to;
    }
    return json;
  }

  @override
  List<Object?> get props => [filterStatus, search, from, to];
}
