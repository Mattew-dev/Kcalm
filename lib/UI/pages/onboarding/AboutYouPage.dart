import 'package:flutter/material.dart';
import 'package:kcalm/model/objects/Enums.dart';


class AboutYouPage extends StatefulWidget {
  final Goal obiettivo; // me lo porto dietro visto che l'ho già impostato

  const AboutYouPage({
    super.key,
    required this.obiettivo
  });

  @override
  State<AboutYouPage> createState() => _AboutYouPageState();
}

class _AboutYouPageState extends State<AboutYouPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text('About You Page'),
    );
  }
}
