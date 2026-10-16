import 'package:flutter/material.dart';
import 'package:kcalm/UI/pages/Layout.dart';

class App extends StatelessWidget{
  const App({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Kcalm',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.green,
          brightness: Brightness.light,
        ),
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.green,
          brightness: Brightness.dark,
        ),
      ),
      themeMode: ThemeMode.system,
      home: const Layout(),
    );
  }
}