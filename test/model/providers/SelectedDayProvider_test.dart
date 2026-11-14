import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kcalm/model/providers/SelectedDayProvider.dart';

void main(){

  group('SelectedDay', (){
    final adesso = DateTime.now();
    final oggi = DateTime(adesso.year, adesso.month, adesso.day);

    test('all avvio è oggi a mezzanotte', (){
      final container = ProviderContainer.test();

      expect(container.read(selectedDayProvider), oggi);
    });

    test('giornoPrecedente -> ieri', (){
      final container = ProviderContainer.test();
      container.read(selectedDayProvider.notifier).giornoPrecedente();

      expect(container.read(selectedDayProvider), DateTime(oggi.year, oggi.month, oggi.day - 1));
    });

    test('giornoSuccessivo dopo giornoPrecedente -> di nuovo oggi', (){
      final container = ProviderContainer.test();
      final notifier = container.read(selectedDayProvider.notifier);
      notifier.giornoPrecedente();
      notifier.giornoSuccessivo();

      expect(container.read(selectedDayProvider), oggi);
    });

    test('indietro di 40 giorni cambia mese senza errori', (){
      final container = ProviderContainer.test();
      final notifier = container.read(selectedDayProvider.notifier);
      for(var i = 0; i < 40; i++){
        notifier.giornoPrecedente();
      }

      expect(container.read(selectedDayProvider), DateTime(oggi.year, oggi.month, oggi.day - 40));
    });
  });

}
