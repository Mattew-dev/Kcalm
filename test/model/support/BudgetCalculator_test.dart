import 'package:flutter_test/flutter_test.dart';
import 'package:kcalm/model/objects/Enums.dart';
import 'package:kcalm/model/support/BudgetCalculator.dart';

void main(){

  // BMR test nomrale + errore
  group('bmr', (){
    test('uomo, 27 anni, 178 cm, 74,2 kg → 1724,5', (){
      expect(
          BudgetCalculator.bmr(sesso: Sex.uomo, eta: 27, altezzaCm: 178, pesoKg: 74.2),
          closeTo(1724.5, 0.01));
    });
    test('donna, 30 anni, 165cm, 60kg -> 1320,25', (){
      expect(
          BudgetCalculator.bmr(sesso: Sex.donna, eta: 30, altezzaCm: 165, pesoKg: 60),
          closeTo(1320.25,0.01));
    });

    test('BMR lancia ArgumentoError con input sbagliati', (){
      expect(
          () => BudgetCalculator.bmr(sesso: Sex.donna, eta: -30, altezzaCm: 165, pesoKg: 60),
          throwsArgumentError);
    });
  });




}