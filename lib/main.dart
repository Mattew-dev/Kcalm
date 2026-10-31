import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalm/UI/App.dart';
import 'package:kcalm/model/Model.dart';
import 'package:kcalm/model/providers/ProfileProvider.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();

  final profilo = await Model.instance.caricaProfilo();

  //contenitore Riverpod, posso mettere dentro il dato
  final container = ProviderContainer();
  if(profilo != null){
    container.read(profileProvider.notifier).impostaProfilo(profilo);
  }

  runApp(
    UncontrolledProviderScope(
        container: container,
        child: App(primoAvvio: profilo == null),
    ),
  );

}

//void main() => runApp(const ProviderScope(child: App()));
