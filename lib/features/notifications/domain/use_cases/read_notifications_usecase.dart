import 'package:dartz/dartz.dart';
import 'package:eltyp_delivery/core/api/dio/base_response.dart';
import 'package:eltyp_delivery/core/api/error/failures.dart';
import 'package:eltyp_delivery/core/usecase/base_use_case.dart';
import 'package:eltyp_delivery/features/notifications/domain/repositories/base_notifications_repo.dart';

class ReadNotificationsUseCase extends BaseUseCase<BaseResponse<int>, int> {
  ReadNotificationsUseCase(this.repository);

  final BaseNotificationsRepository repository;

  @override
  Future<Either<Failure, BaseResponse<int>>> call(int parameters) {
    return repository.readNotifications(parameters);
  }
}
