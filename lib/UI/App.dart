import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:kcalm/UI/behaviors/AppLocalizations.dart';
import 'package:kcalm/UI/pages/Layout.dart';
import 'package:kcalm/UI/aspects/AppTheme.dart';

class App extends StatelessWidget{
  const App({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Kcalm',
      localizationsDelegates: [ // aggiungo i delegati per la traduzione
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('it'),
        Locale('en'),
      ],
      theme: AppTheme.chiaro,
      darkTheme: AppTheme.scuro,
      themeMode: ThemeMode.system,
      home: const Layout(),
    );
  }
}