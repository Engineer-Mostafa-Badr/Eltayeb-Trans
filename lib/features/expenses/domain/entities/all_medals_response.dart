import 'package:equatable/equatable.dart';

class AllMedalsResponse extends Equatable {
  const AllMedalsResponse({
    required this.totalMedals,
    required this.medalsOwnedByUser,
    required this.precentageOwned,
  });

  final int totalMedals;
  final int medalsOwnedByUser;
  final double precentageOwned;

  factory AllMedalsResponse.fromJson(Map<String, dynamic> json) {
    return AllMedalsResponse(
      totalMedals: json['total_medals'] ?? 0,
      medalsOwnedByUser: json['medals_owned_by_user'] ?? 0,
      precentageOwned: double.tryParse((json['precentage_owned'] ?? 0).toString()) ?? 0.0,
    );
  }

  AllMedalsResponse copyWith({int? totalMedals, int? medalsOwnedByUser, double? precentageOwned}) {
    return AllMedalsResponse(
      totalMedals: totalMedals ?? this.totalMedals,
      medalsOwnedByUser: medalsOwnedByUser ?? this.medalsOwnedByUser,
      precentageOwned: precentageOwned ?? this.precentageOwned,
    );
  }

  @override
  List<Object?> get props => [totalMedals, medalsOwnedByUser, precentageOwned];
}
