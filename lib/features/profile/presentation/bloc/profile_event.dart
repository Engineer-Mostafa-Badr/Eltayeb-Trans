part of 'profile_bloc.dart';

sealed class ProfileEvent extends Equatable {
  const ProfileEvent();
}

class GetProfileEvent extends ProfileEvent {
  const GetProfileEvent();

  @override
  List<Object> get props => [];
}

class UpdateProfileEvent extends ProfileEvent {
  const UpdateProfileEvent(this.parameters);

  final UpdateProfileParams parameters;

  @override
  List<Object> get props => [parameters];
}

class GetMyInvoicesEvent extends ProfileEvent {
  final PaginationParameters parameters;

  const GetMyInvoicesEvent({this.parameters = const PaginationParameters()});

  @override
  List<Object> get props => [parameters];
}

class GetCardsEvent extends ProfileEvent {
  final PaginationParameters parameters;

  const GetCardsEvent({this.parameters = const PaginationParameters()});

  @override
  List<Object> get props => [parameters];
}

class UpdateCounterNotificationEvent extends ProfileEvent {
  const UpdateCounterNotificationEvent({
    this.isPlus = false,
    this.isZero = false,
  });

  final bool isPlus;
  final bool isZero;

  @override
  List<Object> get props => [isPlus, isZero];
}

class GetPhotosEvent extends ProfileEvent {
  final PaginationParameters parameters;

  const GetPhotosEvent({this.parameters = const PaginationParameters()});

  @override
  List<Object> get props => [parameters];
}
