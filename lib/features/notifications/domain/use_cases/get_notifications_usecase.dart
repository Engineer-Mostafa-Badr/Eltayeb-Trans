import 'package:dartz/dartz.dart';
import 'package:eltyp_delivery/core/api/dio/base_response.dart';
import 'package:eltyp_delivery/core/api/error/failures.dart';
import 'package:eltyp_delivery/core/usecase/base_use_case.dart';
import 'package:eltyp_delivery/features/notifications/data/models/notifications_model.dart';
import 'package:eltyp_delivery/features/notifications/domain/repositories/base_notifications_repo.dart';
import 'package:equatable/equatable.dart';

class GetNotificationsParameters extends Equatable {
  final int page;
  final String? filter;

  const GetNotificationsParameters({this.page = 1, this.filter});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = {'page': page};
    if (filter != null && filter!.isNotEmpty) {
      json['filter'] = filter;
    }
    return json;
  }

  GetNotificationsParameters copyWith({int? page, String? filter}) {
    return GetNotificationsParameters(
      page: page ?? this.page,
      filter: filter ?? this.filter,
    );
  }

  @override
  List<Object?> get props => [page, filter];
}

class GetNotificationsUseCase
    extends
        BaseUseCase<
          BaseResponse<List<NotificationsModel>>,
          GetNotificationsParameters
        > {
  final BaseNotificationsRepository repository;

  GetNotificationsUseCase(this.repository);

  @override
  Future<Either<Failure, BaseResponse<List<NotificationsModel>>>> call(
    GetNotificationsParameters parameters,
  ) {
    return repository.getNotifications(parameters);
  }
}
