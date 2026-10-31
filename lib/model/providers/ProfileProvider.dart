import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:kcalm/model/objects/UserProfile.dart';
import 'package:kcalm/model/objects/Enums.dart';
import 'package:kcalm/model/Model.dart';

part 'ProfileProvider.g.dart';

@riverpod
class Profile extends _$Profile{

  @override
  UserProfile? build(){
    return null;
  }

  void impostaProfilo(UserProfile profilo){
     state = profilo;
     Model.instance.salvaProfilo(profilo);
  }

  void aggiornaPeso(double nuovoPeso){
      final attuale = state;
      if(attuale == null) return;
      final aggiornato = attuale.copyWith(pesoKg: nuovoPeso);
      state = aggiornato;
      Model.instance.salvaProfilo(aggiornato);
  }

  void aggiornaObiettivo(Goal nuovoObiettivo){
    final attuale = state;
    if(attuale == null) return;
    final aggiornato = attuale.copyWith(obiettivo: nuovoObiettivo);
    state = aggiornato;
    Model.instance.salvaProfilo(aggiornato);
  }

  void aggiornaAttivita(ActivityLevel nuovoLivelloAttivita){
    final attuale = state;
    if(attuale==null)return;
    final aggiornato = attuale.copyWith(attivita: nuovoLivelloAttivita);
    state = aggiornato;
    Model.instance.salvaProfilo(aggiornato);
  }
}