import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:eltyp_delivery/core/api/dio/base_response.dart';
import 'package:eltyp_delivery/core/api/error/failures.dart';
import 'package:eltyp_delivery/core/usecase/base_use_case.dart';
import 'package:eltyp_delivery/features/auth/data/models/login_response_model.dart';
import 'package:eltyp_delivery/features/auth/domain/repositories/base_login_repo.dart';

class VerifyUseCase
    extends BaseUseCase<BaseResponse<LoginResponseModel>, VerifyParams> {
  final BaseLoginRepository baseLoginRepository;

  VerifyUseCase(this.baseLoginRepository);

  @override
  Future<Either<Failure, BaseResponse<LoginResponseModel>>> call(
    VerifyParams parameters,
  ) async {
    return baseLoginRepository.startVerify(parameters);
  }
}

class VerifyParams extends Equatable {
  final String code;
  final String phone;
  final String userType;

  const VerifyParams({
    required this.code,
    required this.phone,
    this.userType = 'driver',
  });

  Future<Map<String, dynamic>> toJson() async {
    return {
       'code': code,
       'phone': phone,
      'user_type': userType,
      'device_token': await FirebaseMessaging.instance.getToken(),
    };
  }

  @override
  List<Object?> get props => [ code, phone, userType];
}
