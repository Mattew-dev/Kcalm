import 'dart:convert';
import 'package:kcalm/model/objects/UserProfile.dart';
import 'package:kcalm/model/support/Constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageManager {

  //Salvo il profilo come testo JSON
  Future<void> salvaProfilo(UserProfile profilo) async{
    final prefs = await SharedPreferences.getInstance();
    final testo = jsonEncode(profilo.toJson());
    await prefs.setString(ChiaviStorage.profilo,testo);
  }

  //Rileggo il profilo, restituisce null se non è mai stato salvato
  Future<UserProfile?> caricaProfilo() async{
    final prefs = await SharedPreferences.getInstance();
    final testo = prefs.getString(ChiaviStorage.profilo);
    // primo avvio, non viene salvato
    if(testo == null) return null;
    return UserProfile.fromJson(jsonDecode(testo) as Map<String, dynamic>);
  }

  //cancella il profilo (es. reset da capo)
  Future<void> cancellaProfilo() async{
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(ChiaviStorage.profilo);
  }
}

