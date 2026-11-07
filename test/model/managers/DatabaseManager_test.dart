import 'package:flutter_test/flutter_test.dart';
import 'package:kcalm/model/managers/DatabaseManager.dart';
import 'package:kcalm/model/objects/Enums.dart';
import 'package:kcalm/model/objects/UserProfile.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main(){

  late DatabaseManager manager;

  // SQLite per il computer, nei test non c'è il telefono
  setUpAll((){
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  });

  // db vuoto in memoria per ogni test
  setUp((){
    manager = DatabaseManager(percorso: inMemoryDatabasePath);
  });

  tearDown(() async{
    await manager.chiudi();
  });

  group('DatabaseManager', (){
    // data fissa: il test dà sempre lo stesso risultato
    final profilo = UserProfile(
      sesso: Sex.uomo,
      dataNascita: DateTime(1999, 3, 14),
      altezzaCm: 178,
      pesoKg: 74.2,
      attivita: ActivityLevel.leggermenteAttivo,
      obiettivo: Goal.dimagrire,
      pesoObiettivoKg: 70,
    );

    test('crea tutte le tabelle', () async{
      final tabelle = await manager.nomiTabelle();

      expect(tabelle, containsAll(['profilo', 'alimenti', 'diario', 'pesi', 'passi']));
    });
    test('le chiavi esterne sono attive', () async{
      expect(await manager.chiaviEsterneAttive(), isTrue);
    });

    test('senza profilo caricaProfilo restituisce null', () async{
      expect(await manager.caricaProfilo(), isNull);
    });

    test('creaProfilo e caricaProfilo restituiscono lo stesso profilo', () async{
      await manager.creaProfilo(profilo);

      expect(await manager.caricaProfilo(), profilo);
    });

    test('un secondo profilo viene rifiutato', () async{
      await manager.creaProfilo(profilo);

      expect(manager.creaProfilo(profilo), throwsA(anything));
    });

    test('aggiungiPesata cambia il peso attuale', () async{
      await manager.creaProfilo(profilo);
      await manager.aggiungiPesata(72);

      final caricato = await manager.caricaProfilo();
      expect(caricato?.pesoKg, 72);
    });

    test('aggiornaProfilo cambia l obiettivo', () async{
      await manager.creaProfilo(profilo);
      await manager.aggiornaProfilo(profilo.copyWith(obiettivo: Goal.mantenere));

      final caricato = await manager.caricaProfilo();
      expect(caricato?.obiettivo, Goal.mantenere);
    });
  });

}
