import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_boilerplates/core/networks/nets/app_response.dart';
import 'package:flutter_boilerplates/core/networks/nets/app_result.dart';
import 'package:logger/logger.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'client_request.dart';
import 'nets/network_exceptions.dart';

abstract class NetworkService {
  static const requestTimeOut = Duration(seconds: 120);

  static Dio newDio() {
    final dio = Dio(
      BaseOptions(
        baseUrl: '',
        connectTimeout: requestTimeOut,
        receiveTimeout: requestTimeOut,
      ),
    )..interceptors.add(
        PrettyDioLogger(
          request: true,
          requestBody: false,
          responseBody: false,
          error: true,
          compact: true,
        ),
      );

    return dio;
  }

  Future<AppResult<AppResponse>> request(
      {required ClientRequest clientRequest});
}

class NetworkServiceImpl extends NetworkService {
  final Dio _dio = NetworkService.newDio();
  final Logger _logger = Logger(printer: PrettyPrinter(methodCount: 0));

  NetworkServiceImpl();

  @override
  Future<AppResult<AppResponse>> request({
    required ClientRequest clientRequest,
  }) async {
    try {
      final response = await _dio.request(
        clientRequest.url,
        data: clientRequest.body,
        options: Options(
          method: clientRequest.method.value,
          contentType: clientRequest.contentType,
          headers: {...clientRequest.headers ?? {}},
          receiveTimeout: NetworkService.requestTimeOut,
        ),
        queryParameters: clientRequest.query,
        onSendProgress: clientRequest.onSendProgress,
        onReceiveProgress: clientRequest.onReceiveProgress,
      );
      final AppResponse appResponse = clientRequest.isRequestForList
          ? AppResponse.fromJsonToList(response.data)
          : AppResponse.fromJson(response.data);
      return response.statusCode == HttpStatus.ok
          ? AppResult.success(appResponse)
          : AppResult.failure(NetworkExceptions.handleResponse(response));
    } on DioException catch (e) {
      _logger.e(
          'Response: DioError: Code: ${e.response?.statusCode} -- Data: ${e.response?.data}');
      _logger.e('Dio Error Path: ${e.requestOptions.path}');
      throw NetworkExceptions.getDioException(e);
    } catch (e) {
      _logger.e('Some things wrong: ${e.toString()}');
      throw const NetworkExceptions.unexpectedError();
    }
  }
}
