import 'package:dartz/dartz.dart';
import 'package:eltyp_delivery/core/api/dio/base_response.dart';
import 'package:eltyp_delivery/core/api/error/exceptions.dart';
import 'package:eltyp_delivery/core/api/error/failures.dart';
import 'package:eltyp_delivery/features/expenses/data/data_sources/remote/remote_data_source.dart';
import 'package:eltyp_delivery/features/expenses/domain/entities/all_medals_response.dart';
import 'package:eltyp_delivery/features/expenses/domain/repositories/base_repo.dart';
import 'package:eltyp_delivery/features/expenses/domain/use_cases/get_all_medals_usecase.dart';

class MedalsRepositoryImpl implements BaseMedalsRepository {
  MedalsRepositoryImpl(this.remoteDataSource);

  final MedalsRemoteDataSource remoteDataSource;


  @override
  Future<Either<Failure, BaseResponse<AllMedalsResponse>>> getAllMedals(
    GetAllMedalsParameters parameters,
  ) async {
    try {
      final response = await remoteDataSource.getAllMedals(parameters);
      return Right(response);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }
}
