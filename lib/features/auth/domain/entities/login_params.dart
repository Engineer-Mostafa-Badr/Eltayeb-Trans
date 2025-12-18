import 'package:equatable/equatable.dart';

class LoginParameters extends Equatable {
  /// login is username or email
  final String phone;

  /// [userType] user, marketer, coordinator, trainer,
  final String userType;

  const LoginParameters({
    this.phone = '',
    this.userType = 'driver',
  });

  Map<String, dynamic> toJson() {
    return {
      if (phone.isNotEmpty) 'phone': phone,
      if (userType.isNotEmpty) 'user_type': userType,
    };
  }

  @override
  List<Object?> get props => [phone, userType];
}
