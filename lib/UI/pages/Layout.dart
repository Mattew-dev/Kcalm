import 'package:flutter/material.dart';
import 'package:kcalm/UI/App.dart';
import 'package:kcalm/UI/pages/DiaryPage.dart';
import 'package:kcalm/UI/pages/AddFoodPage.dart';
import 'package:kcalm/UI/pages/WeightPage.dart';
import 'package:kcalm/UI/pages/ProfilePage.dart';
import 'package:kcalm/UI/behaviors/AppLocalizations.dart';

class Layout extends StatefulWidget{
  const Layout({super.key});

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout>{
  int _indice = 0;

  /// Navigation Bar
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: IndexedStack(
        index: _indice,
        children: const [DiaryPage(), AddFoodPage(), WeightPage(), ProfilePage()],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _indice,
        onDestinationSelected: (i)=>setState(() => _indice = i),
        destinations: [
          NavigationDestination(
              icon: const Icon(Icons.menu_book_outlined),
              selectedIcon: const Icon(Icons.menu_book),
              label: AppLocalizations.of(context)!.translate('diary')),
          NavigationDestination(
              icon: Icon(Icons.add_circle_outline),
              selectedIcon: Icon(Icons.add_circle),
              label: AppLocalizations.of(context)!.translate('add')),
          NavigationDestination(
              icon: Icon(Icons.monitor_weight_outlined),
              selectedIcon: Icon(Icons.monitor_weight),
              label: AppLocalizations.of(context)!.translate('weight')),
          NavigationDestination(
              icon: Icon(Icons.person_outline),
              selectedIcon: Icon(Icons.person),
              label: AppLocalizations.of(context)!.translate('profile')),
        ],
      ),
    );
  }
}