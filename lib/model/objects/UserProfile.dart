import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kcalm/model/objects/Enums.dart';
import 'package:kcalm/model/support/BudgetCalculator.dart';

part 'UserProfile.freezed.dart';
part 'UserProfile.g.dart';

@freezed
abstract class UserProfile with _$UserProfile {
  const UserProfile._();

  const factory UserProfile({
        required Sex sesso,
        required int eta,
        required double altezzaCm,
        required double pesoKg,
        required ActivityLevel attivita,
        required Goal obiettivo,
        required double pesoObiettivoKg,
  }) = _UserProfile;

  factory UserProfile.fromJson(Map<String, dynamic> json) => _$UserProfileFromJson(json);

  int get budgetGiornaliero => BudgetCalculator.dailyBudget(
      sesso: sesso,
      eta: eta,
      altezzaCm: altezzaCm,
      pesoKg: pesoKg,
      attivita: attivita,
      obiettivo: obiettivo,
  );

}