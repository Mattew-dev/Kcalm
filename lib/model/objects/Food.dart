import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kcalm/model/objects/Enums.dart';

part 'Food.freezed.dart';

@freezed
abstract class Food with _$Food{
  const Food._();

  const factory Food({
    int? id,
    String? codiceBarre,
    required String nome,
    String? marca,
    @Default(Unit.g) Unit unita,
    required double kcal100,
    required double carboidrati100,
    required double proteine100,
    required double grassi100,
  }) = _Food;

  double kcalPer(double quantita) => kcal100 * quantita / 100;
  double carboidratiPer(double quantita) => carboidrati100 * quantita / 100;
  double proteinePer(double quantita) => proteine100 * quantita / 100;
  double grassiPer(double quantita) => grassi100 * quantita / 100;
}