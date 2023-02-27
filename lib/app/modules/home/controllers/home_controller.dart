import 'package:desafio_variacao_ativo/app/modules/graphic_ativo/controllers/graphic_ativo_controller.dart';
import 'package:desafio_variacao_ativo/app/modules/table_ativo/controllers/table_ativo_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final controllerTable = Get.find<TableAtivoController>();

  final controllerGraphic = Get.find<GraphicAtivoController>();

  Rx<String?> ativo = Rx("");

  List<DropdownMenuItem<String>> listaAtivo = const [
    DropdownMenuItem(
      value: "PETR4.SA",
      child: Text("PETR4.SA"),
    ),
    DropdownMenuItem(
      value: "VALE3.SA",
      child: Text("VALE3.SA"),
    ),
    DropdownMenuItem(
      value: "PETR4.3",
      child: Text("PETR4.3"),
    )
  ];

  getSelectAtivo(String value) {
    ativo.value = value;
    controllerGraphic.ativo.value = value;
    controllerTable.ativo.value = value;
    controllerGraphic.getAtivo();
  }
}
