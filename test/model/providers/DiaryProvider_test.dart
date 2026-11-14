import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kcalm/model/Model.dart';
import 'package:kcalm/model/managers/DatabaseManager.dart';
import 'package:kcalm/model/objects/DiaryEntry.dart';
import 'package:kcalm/model/objects/Enums.dart';
import 'package:kcalm/model/objects/Food.dart';
import 'package:kcalm/model/providers/DiaryProvider.dart';
import 'package:kcalm/model/providers/SelectedDayProvider.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main(){

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

  group('Diary', (){
    // penne: valori per 100 g
    const penne = Food(nome: 'Penne rigate', kcal100: 359, carboidrati100: 71, proteine100: 12.5, grassi100: 2);

    final adesso = DateTime.now();

    test('all avvio il diario di oggi è vuoto', () async{
      final container = ProviderContainer.test();

      expect(await container.read(diaryProvider.future), isEmpty);
    });

    test('aggiungiVoce salva e aggiorna il diario di oggi', () async{
      final container = ProviderContainer.test();
      final voce = DiaryEntry.daAlimento(alimento: penne, pasto: MealType.pranzo, quantita: 80, momento: adesso);

      await container.read(diaryProvider.notifier).aggiungiVoce(voce);

      final voci = await container.read(diaryProvider.future);
      expect(voci.length, 1);
      expect(voci.first.kcal, closeTo(287.2, 0.01));
      expect(voci.first.id, isNotNull);
    });

    test('cambiando giorno il diario mostra le voci di quel giorno', () async{
      final container = ProviderContainer.test();
      final ieri = DateTime(adesso.year, adesso.month, adesso.day - 1, 20, 30);
      final voceDiIeri = DiaryEntry.daAlimento(alimento: penne, pasto: MealType.cena, quantita: 100, momento: ieri);

      await container.read(diaryProvider.notifier).aggiungiVoce(voceDiIeri);
      expect(await container.read(diaryProvider.future), isEmpty);

      container.read(selectedDayProvider.notifier).giornoPrecedente();
      final voci = await container.read(diaryProvider.future);
      expect(voci.length, 1);
      expect(voci.first.pasto, MealType.cena);
    });
  });

}
