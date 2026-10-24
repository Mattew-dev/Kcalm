import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kcalm/model/objects/Enums.dart';
import 'package:kcalm/model/objects/UserProfile.dart';
import 'package:kcalm/model/providers/ProfileProvider.dart';

void main() {
  group('Profile', () {
    // profilo caso B
    const profilo = UserProfile(
      sesso: Sex.uomo,
      eta: 27,
      altezzaCm: 178,
      pesoKg: 74.2,
      attivita: ActivityLevel.leggermenteAttivo,
      obiettivo: Goal.dimagrire,
      pesoObiettivoKg: 70,
    );

    test('all avvio il profilo non esiste', () {
      final container = ProviderContainer.test();

      expect(container.read(profileProvider), isNull);
    });

    test('impostaProfilo salva il profilo ricevuto', () {
      final container = ProviderContainer.test();
      container.read(profileProvider.notifier).impostaProfilo(profilo);

      expect(container.read(profileProvider), profilo);
    });

    test('aggiornaPeso cambia solo il peso e ricalcola il budget → 1940', () {
      final container = ProviderContainer.test();
      final notifier = container.read(profileProvider.notifier);
      notifier.impostaProfilo(profilo);

      notifier.aggiornaPeso(72);

      final stato = container.read(profileProvider);
      expect(stato?.pesoKg, 72);
      expect(stato?.eta, 27);
      expect(stato?.budgetGiornaliero, 1940);
    });

    test('aggiornaObiettivo da dimagrire a mantenere → 2370', () {
      final container = ProviderContainer.test();
      final notifier = container.read(profileProvider.notifier);
      notifier.impostaProfilo(profilo);

      notifier.aggiornaObiettivo(Goal.mantenere);

      final stato = container.read(profileProvider);
      expect(stato?.obiettivo, Goal.mantenere);
      expect(stato?.budgetGiornaliero, 2370);
    });

    test('aggiornaAttivita cambia solo il livello di attività', () {
      final container = ProviderContainer.test();
      final notifier = container.read(profileProvider.notifier);
      notifier.impostaProfilo(profilo);

      notifier.aggiornaAttivita(ActivityLevel.moderato);

      final stato = container.read(profileProvider);
      expect(stato?.attivita, ActivityLevel.moderato);
      expect(stato?.obiettivo, Goal.dimagrire);
    });

    test('aggiornaPeso senza profilo non fa niente', () {
      final container = ProviderContainer.test();
      container.read(profileProvider.notifier).aggiornaPeso(72);

      expect(container.read(profileProvider), isNull);
    });
  });
}
