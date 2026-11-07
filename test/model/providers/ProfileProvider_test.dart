import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kcalm/model/Model.dart';
import 'package:kcalm/model/managers/DatabaseManager.dart';
import 'package:kcalm/model/objects/Enums.dart';
import 'package:kcalm/model/objects/UserProfile.dart';
import 'package:kcalm/model/providers/ProfileProvider.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {

  late DatabaseManager manager;

  // SQLite per il computer, nei test non c'è il telefono
  setUpAll((){
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  });

  // il Model usa un db vuoto in memoria per ogni test
  setUp((){
    manager = DatabaseManager(percorso: inMemoryDatabasePath);
    Model.instance.usaDatabase(manager);
  });

  tearDown(() async{
    await manager.chiudi();
  });

  group('Profile', () {
    // profilo caso B
    final profilo = UserProfile(
      sesso: Sex.uomo,
      dataNascita: DateTime(DateTime.now().year - 27, 1, 1),
      altezzaCm: 178,
      pesoKg: 74.2,
      attivita: ActivityLevel.leggermenteAttivo,
      obiettivo: Goal.dimagrire,
      pesoObiettivoKg: 70,
    );

    test('all avvio il profilo non esiste', () {
      final container = ProviderContainer.test();

      expect(container.read(profileProvider), isNull);
    });

    test('impostaProfilo aggiorna lo stato e salva nel db', () async{
      final container = ProviderContainer.test();
      await container.read(profileProvider.notifier).impostaProfilo(profilo);

      expect(container.read(profileProvider), profilo);
      expect(await Model.instance.caricaProfilo(), profilo);
    });

    test('ripristinaProfilo imposta lo stato ma non salva nel db', () async{
      final container = ProviderContainer.test();
      container.read(profileProvider.notifier).ripristinaProfilo(profilo);

      expect(container.read(profileProvider), profilo);
      expect(await Model.instance.caricaProfilo(), isNull);
    });

    test('aggiornaPeso cambia solo il peso e ricalcola il budget → 1940', () async{
      final container = ProviderContainer.test();
      final notifier = container.read(profileProvider.notifier);
      await notifier.impostaProfilo(profilo);

      await notifier.aggiornaPeso(72);

      final stato = container.read(profileProvider);
      expect(stato?.pesoKg, 72);
      expect(stato?.eta, 27);
      expect(stato?.budgetGiornaliero, 1940);

      final salvato = await Model.instance.caricaProfilo();
      expect(salvato?.pesoKg, 72);
    });

    test('aggiornaObiettivo da dimagrire a mantenere → 2370', () async{
      final container = ProviderContainer.test();
      final notifier = container.read(profileProvider.notifier);
      await notifier.impostaProfilo(profilo);

      await notifier.aggiornaObiettivo(Goal.mantenere);

      final stato = container.read(profileProvider);
      expect(stato?.obiettivo, Goal.mantenere);
      expect(stato?.budgetGiornaliero, 2370);

      final salvato = await Model.instance.caricaProfilo();
      expect(salvato?.obiettivo, Goal.mantenere);
    });

    test('aggiornaAttivita cambia solo il livello di attività', () async{
      final container = ProviderContainer.test();
      final notifier = container.read(profileProvider.notifier);
      await notifier.impostaProfilo(profilo);

      await notifier.aggiornaAttivita(ActivityLevel.moderato);

      final stato = container.read(profileProvider);
      expect(stato?.attivita, ActivityLevel.moderato);
      expect(stato?.obiettivo, Goal.dimagrire);

      final salvato = await Model.instance.caricaProfilo();
      expect(salvato?.attivita, ActivityLevel.moderato);
    });

    test('aggiornaPeso senza profilo non fa niente', () async{
      final container = ProviderContainer.test();
      await container.read(profileProvider.notifier).aggiornaPeso(72);

      expect(container.read(profileProvider), isNull);
      expect(await Model.instance.caricaProfilo(), isNull);
    });
  });
}
