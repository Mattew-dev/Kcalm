import 'package:flutter/material.dart';
import 'package:kcalm/UI/behaviors/AppLocalizations.dart';
import 'package:kcalm/model/objects/DiaryEntry.dart';
import 'package:kcalm/model/support/extensions/DiaryTotals.dart';

class MealSection extends StatelessWidget {

  final String titolo;
  final IconData icona;
  final List<DiaryEntry> voci;
  final VoidCallback onAggiungi;

  const MealSection({
    super.key,
    required this.titolo,
    required this.icona,
    required this.voci,
    required this.onAggiungi
  });

  @override
  Widget build(BuildContext context) {
    final testi = AppLocalizations.of(context);
    final colori = Theme.of(context).colorScheme;
    final stili = Theme.of(context).textTheme;

    return Card(
      child: Column(
        children: [
          ListTile(
            leading: Icon(icona, color: colori.primary),
            title: Text(titolo, style: stili.titleMedium),
            subtitle: Text('${voci.kcalTotali.round()} kcal'),
            trailing: IconButton(
              icon: const Icon(Icons.add_circle_outline),
              tooltip: testi.translate('add'),
              onPressed: onAggiungi,
            ),
          ),
          if(voci.isEmpty)
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Text(testi.translate('no_meal'), style: stili.bodyMedium),
            )
          else
            for(final voce in voci)
              ListTile(
                 dense: true,
                 title: Text(voce.alimento.nome),
                 subtitle: Text('${voce.quantita.round()} ${voce.alimento.unita.name}'),
                 trailing: Text('${voce.kcal.round()} kcal'),
              )
        ],
      ),
    );
  }



}
