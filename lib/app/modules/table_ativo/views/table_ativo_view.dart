import 'package:collection/collection.dart';
import 'package:desafio_variacao_ativo/app/data/models/ativo_day.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/table_ativo_controller.dart';

class TableAtivoView extends GetView<TableAtivoController> {
  const TableAtivoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 32),
                Table(
                  border: TableBorder.all(
                    width: 1,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  columnWidths: const {
                    0: FlexColumnWidth(1),
                    1: FlexColumnWidth(2.5),
                    2: FlexColumnWidth(2),
                    3: FlexColumnWidth(2),
                    4: FlexColumnWidth(2),
                  },
                  children: [
                    const TableRow(
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(8)),
                      ),
                      children: [
                        _HeaderItem('Dia'),
                        _HeaderItem('Data'),
                        _HeaderItem('Valor'),
                        _HeaderItem('% D-1'),
                      ],
                    ),
                    ...controller.ativoDays.value.toTableRows(),
                  ],
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _HeaderItem extends StatelessWidget {
  const _HeaderItem(this.value);

  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
      child: Center(
          child: Text(
        value,
      )),
    );
  }
}

class _TableItem extends StatelessWidget {
  const _TableItem(this.value);

  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
      child: Center(child: Text(value)),
    );
  }
}

extension on List<AtivoDay> {
  List<TableRow> toTableRows() => mapIndexed(
        (index, item) => TableRow(
          children: [
            _TableItem((index + 1).toString()),
            _TableItem(item.day.toString()),
            _TableItem(item.openPrice.toString()),
            _TableItem(item.previousDay.toString()),
          ],
        ),
      ).toList();
}
