import 'package:get/get.dart';

import '../modules/graphic_ativo/bindings/graphic_ativo_binding.dart';
import '../modules/graphic_ativo/views/graphic_ativo_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/table_ativo/bindings/table_ativo_binding.dart';
import '../modules/table_ativo/views/table_ativo_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: Paths.HOME,
      page: () => const HomeView(),
      bindings: [
        HomeBinding(),
        TableAtivoBinding(),
        GraphicAtivoBinding(),
      ],
    ),
    GetPage(
      name: Paths.TABLE_ATIVO,
      page: () => const TableAtivoView(),
      binding: TableAtivoBinding(),
    ),
    GetPage(
      name: Paths.GRAPHIC_ATIVO,
      page: () => const GraphicAtivoView(),
      binding: GraphicAtivoBinding(),
    ),
  ];
}
