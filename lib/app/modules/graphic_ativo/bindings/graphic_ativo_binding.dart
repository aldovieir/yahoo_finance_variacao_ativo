import 'package:get/get.dart';

import '../controllers/graphic_ativo_controller.dart';

class GraphicAtivoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GraphicAtivoController>(
      () => GraphicAtivoController(),
    );
  }
}
