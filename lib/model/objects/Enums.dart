enum Sex {
  uomo,
  donna
}

/// livello attività fisica, il fattore moltiplica il BMR
enum ActivityLevel {
  sedentario(1.2),
  leggermenteAttivo(1.375),
  moderato(1.55),
  moltoAttivo(1.725);

  const ActivityLevel(this.fattore);
  final double fattore;
}

/// obiettivo da raggiungere in base al deltaKcal
enum Goal {
  dimagrire(-400),
  mantenere(0),
  aumentare(300);

  const Goal(this.deltaKcal);
  final int deltaKcal;
}