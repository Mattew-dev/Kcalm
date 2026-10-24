import 'package:flutter/material.dart';
import 'package:kcalm/UI/behaviors/AppLocalizations.dart';
import 'package:kcalm/UI/pages/onboarding/GoalPage.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final testi = AppLocalizations.of(context);
    final colori = Theme.of(context).colorScheme;
    final stili = Theme.of(context).textTheme;
    
    return Scaffold(
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                const Spacer(),
                CircleAvatar(
                  radius: 70,
                  backgroundColor: colori.primaryContainer,
                  child: Icon(Icons.eco, size: 64, color: colori.primary),
                ),
                const SizedBox(height: 32),
                Text(
                  testi.translate('app_name'),
                  style: stili.labelLarge?.copyWith(color: colori.primary),
                  textAlign: TextAlign.center,
                ),
                Text(
                  testi.translate('welcome_title'),
                  style: stili.headlineMedium,
                  textAlign: TextAlign.center
                ),
                const SizedBox(height: 12),
                Text(
                 testi.translate('welcome_subtitle'),
                 style: stili.bodyLarge?.copyWith(color:colori.onSurfaceVariant),
                 textAlign: TextAlign.center,
                ),
                const Spacer(),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                      onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => const GoalPage()),
                      ),
                      child: Text(testi.translate('welcome_start'))),
                )
              ],
            )
          ),
      ),
    );
  }
}
