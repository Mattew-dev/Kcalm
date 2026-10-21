// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UserProfile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserProfile _$UserProfileFromJson(Map<String, dynamic> json) => _UserProfile(
  sesso: $enumDecode(_$SexEnumMap, json['sesso']),
  eta: (json['eta'] as num).toInt(),
  altezzaCm: (json['altezzaCm'] as num).toDouble(),
  pesoKg: (json['pesoKg'] as num).toDouble(),
  attivita: $enumDecode(_$ActivityLevelEnumMap, json['attivita']),
  obiettivo: $enumDecode(_$GoalEnumMap, json['obiettivo']),
  pesoObiettivoKg: (json['pesoObiettivoKg'] as num).toDouble(),
);

Map<String, dynamic> _$UserProfileToJson(_UserProfile instance) =>
    <String, dynamic>{
      'sesso': _$SexEnumMap[instance.sesso]!,
      'eta': instance.eta,
      'altezzaCm': instance.altezzaCm,
      'pesoKg': instance.pesoKg,
      'attivita': _$ActivityLevelEnumMap[instance.attivita]!,
      'obiettivo': _$GoalEnumMap[instance.obiettivo]!,
      'pesoObiettivoKg': instance.pesoObiettivoKg,
    };

const _$SexEnumMap = {Sex.uomo: 'uomo', Sex.donna: 'donna'};

const _$ActivityLevelEnumMap = {
  ActivityLevel.sedentario: 'sedentario',
  ActivityLevel.leggermenteAttivo: 'leggermenteAttivo',
  ActivityLevel.moderato: 'moderato',
  ActivityLevel.moltoAttivo: 'moltoAttivo',
};

const _$GoalEnumMap = {
  Goal.dimagrire: 'dimagrire',
  Goal.mantenere: 'mantenere',
  Goal.aumentare: 'aumentare',
};
