import 'package:equatable/equatable.dart';

class UpdatePasswordParams extends Equatable {
  final String currentPassword;
  final String newPassword;
  final String confirmPassword;

  const UpdatePasswordParams({
    required this.currentPassword,
    required this.newPassword,
    required this.confirmPassword,
  });

  Map<String, dynamic> toJson() {
    return {
      'current_password': currentPassword,
      'new_password': newPassword,
      'confirm_password': confirmPassword,
    };
  }

  @override
  List<Object?> get props => [currentPassword, newPassword, confirmPassword];
}
