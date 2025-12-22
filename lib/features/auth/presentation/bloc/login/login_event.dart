part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class LoginButtonPressedEvent extends LoginEvent {
  const LoginButtonPressedEvent(this.parameters);

  final LoginParameters parameters;

  @override
  List<Object> get props => [];
}

class LoginRepresentativeButtonPressedEvent extends LoginEvent {
  const LoginRepresentativeButtonPressedEvent(this.parameters);

  final LoginrepresentativeParameters parameters;

  @override
  List<Object> get props => [];
}

class LogoutButtonPressedEvent extends LoginEvent {
  final LogoutParameters parameters;

  const LogoutButtonPressedEvent(this.parameters);

  @override
  List<Object> get props => [];
}

class DeleteAccountButtonPressedEvent extends LoginEvent {
  final DeleteAccountParameters parameters;

  const DeleteAccountButtonPressedEvent(this.parameters);

  @override
  List<Object> get props => [];
}

class VerifyButtonPressedEvent extends LoginEvent {
  final VerifyParams parameters;

  const VerifyButtonPressedEvent(this.parameters);

  @override
  List<Object> get props => [];
}

class ResendCodeButtonPressedEvent extends LoginEvent {
  final LoginParameters parameters;

  const ResendCodeButtonPressedEvent(this.parameters);

  @override
  List<Object> get props => [];
}
