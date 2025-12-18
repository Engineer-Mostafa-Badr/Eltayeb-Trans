import 'package:eltyp_delivery/core/api/dio/api_consumer.dart';
import 'package:eltyp_delivery/core/api/dio/base_response.dart';
import 'package:eltyp_delivery/core/api/dio/end_points.dart';
import 'package:eltyp_delivery/core/api/dio/status_code.dart';
import 'package:eltyp_delivery/core/api/error/exceptions.dart';
import 'package:eltyp_delivery/features/expenses/domain/entities/all_medals_response.dart';
import 'package:eltyp_delivery/features/expenses/domain/use_cases/get_all_medals_usecase.dart';

abstract class BaseMedalsRemoteDataSource {
  Future<BaseResponse<AllMedalsResponse>> getAllMedals(GetAllMedalsParameters parameters);
}

class MedalsRemoteDataSource extends BaseMedalsRemoteDataSource {
  final ApiConsumer _apiConsumer;

  MedalsRemoteDataSource(this._apiConsumer);

  @override
  Future<BaseResponse<AllMedalsResponse>> getAllMedals(GetAllMedalsParameters parameters) async {
    final response = await _apiConsumer.get(
      EndPoints.allMedals,
      authenticated: true,
      // data: parameters.toJson(),
      queryParameters: parameters.toJson(),
    );

    if (StatusCode.isSuccessful(response)) {
      return BaseResponse<AllMedalsResponse>(
        status: response.data[BaseResponse.statusKey],
        data: AllMedalsResponse.fromJson(response.data[BaseResponse.dataKey] ?? {}),
        msg: response.data[BaseResponse.msgKey],
        pagination: PaginationModel.fromJson(response.data[BaseResponse.paginationKey] ?? {}),
      );
    } else {
      throw ServerException(message: StatusCode.errorMessage(response));
    }
  }
}
