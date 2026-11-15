import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalm/UI/behaviors/AppLocalizations.dart';
import 'package:kcalm/UI/widgets/cards/MealSection.dart';
import 'package:kcalm/UI/widgets/charts/CalorieRing.dart';
import 'package:kcalm/model/objects/DiaryEntry.dart';
import 'package:kcalm/model/objects/Enums.dart';
import 'package:kcalm/model/objects/Food.dart';
import 'package:kcalm/model/providers/DiaryProvider.dart';
import 'package:kcalm/model/providers/ProfileProvider.dart';
import 'package:kcalm/model/providers/SelectedDayProvider.dart';
import 'package:kcalm/model/support/extensions/DiaryTotals.dart';

class DiaryPage extends ConsumerStatefulWidget {
  const DiaryPage({super.key});

  @override
  ConsumerState<DiaryPage> createState() => _DiaryPageState();
}

class _DiaryPageState extends ConsumerState<DiaryPage> {

  @override
  Widget build(BuildContext context) {
    final testi=AppLocalizations.of(context);
    final profilo=ref.watch(profileProvider);
    final giorno = ref.watch(selectedDayProvider);
    final voci = ref.watch(diaryProvider);

    final adesso = DateTime.now();
    final eOggi=giorno==DateTime(adesso.year, adesso.month, adesso.day);

    if(profilo == null){
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator()
        )
      );
    }

    const bruciate = 0;
    final totali=profilo.budgetGiornaliero+bruciate;

    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          leading:IconButton(
              icon: const Icon(Icons.chevron_left),
              tooltip: testi.translate('prev_day'),
              onPressed: () => ref.read(selectedDayProvider.notifier).giornoPrecedente()
          ),
        title: Text(
          eOggi
              ? testi.translate('today')
              :
              MaterialLocalizations.of(context).formatMediumDate(giorno)
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.chevron_right),
            tooltip: testi.translate('next_day'),
            onPressed: eOggi ? null :
                () => ref.read(selectedDayProvider.notifier).giornoSuccessivo(),
          ),
        ],
      ),
      body: voci.when(
        loading: () => const Center(
          child: CircularProgressIndicator()
        ),
        error: (errore, _) => Center(
          child: Text(testi.translate('errore_caricamento'))
        ),
        data: (vociDelGiorno){
          final mangiate = vociDelGiorno.kcalTotali.round();

          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              // Card Anello
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    children: [
                      CalorieRing(mangiate: mangiate, totali: totali),
                      const SizedBox(height:24),
                      Row(
                        children: [
                          _statistica(
                              context,
                              '$mangiate',
                              testi.translate('eaten')
                          ),
                          _statistica(
                              context,
                              '$bruciate',
                              testi.translate('burned')
                          ),
                          _statistica(
                              context,
                              '${profilo.budgetGiornaliero}',
                              testi.translate('budget')
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              for(final meal in MealType.values)
                MealSection(
                    titolo: testi.translate('meal_${meal.name}'),
                    icona: _iconaMeal(meal),
                    voci: vociDelGiorno.where((v)=> v.pasto == meal).toList(),
                    onAggiungi: (){
                      /* pagina di aggiunta */
                    }
                ),
            ],
          );
        }
      )
    );
  }

  Widget _statistica(BuildContext context, String valore, String etichetta){
    final stili = Theme.of(context).textTheme;
    return Expanded(
      child: Column(
        children: [
          Text(valore, style: stili.titleLarge),
          Text(etichetta, style: stili.labelMedium)
        ],
      ),
    );
  }

  IconData _iconaMeal(MealType meal) => switch (meal){
    MealType.colazione => Icons.free_breakfast_outlined,
    MealType.pranzo => Icons.lunch_dining_outlined,
    MealType.cena => Icons.dinner_dining_outlined,
    MealType.spuntino => Icons.cookie_outlined
  };
}
