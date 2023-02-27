import 'package:desafio_variacao_ativo/app/data/repositories/vetores_repository/vetores_repository.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Variação Ativo'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text(
              'Selecione um ativo',
              style: TextStyle(fontSize: 20),
            ),
          ),
          DropdownButton<String>(
            items: controller.listaAtivo,
            onChanged: (ativo) {
              controller.getSelectAtivo(ativo!);
            },
          ),
          const Center(
            child: Text(
              'Selecione como deseja visualizar o ativo',
              style: TextStyle(fontSize: 20),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                Get.toNamed(Paths.TABLE_ATIVO);
              },
              child: const Text(
                "Tabela",
                style: TextStyle(fontSize: 20),
              )),
          ElevatedButton(
              onPressed: () {
                Get.toNamed(Paths.GRAPHIC_ATIVO);
              },
              child: const Text(
                "Grafico",
                style: TextStyle(fontSize: 20),
              )),
        ],
      ),
    );
  }
}
