import 'package:dartz/dartz.dart';

abstract class IhttpRequestInterface {
  Future<Either<Exception, T>> httpPost<T>({
    required String path,
    Map<String, dynamic>? params,
  });

  Future<Either<Exception, T>> httpGet<T>({
    required String path,
    required T Function(dynamic) fromMapFunc,
    Map<String, dynamic>? params,
  });

  Future<Either<Exception, T>> httpUpdate<T>({
    required String path,
    Map<String, dynamic>? params,
  });

  Future<Either<Exception, T>> httpDelete<T>({
    required String path,
    Map<String, dynamic>? params,
  });
}
