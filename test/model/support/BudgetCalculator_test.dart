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


  // dailyBudget test
  group('dailyBudget', (){
    test('uomo, 27 anni, 178cm, 74.2kg, leggermente attivo, dimagrire -> 1970', (){
      expect(
        BudgetCalculator.dailyBudget(sesso: Sex.uomo, eta: 27, altezzaCm: 178, pesoKg: 74.2, attivita: ActivityLevel.leggermenteAttivo, obiettivo: Goal.dimagrire),
        1970);
    });
    test('donna, 30 anni, 165cm, 60kg, sedentaria, mantenere', (){
      expect(
        BudgetCalculator.dailyBudget(sesso: Sex.donna, eta: 30, altezzaCm: 165, pesoKg: 60, attivita: ActivityLevel.sedentario, obiettivo: Goal.mantenere),
        1580);
    });
    test('uomo, 25 anni, 180cm, 80kg, moderatamente attivo, auomentare', (){
      expect(
        BudgetCalculator.dailyBudget(sesso: Sex.uomo, eta: 25, altezzaCm: 180, pesoKg: 80, attivita: ActivityLevel.moderato, obiettivo: Goal.aumentare),
        3100);
    });
    test('donna, 60 anni, 150cm, 45kg, sedentaria, diamagrire', (){
      expect(
        BudgetCalculator.dailyBudget(sesso: Sex.donna, eta: 60, altezzaCm: 150, pesoKg: 45, attivita: ActivityLevel.sedentario, obiettivo: Goal.dimagrire),
        1200);
    });
  });


}