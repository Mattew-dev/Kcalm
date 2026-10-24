import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:kcalm/model/objects/UserProfile.dart';
import 'package:kcalm/model/objects/Enums.dart';

part 'ProfileProvider.g.dart';

@riverpod
class Profile extends _$Profile{

  @override
  UserProfile? build(){
    return null;
  }

  void impostaProfilo(UserProfile profilo){
     state = profilo;
  }

  void aggiornaPeso(double nuovoPeso){
      final attuale = state;
      if(attuale == null) return;
      state = attuale.copyWith(pesoKg: nuovoPeso);
  }

  void aggiornaObiettivo(Goal nuovoObiettivo){
    final attuale = state;
    if(attuale == null) return;
    state = attuale.copyWith(obiettivo: nuovoObiettivo);
  }

  void aggiornaAttivita(ActivityLevel nuovoLivelloAttivita){
    final attuale = state;
    if(attuale==null)return;
    state = attuale.copyWith(attivita: nuovoLivelloAttivita);
  }
}