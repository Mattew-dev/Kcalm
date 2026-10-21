import 'package:flutter_test/flutter_test.dart';
import 'package:kcalm/model/objects/UserProfile.dart';
import 'package:kcalm/model/objects/Enums.dart';

void main() {

  group('UserProfile', (){
    final user = const UserProfile(sesso: Sex.uomo, eta: 27, altezzaCm: 178, pesoKg: 74.2, attivita: ActivityLevel.leggermenteAttivo, obiettivo: Goal.dimagrire, pesoObiettivoKg: 70);
    test('copyWith cambio solo il peso', (){
      final cambioPeso = user.copyWith(pesoKg: 72);

      expect(cambioPeso.pesoKg, 72);
      expect(cambioPeso.eta, 27);
      expect(user.pesoKg, 74.2);
    });

    test('due profili uguali', (){
      final altroUser = UserProfile(sesso: Sex.uomo, eta: 27, altezzaCm: 178, pesoKg: 74.2, attivita: ActivityLevel.leggermenteAttivo, obiettivo: Goal.dimagrire, pesoObiettivoKg: 70); //qui il const non va altrimenti mi dice che è un profilo solo con due nomi ma in verità sono due profili uguali

      expect(altroUser, user);
    });

    test('budget giornaliero -> 1970', (){
      expect(user.budgetGiornaliero, 1970);
    });

    test('JSON andata e ritorno restituisce lo stesso user', (){
        final map = user.toJson();
        final riletto = UserProfile.fromJson(map);
        expect(riletto, user);
    });

  });

}