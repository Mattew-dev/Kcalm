import 'package:flutter_test/flutter_test.dart';
import 'package:kcalm/model/objects/DiaryEntry.dart';
import 'package:kcalm/model/objects/Enums.dart';
import 'package:kcalm/model/objects/Food.dart';
import 'package:kcalm/model/support/extensions/DiaryTotals.dart';

void main(){

  group('TotaliDiario', (){
    // penne e mela: valori per 100 g
    const penne = Food(nome: 'Penne rigate', kcal100: 359, carboidrati100: 71, proteine100: 12.5, grassi100: 2);
    const mela = Food(nome: 'Mela', kcal100: 52, carboidrati100: 14, proteine100: 0.3, grassi100: 0.2);

    final momento = DateTime(2026, 11, 6, 13, 5);
    final voci = [
      DiaryEntry.daAlimento(alimento: penne, pasto: MealType.pranzo, quantita: 80, momento: momento),
      DiaryEntry.daAlimento(alimento: mela, pasto: MealType.spuntino, quantita: 150, momento: momento),
    ];

    test('somma le kcal di tutte le voci -> 365,2', (){
      // 287,2 penne + 78 mela
      expect(voci.kcalTotali, closeTo(365.2, 0.01));
    });

    test('somma i macro di tutte le voci', (){
      expect(voci.carboidratiTotali, closeTo(77.8, 0.01));
      expect(voci.proteineTotali, closeTo(10.45, 0.01));
      expect(voci.grassiTotali, closeTo(1.9, 0.01));
    });

    test('un giorno senza pasti -> tutto 0', (){
      final vuota = <DiaryEntry>[];

      expect(vuota.kcalTotali, 0);
      expect(vuota.carboidratiTotali, 0);
      expect(vuota.proteineTotali, 0);
      expect(vuota.grassiTotali, 0);
    });
  });

}
