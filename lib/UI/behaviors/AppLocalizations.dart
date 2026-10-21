import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppLocalizations {

  final Locale locale;
  AppLocalizations(this.locale);

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationDelegate();
  late Map<String, String> _localizedString;

  static AppLocalizations? of(BuildContext context){
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  /// conversione in String
  Future<bool> load() async{
    String jsonString = await rootBundle.loadString('localizable/${locale.languageCode}.json');
    Map<String, dynamic> jsonMap = json.decode(jsonString);
    _localizedString = jsonMap.map((key, value){
      return MapEntry(key, value.toString());
    });
    return true;
  }

  /// metodo di traduzione
  String translate(String key)=> _localizedString[key]?? '$key -> TESTO DIMENTICATO';
}

class _AppLocalizationDelegate extends LocalizationsDelegate<AppLocalizations>{
  const _AppLocalizationDelegate();

  @override
  bool isSupported(Locale locale) {
    return(locale.languageCode == 'it' || locale.languageCode == 'en');
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    final trad = AppLocalizations(locale);
    await trad.load();
    return trad;
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalizations> old) {
    return false; // le traduzioni non cambiano mentre l'app gira
  }
}
