import 'package:flutter_test/flutter_test.dart';
import 'package:kcalm/model/managers/DatabaseManager.dart';
import 'package:kcalm/model/objects/DiaryEntry.dart';
import 'package:kcalm/model/objects/Enums.dart';
import 'package:kcalm/model/objects/Food.dart';
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

    // penne con codice a barre, valori per 100 g
    const penne = Food(codiceBarre: '8001', nome: 'Penne rigate', marca: 'Esempio', kcal100: 359, carboidrati100: 71, proteine100: 12.5, grassi100: 2);

    test('salvaAlimento restituisce un id', () async{
      final id = await manager.salvaAlimento(penne);

      expect(id, greaterThan(0));
    });

    test('stesso codice a barre -> stesso id', () async{
      final primo = await manager.salvaAlimento(penne);
      final secondo = await manager.salvaAlimento(penne);

      expect(secondo, primo);
    });

    test('aggiungiVoce e vociDelGiorno restituiscono la voce con il suo alimento', () async{
      final voce = DiaryEntry.daAlimento(alimento: penne, pasto: MealType.pranzo, quantita: 80, momento: DateTime(2026, 11, 6, 13, 5));
      await manager.aggiungiVoce(voce);

      final voci = await manager.vociDelGiorno(DateTime(2026, 11, 6));
      expect(voci.length, 1);
      expect(voci.first.pasto, MealType.pranzo);
      expect(voci.first.kcal, closeTo(287.2, 0.01));
      expect(voci.first.registrato, DateTime(2026, 11, 6, 13, 5));

      // l alimento riletto deve essere uguale a quello salvato (a parte l id)
      final alimento = voci.first.alimento;
      expect(alimento.copyWith(id: null), penne);
    });

    test('una voce di ieri non compare oggi', () async{
      final ieri = DiaryEntry.daAlimento(alimento: penne, pasto: MealType.cena, quantita: 100, momento: DateTime(2026, 11, 5, 20, 30));
      await manager.aggiungiVoce(ieri);

      expect(await manager.vociDelGiorno(DateTime(2026, 11, 6)), isEmpty);
      expect((await manager.vociDelGiorno(DateTime(2026, 11, 5))).length, 1);
    });
  });

}
