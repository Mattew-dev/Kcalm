import 'package:flutter_test/flutter_test.dart';
import 'package:kcalm/model/objects/Enums.dart';
import 'package:kcalm/model/objects/Food.dart';

void main(){

  group('Food', (){
    // penne: valori per 100 g
    const penne = Food(nome: 'Penne rigate', kcal100: 359, carboidrati100: 71, proteine100: 12.5, grassi100: 2);

    test('80 g di penne -> 287,2 kcal', (){
      expect(penne.kcalPer(80), closeTo(287.2, 0.01));
    });

    test('80 g di penne -> macro giusti', (){
      expect(penne.carboidratiPer(80), closeTo(56.8, 0.01));
      expect(penne.proteinePer(80), closeTo(10, 0.01));
      expect(penne.grassiPer(80), closeTo(1.6, 0.01));
    });

    test('0 g -> 0 kcal', (){
      expect(penne.kcalPer(0), 0);
    });

    test('se non la indico l unita è in grammi', (){
      expect(penne.unita, Unit.g);
    });
  });

}
