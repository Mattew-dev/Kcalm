import 'package:flutter/material.dart';
import 'package:kcalm/UI/pages/Layout.dart';
import 'package:kcalm/UI/aspects/AppTheme.dart';

class App extends StatelessWidget{
  const App({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Kcalm',
      theme: AppTheme.chiaro,
      darkTheme: AppTheme.scuro,
      themeMode: ThemeMode.system,
      home: const Layout(),
    );
  }
}