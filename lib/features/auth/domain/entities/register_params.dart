import 'package:equatable/equatable.dart';

class RegisterParams extends Equatable {
  final String name;
  final String email;
  final String phone;
  final int countryId;
  final bool acceptTerms;
  final String userType;
  final String birthDate;
  final String civil;
  final String gender;

  const RegisterParams({
    required this.name,
    this.email = '',
    this.phone = '',
    // this.cityId = 0,
    this.acceptTerms = false,
    this.userType = 'user',
    this.birthDate = '',
    this.civil = '',
    this.gender = '',
    this.countryId = 0,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      if (email.isNotEmpty) 'email': email,
      if (phone.isNotEmpty) 'phone': phone,
      // if (cityId != 0) 'city_id': cityId,
      if (countryId != 0) 'country_id': countryId,
      'accept_terms': acceptTerms ? 1 : 0,
      'type': userType,
      'register_type': phone.isEmpty ? 'email' : 'phone',
      if (birthDate.isNotEmpty) 'birthdate': birthDate,
      if (civil.isNotEmpty) 'civil': civil,
      if (gender.isNotEmpty) 'gender': gender,
    };
  }

  @override
  List<Object?> get props => [
    name,
    email,
    phone,
    countryId,
    acceptTerms,
    userType,
    birthDate,
    civil,
    gender,
  ];
}
