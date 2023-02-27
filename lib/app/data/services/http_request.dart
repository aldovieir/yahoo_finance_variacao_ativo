import 'package:dartz/dartz.dart';
import 'package:desafio_variacao_ativo/app/data/interfaces/ihttp_request.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';



class HttpRequest extends GetxService implements IhttpRequestInterface {
  final _dio = Dio();

  @override
  void onInit() {
    _dio.interceptors.add(httpInterceptors());
    super.onInit();
  }

  httpInterceptors() => PrettyDioLogger(
        request: true,
        compact: true,
        error: true,
        requestBody: true,
        requestHeader: true,
        responseBody: true,
      );
  @override
  Future<Either<Exception, T>> httpDelete<T>(
      {required String path, Map<String, dynamic>? params}) async {
    try {
      final request = await _dio.delete(path, queryParameters: params);
      final T formatedMap = request.data;

      return right(formatedMap);
    } on DioError catch (error) {
      return left(error);
    }
  }

  @override
  Future<Either<Exception, T>> httpGet<T>({
    required String path,
    Map<String, dynamic>? params,
    required T Function(dynamic) fromMapFunc,
  }) async {
    try {
      final request = await _dio.get(path, queryParameters: params);
      final formatedMap = fromMapFunc(request.data);
      return right(formatedMap);
    } on DioError catch (error) {
      return left(error);
    }
  }

  @override
  Future<Either<Exception, T>> httpPost<T>(
      {required String path, Map<String, dynamic>? params}) async {
    try {
      final request = await _dio.post(path, data: params);
      final T formatedMap = request.data;

      return right(formatedMap);
    } on DioError catch (error) {
      return left(error);
    }
  }

  @override
  Future<Either<Exception, T>> httpUpdate<T>(
      {required String path, Map<String, dynamic>? params}) async {
    try {
      final request = await _dio.put(path, data: params);
      final T formatedMap = request.data;

      return right(formatedMap);
    } on DioError catch (error) {
      return left(error);
    }
  }
}
