import 'package:get/get.dart';

import '../controllers/table_ativo_controller.dart';

class TableAtivoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TableAtivoController>(
      () => TableAtivoController(),
    );
  }
}
