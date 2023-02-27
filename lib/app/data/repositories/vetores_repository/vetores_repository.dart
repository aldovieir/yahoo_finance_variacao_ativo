import 'package:dartz/dartz.dart';
import 'package:desafio_variacao_ativo/app/data/models/ativo.dart';
import 'package:desafio_variacao_ativo/app/data/services/http_request.dart';
import 'package:get/get.dart';

class AtivoRepository {
  final HttpRequest _httpRequest = Get.find<HttpRequest>();

  Future<Either<Exception, Ativo>> getAtivo(
      {required String ativo, required int range}) async {
    String url =
        'https://query2.finance.yahoo.com/v8/finance/chart/$ativo?range=${range}mo&interval=1d';

    return await _httpRequest.httpGet<Ativo>(
      path: url,
      fromMapFunc: (map) => Ativo.fromJson(map),
    );
  }
}
