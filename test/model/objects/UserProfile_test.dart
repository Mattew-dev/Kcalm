import 'package:flutter_test/flutter_test.dart';
import 'package:kcalm/model/objects/UserProfile.dart';
import 'package:kcalm/model/objects/Enums.dart';

void main() {

  group('UserProfile', (){
    // calcolata da oggi: il profilo ha sempre 27 anni, anche l'anno prossimo
    final dataNascita = DateTime(DateTime.now().year - 27, 1, 1);

    final user = UserProfile(sesso: Sex.uomo, dataNascita: dataNascita, altezzaCm: 178, pesoKg: 74.2, attivita: ActivityLevel.leggermenteAttivo, obiettivo: Goal.dimagrire, pesoObiettivoKg: 70);
    test('copyWith cambio solo il peso', (){
      final cambioPeso = user.copyWith(pesoKg: 72);

      expect(cambioPeso.pesoKg, 72);
      expect(cambioPeso.eta, 27);
      expect(user.pesoKg, 74.2);
    });

    test('due profili uguali', (){
      final altroUser = UserProfile(sesso: Sex.uomo, dataNascita: dataNascita, altezzaCm: 178, pesoKg: 74.2, attivita: ActivityLevel.leggermenteAttivo, obiettivo: Goal.dimagrire, pesoObiettivoKg: 70);

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

    group('etaAl', (){
      final nato14Marzo = user.copyWith(dataNascita: DateTime(1999, 3, 14));

      test('compleanno non ancora arrivato -> 26', (){
        expect(nato14Marzo.etaAl(DateTime(2026, 3, 13)), 26);
      });

      test('il giorno del compleanno -> 27', (){
        expect(nato14Marzo.etaAl(DateTime(2026, 3, 14)), 27);
      });

      test('compleanno già passato -> 27', (){
        expect(nato14Marzo.etaAl(DateTime(2026, 3, 15)), 27);
      });
    });

  });

}
