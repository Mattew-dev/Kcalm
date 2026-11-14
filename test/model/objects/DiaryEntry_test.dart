import 'package:flutter_test/flutter_test.dart';
import 'package:kcalm/model/objects/DiaryEntry.dart';
import 'package:kcalm/model/objects/Enums.dart';
import 'package:kcalm/model/objects/Food.dart';

void main(){

  group('DiaryEntry', (){
    // penne: valori per 100 g
    const penne = Food(nome: 'Penne rigate', kcal100: 359, carboidrati100: 71, proteine100: 12.5, grassi100: 2);

    // pranzo del 6 novembre alle 13:05
    final voce = DiaryEntry.daAlimento(
      alimento: penne,
      pasto: MealType.pranzo,
      quantita: 80,
      momento: DateTime(2026, 11, 6, 13, 5),
    );

    test('daAlimento calcola le kcal -> 287,2', (){
      expect(voce.kcal, closeTo(287.2, 0.01));
    });

    test('daAlimento calcola i macro', (){
      expect(voce.carboidratiG, closeTo(56.8, 0.01));
      expect(voce.proteineG, closeTo(10, 0.01));
      expect(voce.grassiG, closeTo(1.6, 0.01));
    });

    test('il giorno è a mezzanotte, registrato all ora esatta', (){
      expect(voce.giorno, DateTime(2026, 11, 6));
      expect(voce.registrato, DateTime(2026, 11, 6, 13, 5));
    });

    test('la voce tiene la copia delle kcal anche se l alimento cambia', (){
      final penneCorrette = penne.copyWith(kcal100: 500);

      expect(voce.kcal, closeTo(287.2, 0.01));
      expect(penneCorrette.kcalPer(80), closeTo(400, 0.01));
    });
  });

}
