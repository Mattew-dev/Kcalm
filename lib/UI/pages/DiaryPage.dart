import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalm/UI/behaviors/AppLocalizations.dart';
import 'package:kcalm/UI/widgets/charts/CalorieRing.dart';
import 'package:kcalm/model/providers/ProfileProvider.dart';


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

    if(profilo == null){
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator()
        )
      );
    }

    const mangiate = 0;
    const bruciate = 0;
    final totali=profilo.budgetGiornaliero+bruciate;

    return Scaffold(
      appBar: AppBar(title: Text(testi.translate('today'))),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
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
        ],
      ),
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

}
