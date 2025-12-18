import 'package:dartz/dartz.dart';
import 'package:eltyp_delivery/core/api/dio/base_response.dart';
import 'package:eltyp_delivery/core/api/error/failures.dart';
import 'package:eltyp_delivery/features/expenses/domain/entities/all_medals_response.dart';
import 'package:eltyp_delivery/features/expenses/domain/use_cases/get_all_medals_usecase.dart';

abstract class BaseMedalsRepository {
  Future<Either<Failure, BaseResponse<AllMedalsResponse>>> getAllMedals(
    GetAllMedalsParameters parameters,
  );
}
