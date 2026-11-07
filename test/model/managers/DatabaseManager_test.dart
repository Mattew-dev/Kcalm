import 'package:flutter_test/flutter_test.dart';
import 'package:kcalm/model/managers/DatabaseManager.dart';
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
    test('crea tutte le tabelle', () async{
      final tabelle = await manager.nomiTabelle();

      expect(tabelle, containsAll(['profilo', 'alimenti', 'diario', 'pesi', 'passi']));
    });
  });

}
