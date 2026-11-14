import 'package:kcalm/model/objects/DiaryEntry.dart';

extension TotaliDiario on List<DiaryEntry> {
  double get kcalTotali => fold(0, (somma, voce) => somma + voce.kcal);
  double get carboidratiTotali => fold(0, (somma, voce) => somma + voce.carboidratiG);
  double get proteineTotali => fold(0, (somma, voce) => somma + voce.proteineG);
  double get grassiTotali => fold(0, (somma, voce) => somma + voce.grassiG);
}