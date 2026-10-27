import 'package:flutter/material.dart';
import 'package:kcalm/UI/behaviors/AppLocalizations.dart';
import 'package:kcalm/UI/widgets/GoalCard.dart';
import 'package:kcalm/model/objects/Enums.dart';
import 'package:kcalm/UI/pages/onboarding/AboutYouPage.dart';

class GoalPage extends StatefulWidget{
  const GoalPage({super.key});

  @override
  State<GoalPage> createState() => _GoalPageState();
}


class _GoalPageState extends State<GoalPage> {
    Goal _obiettivo = Goal.dimagrire; // di default imposto questa nello stato

  @override
  Widget build(BuildContext context) {
    final testi = AppLocalizations.of(context);
    final colori = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              testi.translate('onboarding_step1'),
              style: Theme.of(context).textTheme.labelMedium
            ),
            const SizedBox(height: 6),
            const LinearProgressIndicator(value: 0.5), // barra a metà
          ],
        )
      ),
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  testi.translate('goal_title'),
                  style: Theme.of(context).textTheme.headlineSmall
                ),
                Text(
                    testi.translate('goal_subtitle'),
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: colori.onSurfaceVariant)
                ),
                const SizedBox(height: 24), // primo Obiettivo: dimagrire
                GoalCard(
                    icona: Icons.trending_down,
                    titolo: testi.translate('goal_lose'),
                    descrizione: testi.translate('goal_lose_desc'),
                    selezionata: _obiettivo == Goal.dimagrire,
                    onTap: () => setState(() => _obiettivo = Goal.dimagrire),
                ),
                const SizedBox(height: 12), // secondo Obiettivo: mantenere
                GoalCard(
                  icona: Icons.trending_flat,
                  titolo: testi.translate('goal_keep'),
                  descrizione: testi.translate('goal_keep_desc'),
                  selezionata: _obiettivo == Goal.mantenere,
                  onTap: () => setState(() => _obiettivo = Goal.mantenere),
                ),
                const SizedBox(height: 12), // terzo Obiettivo: aumentare
                GoalCard(
                  icona: Icons.trending_up,
                  titolo: testi.translate('goal_gain'),
                  descrizione: testi.translate('goal_gain_desc'),
                  selezionata: _obiettivo == Goal.aumentare,
                  onTap: () => setState(() => _obiettivo = Goal.aumentare),
                ),
                const Spacer(),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => AboutYouPage(obiettivo: _obiettivo),
                        ),
                    ),
                    child: Text(testi.translate('continue')),
                  ),
                ),
              ],
            ),
          ),
      ),
    );
  }
}


