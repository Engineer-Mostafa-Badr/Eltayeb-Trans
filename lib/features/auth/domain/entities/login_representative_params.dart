import 'package:equatable/equatable.dart';

class LoginrepresentativeParameters extends Equatable {
  /// login is username or email
  final String email;
  final String password;

  /// [userType] user, marketer, coordinator, trainer,
  final String userType;

  const LoginrepresentativeParameters({
    this.email = '',
    this.password = '',
    this.userType = 'employee',
  });

  Map<String, dynamic> toJson() {
    return {
      if (email.isNotEmpty) 'email': email,
      if (password.isNotEmpty) 'password': password,
      if (userType.isNotEmpty) 'user_type': userType,
    };
  }

  @override
  List<Object?> get props => [email, userType, password];
}
