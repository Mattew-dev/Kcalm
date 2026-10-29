import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalm/UI/behaviors/AppLocalizations.dart';
import 'package:kcalm/UI/pages/Layout.dart';
import 'package:kcalm/model/objects/Enums.dart';
import 'package:kcalm/model/objects/UserProfile.dart';
import 'package:kcalm/model/providers/ProfileProvider.dart';
import 'package:kcalm/model/support/BudgetCalculator.dart';
import 'package:kcalm/model/support/Constants.dart';

class AboutYouPage extends ConsumerStatefulWidget {
  final Goal obiettivo; // me lo porto dietro visto che l'ho già impostato

  const AboutYouPage({
    super.key,
    required this.obiettivo
  });

  @override
  ConsumerState<AboutYouPage> createState() => _AboutYouPageState();
}

class _AboutYouPageState extends ConsumerState<AboutYouPage> {
  /// STATO DELLA PAGINA
  Sex _sesso = Sex.uomo;
  ActivityLevel _attivita = ActivityLevel.leggermenteAttivo;

  /// CONTROLLER
  final _etaController = TextEditingController();
  final _altezzaController = TextEditingController();
  final _pesoController = TextEditingController();
  final _pesoObiettivoController = TextEditingController();

  @override
  void dispose(){
    _etaController.dispose();
    _altezzaController.dispose();
    _pesoController.dispose();
    _pesoObiettivoController.dispose();

    super.dispose();
  }

  int? get _eta{
    final x = int.tryParse(_etaController.text.trim());
    return (x != null &&
        x >= LimitiProfilo.etaMin &&
        x <= LimitiProfilo.etaMax) ?
    x : null;
  }

  double? get _peso{
    final testo = _pesoController.text.trim().replaceAll(',','.'); // trasforma la virgola in punto
    final x = double.tryParse(testo);
    return (x != null &&
        x >= LimitiProfilo.pesoMin &&
        x <= LimitiProfilo.pesoMax) ?
    x : null;
  }

  double? get _altezza{
    final testo = _altezzaController.text.trim().replaceAll(',','.');
    final x = double.tryParse(testo);
    return (x != null &&
        x >= LimitiProfilo.altezzaMin &&
        x <= LimitiProfilo.altezzaMax) ?
    x : null;
  }

  double? get _pesoObiettivo{
    final testo = _pesoObiettivoController.text.trim().replaceAll(',', '.');
    final x = double.tryParse(testo);
    return (x != null &&
        x >= LimitiProfilo.pesoMin &&
        x <= LimitiProfilo.pesoMax) ?
    x : null;
  }

  ///VALIDA
  bool get _valido => _eta != null && _altezza != null && _peso != null && _pesoObiettivo != null;

  ///BUDGET
  int? get _budget{
    final eta = _eta;
    final altezza = _altezza;
    final peso = _peso;
    if(eta == null || altezza == null || peso == null) return null;

    return BudgetCalculator.dailyBudget(
        sesso: _sesso,
        eta: eta,
        altezzaCm: altezza,
        pesoKg: peso,
        attivita: _attivita,
        obiettivo: widget.obiettivo, //quello ricevuto da GoalPage
    );
  }

  ///CONFERMA
  void _conferma(){
    final eta = _eta;
    final altezza = _altezza;
    final peso = _peso;
    final pesoObiettivo = _pesoObiettivo;
    if(eta == null || altezza == null || peso == null || pesoObiettivo == null) return;

    ref.read(profileProvider.notifier).impostaProfilo(
      UserProfile(
        sesso: _sesso,
        eta: eta,
        altezzaCm: altezza,
        pesoKg: peso,
        attivita: _attivita,
        obiettivo: widget.obiettivo,
        pesoObiettivoKg: pesoObiettivo
      )
    );

    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) =>
        const Layout()
      ), (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    final testi = AppLocalizations.of(context);
    final colori = Theme.of(context).colorScheme;
    final stili = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  testi.translate('onboarding_step2'),
                  style: Theme.of(context).textTheme.labelMedium
              ),
              const SizedBox(height: 6),
              const LinearProgressIndicator(value: 1), // barra piena, completata
            ],
          )
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        testi.translate('about_title'),
                        style: stili.headlineSmall
                    ),
                    const SizedBox(height: 8),
                    Text(
                        testi.translate('about_subtitle'),
                        style: stili.bodyLarge?.copyWith(color: colori.onSurfaceVariant)
                    ),
                    const SizedBox(height: 20),
                    SegmentedButton<Sex>(
                        segments: [
                          ButtonSegment(
                              value: Sex.uomo, 
                              label: Text(testi.translate("sex_uomo"))
                          ),
                          ButtonSegment(
                            value: Sex.donna,
                            label: Text(testi.translate("sex_donna"))
                          )
                        ],
                        selected: {_sesso},
                        onSelectionChanged: (scelta) => setState(() => _sesso = scelta.first),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      controller: _etaController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: testi.translate("age"),
                        border: const OutlineInputBorder(),
                        errorText: (_etaController.text.isNotEmpty && _eta == null) ? testi.translate('errore_eta') : null,
                      ),
                      onChanged: (_) => setState(() {}),
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: _altezzaController,
                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      decoration: InputDecoration(
                        labelText: testi.translate("height"),
                        border: const OutlineInputBorder(),
                        errorText: (_altezzaController.text.isNotEmpty && _altezza == null) ? testi.translate('errore_altezza') : null,
                      ),
                      onChanged: (_) => setState(() {}),
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: _pesoController,
                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      decoration: InputDecoration(
                        labelText: testi.translate("weightt"),
                        border: const OutlineInputBorder(),
                        errorText: (_pesoController.text.isNotEmpty && _peso == null) ? testi.translate('errore_peso') : null,
                      ),
                      onChanged: (_) => setState(() {}),
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: _pesoObiettivoController,
                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      decoration: InputDecoration(
                        labelText: testi.translate("goal_weight"),
                        border: const OutlineInputBorder(),
                        errorText: (_pesoObiettivoController.text.isNotEmpty && _pesoObiettivo == null) ? testi.translate('errore_pesoObiettivo') : null,
                      ),
                      onChanged: (_) => setState(() {}),
                    ),
                    const SizedBox(height: 20),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: ActivityLevel.values.map(
                              (a) => ChoiceChip(
                                  label: Text(testi.translate('activity_${a.name}')),
                                  selected: _attivita == a,
                                  onSelected: (_) => setState(() => _attivita = a),
                              )
                      ).toList(),
                    ),
                    const SizedBox(height: 20),
                    Card(
                      color: colori.primaryContainer,
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Text(
                          _valido ? '${testi.translate('budget_preview')} $_budget ${testi.translate('kcal_day')}'
                              : testi.translate('fill_data'),
                          style: stili.titleMedium,
                        ),
                      )
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: _valido ? _conferma : null,
                  child: Text(testi.translate('start_traking')),
                )
              ),
            ),
          ],
        )
      ),
    );
  }
}
