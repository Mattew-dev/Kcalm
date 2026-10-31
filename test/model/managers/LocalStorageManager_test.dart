import 'package:flutter_test/flutter_test.dart';
import 'package:kcalm/model/managers/LocalStorageManager.dart';
import 'package:kcalm/model/objects/Enums.dart';
import 'package:kcalm/model/objects/UserProfile.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  group('LocalStorageManager', () {
    // memoria finta e vuota prima di ogni test
    setUp(() {
      TestWidgetsFlutterBinding.ensureInitialized();
      SharedPreferences.setMockInitialValues({});
    });

    // profilo caso B
    const profilo = UserProfile(
      sesso: Sex.uomo,
      eta: 27,
      altezzaCm: 178,
      pesoKg: 74.2,
      attivita: ActivityLevel.leggermenteAttivo,
      obiettivo: Goal.dimagrire,
      pesoObiettivoKg: 70,
    );

    test('senza niente salvato caricaProfilo restituisce null', () async {
      final manager = LocalStorageManager();

      expect(await manager.caricaProfilo(), isNull);
    });

    test('salvaProfilo e caricaProfilo restituiscono lo stesso profilo', () async {
      final manager = LocalStorageManager();
      await manager.salvaProfilo(profilo);

      expect(await manager.caricaProfilo(), profilo);
    });

    test('cancellaProfilo elimina il profilo salvato', () async {
      final manager = LocalStorageManager();
      await manager.salvaProfilo(profilo);
      await manager.cancellaProfilo();

      expect(await manager.caricaProfilo(), isNull);
    });
  });
}
