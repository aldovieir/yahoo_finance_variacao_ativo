import 'package:desafio_variacao_ativo/app/data/models/ativo.dart';
import 'package:desafio_variacao_ativo/app/data/models/ativo_day.dart';
import 'package:desafio_variacao_ativo/app/data/repositories/vetores_repository/vetores_repository.dart';
import 'package:get/get.dart';

class GraphicAtivoController extends GetxController {
  final Rx<List<AtivoDay>> ativoDays = Rx([]);

  final repository = AtivoRepository();

  Rx<String?> ativo = Rx(null);

  Ativo? fristAtivo;

  @override
  void onInit() {
    super.onInit();
    getAtivo();
  }

  Future<void> getAtivo() async {
    if (ativoDays.value.isNotEmpty) return;
    final result =
        await repository.getAtivo(ativo: ativo.value ?? "PETR4.SA", range: 30);

    result.fold((l) => null, (resultAtivo) {
      List<int?> timestamps = resultAtivo.chart!.result!.first!.timestamp!;
      List<double?> opens =
          resultAtivo.chart!.result!.first!.indicators!.quote!.first.open!;

      for (int i = 0; i < timestamps.length - 1; i++) {
        double todayOpen = opens[i]!;
        double yesterdayOpen = opens[i + 1]!;
        double percentageChange =
            (todayOpen - yesterdayOpen) / yesterdayOpen * 100;

        DateTime date =
            DateTime.fromMillisecondsSinceEpoch(timestamps[i]! * 1000);

        ativoDays.value.add(
          AtivoDay(
              day: date, openPrice: opens[i]!, previousDay: percentageChange),
        );
      }
    });
  }
}
