import 'package:kcalm/model/objects/UserProfile.dart';
import 'package:kcalm/model/managers/LocalStorageManager.dart';

class Model{ //SINGLETON
  Model._();

  static final Model instance = Model._();

  final LocalStorageManager _localStorage = LocalStorageManager();

  Future<void> salvaProfilo(UserProfile profilo) =>
      _localStorage.salvaProfilo(profilo);

  Future<UserProfile?> caricaProfilo() =>
      _localStorage.caricaProfilo();

}