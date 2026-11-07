import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:kcalm/model/objects/UserProfile.dart';
import 'package:kcalm/model/objects/Enums.dart';
import 'package:kcalm/model/Model.dart';

part 'ProfileProvider.g.dart';

@Riverpod(keepAlive: true)
class Profile extends _$Profile{

  @override
  UserProfile? build(){
    return null;
  }

  //all'avvio il profilo è già salvato ed imposto solo lo stato
  void ripristinaProfilo(UserProfile profilo){
    state = profilo;
  }

  //fine onboarding: creo il profilo nel db
  Future<void> impostaProfilo(UserProfile profilo) async{
    state = profilo;
    await Model.instance.creaProfilo(profilo);
  }

  Future<void> aggiornaPeso(double nuovoPeso) async{
    final attuale = state;
    if(attuale == null) return;
    state = attuale.copyWith(pesoKg: nuovoPeso);
    await Model.instance.aggiungiPesata(nuovoPeso);
  }

  Future<void> aggiornaObiettivo(Goal nuovoObiettivo) async{
    final attuale = state;
    if(attuale == null) return;
    final aggiornato = attuale.copyWith(obiettivo: nuovoObiettivo);
    state = aggiornato;
    await Model.instance.aggiornaProfilo(aggiornato);
  }

  Future<void> aggiornaAttivita(ActivityLevel nuovaAttivita) async{
    final attuale = state;
    if(attuale == null) return;
    final aggiornato = attuale.copyWith(attivita: nuovaAttivita);
    state = aggiornato;
    await Model.instance.aggiornaProfilo(aggiornato);
  }

}