import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:eltyp_delivery/config/navigator_key/navigator_key.dart';
import 'package:eltyp_delivery/core/api/dio/api_consumer.dart';
import 'package:eltyp_delivery/core/api/dio/base_response.dart';
import 'package:eltyp_delivery/core/api/dio/end_points.dart';
import 'package:eltyp_delivery/core/api/dio/status_code.dart';
import 'package:eltyp_delivery/core/api/error/exceptions.dart';
import 'package:eltyp_delivery/core/extensions/navigation_extensions.dart';
import 'package:eltyp_delivery/core/storage/main_hive_box.dart';
import 'package:eltyp_delivery/core/constants/app_constants.dart';
import 'package:eltyp_delivery/core/utils/app_const.dart';
import 'package:eltyp_delivery/core/utils/device_utils.dart';
import 'package:eltyp_delivery/features/auth/presentation/pages/login_page.dart';
import 'package:eltyp_delivery/features/injection_container.dart' as di;
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioConsumer extends ApiConsumer {
  final Dio client;
  final MainSecureStorage _secureStorage;

  DioConsumer({required this.client, required MainSecureStorage secureStorage})
    : _secureStorage = secureStorage {
    (client.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () {
      final httpClient = HttpClient()
        ..connectionTimeout = AppConstants.connectionTimeout
        ..idleTimeout = AppConstants.idleTimeout
        ..maxConnectionsPerHost = AppConstants.maxConnectionsPerHost;
      return httpClient;
    };

    client.options
      ..baseUrl = EndPoints.baseUrl
      ..responseType = ResponseType.json
      ..followRedirects = false
      ..connectTimeout = AppConstants.connectionTimeout
      ..receiveDataWhenStatusError = true
      ..validateStatus = (status) {
        return status! < StatusCode.internalServerError;
      };
    if (kDebugMode) {
      client.interceptors.add(di.sl<PrettyDioLogger>());
    }
  }

  @override
  Future<Response> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
    required bool authenticated,
  }) async {
    try {
      final response = await client.get(
        path,
        queryParameters: queryParameters,
        options: Options(headers: await _buildHeaders(authenticated, headers)),
      );
      _checkIfNeedLogin(response);
      return response;
    } on DioException catch (error) {
      throw await _handleDioError(error);
    }
  }
 
  @override
  Future<Response> post(
    String path, {
    Map<String, dynamic>? data,
    bool formDataIsEnabled = true,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameters,
    required bool authenticated,
  }) async {
    try {
      final response = await client.post(
        path,
        data: formDataIsEnabled ? FormData.fromMap(data!) : data,
        options: Options(headers: await _buildHeaders(authenticated, headers)),
        queryParameters: queryParameters,
      );
      _checkIfNeedLogin(response);
      return response;
    } on DioException catch (error) {
      throw await _handleDioError(error);
    }
  }

  @override
  Future<Response> put(
    String path, {
    Map<String, dynamic>? body,
    Map<String, String>? headers,
    bool responseIsParsing = true,
    Map<String, dynamic>? queryParameters,
    required bool authenticated,
  }) async {
    try {
      final response = await client.put(
        path,
        data: body,
        queryParameters: queryParameters,
        options: Options(headers: await _buildHeaders(authenticated, headers)),
      );
      _checkIfNeedLogin(response);
      return response;
    } on DioException catch (error) {
      throw await _handleDioError(error);
    }
  }

  @override
  Future<String> openFileFromAssets(String path) async {
    try {
      return await rootBundle.loadString(path);
    } catch (error) {
      throw AssetsException(message: error.toString());
    }
  }

  Future<ServerException> _handleDioError(DioException error) async {
    if (error.response?.statusCode == StatusCode.unauthorized) {
      await di.sl<MainSecureStorage>().logout();
      NavigatorKey.context.navigateToPageWithClearStack(const LoginPage());
    }

    if (error.response != null &&
        error.response!.data[BaseResponse.msgKey] != null) {
      return ServerException(
        message: error.response!.data[BaseResponse.msgKey],
      );
    } else if (error.response?.statusCode == StatusCode.internalServerError) {
      return const ServerException(message: 'internal_server_error');
    } else if (error.error is SocketException) {
      return const ServerException(message: 'no_internet_connection');
    } else if (error.error is TimeoutException) {
      return const ServerException(message: 'timeout_error');
    } else {
      return const ServerException(message: AppConst.errorText);
    }
  }

  Future<Map<String, String>> _buildHeaders(
    bool authenticated,
    Map<String, String>? additionalHeaders,
  ) async {
    final headers = <String, String>{
      'Content-Type': 'application/json',
      'X-Device-ID': await DeviceUtils.getDeviceId() ?? '',
      'Accept-Language': EasyLocalization.of(
        NavigatorKey.context,
      )!.locale.languageCode,
    };

    if (authenticated) {
      final token = await _secureStorage.getToken();
      headers['Authorization'] = 'Bearer $token';
    }

    if (additionalHeaders != null) {
      headers.addAll(additionalHeaders);
    }

    return headers;
  }

  void _checkIfNeedLogin(Response? response) async {
    if (response?.statusCode == StatusCode.unauthorized) {
      await _secureStorage.logout();
      NavigatorKey.context.navigateToPageWithClearStack(const LoginPage());
    }
  }
}
