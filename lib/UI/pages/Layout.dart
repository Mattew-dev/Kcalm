import 'package:flutter/material.dart';
//import 'package:kcalm/UI/pages/DiaryPage.dart';
//import 'package:kcalm/UI/pages/AddFoodPage.dart';
//import 'package:kcalm/UI/pages/WeightPage.dart';
//import 'package:kcalm/UI/pages/ProfilePage.dart';

class Layout extends StatefulWidget{
  const Layout({super.key});

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout>{
  int _indice = 0;

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
        destinations: const [
          NavigationDestination(
              icon: Icon(Icons.menu_book_outlined),
              selectedIcon: Icon(Icons.menu_book),
              label: "Diario"),
          NavigationDestination(
              icon: Icon(Icons.add_circle_outline),
              selectedIcon: Icon(Icons.add_circle),
              label: "Aggiungi"),
          NavigationDestination(
              icon: Icon(Icons.monitor_weight_outlined),
              selectedIcon: Icon(Icons.monitor_weight),
              label: "Peso"),
          NavigationDestination(
              icon: Icon(Icons.person_outline),
              selectedIcon: Icon(Icons.person),
              label: "Profilo"),
        ],
      ),
    );
  }
}