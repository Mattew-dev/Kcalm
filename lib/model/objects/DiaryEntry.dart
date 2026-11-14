import 'package:kcalm/model/objects/Enums.dart';
import 'package:kcalm/model/objects/Food.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'DiaryEntry.freezed.dart';

@freezed
abstract class DiaryEntry with _$DiaryEntry{
  const DiaryEntry._();

  const factory DiaryEntry({
    int? id,
    required Food alimento,
    required MealType pasto,
    required double quantita,
    required double kcal,
    required double carboidratiG,
    required double proteineG,
    required double grassiG,
    required DateTime giorno,
    required DateTime registrato
  }) = _DiaryEntry;

  factory DiaryEntry.daAlimento({
    required Food alimento,
    required MealType pasto,
    required double quantita,
    required DateTime momento
  }) {
    return DiaryEntry(
        alimento: alimento,
        pasto: pasto,
        quantita: quantita,
        kcal: alimento.kcalPer(quantita),
        carboidratiG: alimento.carboidratiPer(quantita),
        proteineG: alimento.proteinePer(quantita),
        grassiG: alimento.grassiPer(quantita),
        giorno: DateTime(momento.year, momento.month, momento.day),
        registrato: momento
    );
  }

}