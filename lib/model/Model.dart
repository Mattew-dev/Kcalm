import 'package:kcalm/model/objects/DiaryEntry.dart';
import 'package:kcalm/model/objects/UserProfile.dart';
import 'package:kcalm/model/managers/DatabaseManager.dart';

class Model{ //SINGLETON
  Model._();

  static final Model instance = Model._();

  DatabaseManager _databaseManager = DatabaseManager();

  //nei test uso un db in memoria
  void usaDatabase(DatabaseManager databaseManager){
    _databaseManager = databaseManager;
  }

  Future<void> creaProfilo(UserProfile profilo) => _databaseManager.creaProfilo(profilo);
  Future<UserProfile?> caricaProfilo() => _databaseManager.caricaProfilo();
  Future<void> aggiungiPesata(double peso) => _databaseManager.aggiungiPesata(peso);
  Future<void> aggiornaProfilo(UserProfile profilo) => _databaseManager.aggiornaProfilo(profilo);
  Future<int> aggiungiVoce(DiaryEntry voce) => _databaseManager.aggiungiVoce(voce);
  Future<List<DiaryEntry>> vociDelGiorno(DateTime giorno) => _databaseManager.vociDelGiorno(giorno);
}