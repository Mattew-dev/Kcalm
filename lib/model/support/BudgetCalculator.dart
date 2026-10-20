import 'package:kcalm/model/objects/Enums.dart';
import 'dart:math';

class BudgetCalculator {

  ///coefficienti della formula di Mifflin
  static const coeffPeso = 10;
  static const coeffAltezza = 6.25;
  static const coeffEta = 5;
  static const coeffSexUomo = 5;
  static const coeffSexDonna = -161;

  ///parametri kcal
  static const minimoGiornaliero = 1200;
  static const passoArrotondamento = 10;

  BudgetCalculator._();

  static void _checkPositivo(String nome, num paramentro){
    if(paramentro<=0){
      throw ArgumentError.value(paramentro, nome, 'deve essere >0');
    }
  }

  /// BMR calcolato con la formula di Mifflin-St Jeor
  static double bmr({required Sex sesso, required int eta, required double altezzaCm, required double pesoKg }){
    _checkPositivo('eta', eta);
    _checkPositivo('altezzaCm', altezzaCm);
    _checkPositivo('pesoKg', pesoKg);
    final s = switch(sesso){
      Sex.uomo => coeffSexUomo,
      Sex.donna => coeffSexDonna
    };
    return coeffPeso*pesoKg + coeffAltezza*altezzaCm - coeffEta*eta + s;
  }

  /// Calcolatore budget calorico giornaliero
  static int dailyBudget({required Sex sesso, required int eta, required double altezzaCm, required double pesoKg, required ActivityLevel attivita, required Goal obiettivo}){
      double bmrCalc = BudgetCalculator.bmr(sesso: sesso, eta: eta, altezzaCm: altezzaCm, pesoKg: pesoKg);
      double fabbisogno = bmrCalc * attivita.fattore + obiettivo.deltaKcal;
      int arrotondamento = (fabbisogno/passoArrotondamento).round() * passoArrotondamento;
      return max(minimoGiornaliero, arrotondamento);
  }

}