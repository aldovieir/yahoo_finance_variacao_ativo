import 'package:desafio_variacao_ativo/app/data/services/http_request.dart';
import 'package:get/get.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<HttpRequest>(HttpRequest());
  }
}
