// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'DiaryEntry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DiaryEntry {

 int? get id; Food get alimento; MealType get pasto; double get quantita; double get kcal; double get carboidratiG; double get proteineG; double get grassiG; DateTime get giorno; DateTime get registrato;
/// Create a copy of DiaryEntry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DiaryEntryCopyWith<DiaryEntry> get copyWith => _$DiaryEntryCopyWithImpl<DiaryEntry>(this as DiaryEntry, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as DiaryEntry;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DiaryEntry&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.alimento, _this.alimento) || other.alimento == _this.alimento)&&(identical(other.pasto, _this.pasto) || other.pasto == _this.pasto)&&(identical(other.quantita, _this.quantita) || other.quantita == _this.quantita)&&(identical(other.kcal, _this.kcal) || other.kcal == _this.kcal)&&(identical(other.carboidratiG, _this.carboidratiG) || other.carboidratiG == _this.carboidratiG)&&(identical(other.proteineG, _this.proteineG) || other.proteineG == _this.proteineG)&&(identical(other.grassiG, _this.grassiG) || other.grassiG == _this.grassiG)&&(identical(other.giorno, _this.giorno) || other.giorno == _this.giorno)&&(identical(other.registrato, _this.registrato) || other.registrato == _this.registrato));
}


@override
int get hashCode {
  final _this = this as DiaryEntry;
  return Object.hash(runtimeType,_this.id,_this.alimento,_this.pasto,_this.quantita,_this.kcal,_this.carboidratiG,_this.proteineG,_this.grassiG,_this.giorno,_this.registrato);
}

@override
String toString() {
  final _this = this as DiaryEntry;
  return 'DiaryEntry(id: ${_this.id}, alimento: ${_this.alimento}, pasto: ${_this.pasto}, quantita: ${_this.quantita}, kcal: ${_this.kcal}, carboidratiG: ${_this.carboidratiG}, proteineG: ${_this.proteineG}, grassiG: ${_this.grassiG}, giorno: ${_this.giorno}, registrato: ${_this.registrato})';
}


}

/// @nodoc
abstract mixin class $DiaryEntryCopyWith<$Res>  {
  factory $DiaryEntryCopyWith(DiaryEntry value, $Res Function(DiaryEntry) _then) = _$DiaryEntryCopyWithImpl;
@useResult
$Res call({
 int? id, Food alimento, MealType pasto, double quantita, double kcal, double carboidratiG, double proteineG, double grassiG, DateTime giorno, DateTime registrato
});


$FoodCopyWith<$Res> get alimento;

}
/// @nodoc
class _$DiaryEntryCopyWithImpl<$Res>
    implements $DiaryEntryCopyWith<$Res> {
  _$DiaryEntryCopyWithImpl(this._self, this._then);

  final DiaryEntry _self;
  final $Res Function(DiaryEntry) _then;

/// Create a copy of DiaryEntry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? alimento = null,Object? pasto = null,Object? quantita = null,Object? kcal = null,Object? carboidratiG = null,Object? proteineG = null,Object? grassiG = null,Object? giorno = null,Object? registrato = null,}) {
  return _then(DiaryEntry(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,alimento: null == alimento ? _self.alimento : alimento // ignore: cast_nullable_to_non_nullable
as Food,pasto: null == pasto ? _self.pasto : pasto // ignore: cast_nullable_to_non_nullable
as MealType,quantita: null == quantita ? _self.quantita : quantita // ignore: cast_nullable_to_non_nullable
as double,kcal: null == kcal ? _self.kcal : kcal // ignore: cast_nullable_to_non_nullable
as double,carboidratiG: null == carboidratiG ? _self.carboidratiG : carboidratiG // ignore: cast_nullable_to_non_nullable
as double,proteineG: null == proteineG ? _self.proteineG : proteineG // ignore: cast_nullable_to_non_nullable
as double,grassiG: null == grassiG ? _self.grassiG : grassiG // ignore: cast_nullable_to_non_nullable
as double,giorno: null == giorno ? _self.giorno : giorno // ignore: cast_nullable_to_non_nullable
as DateTime,registrato: null == registrato ? _self.registrato : registrato // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}
/// Create a copy of DiaryEntry
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FoodCopyWith<$Res> get alimento {
  
  return $FoodCopyWith<$Res>(_self.alimento, (value) {
    return _then(_self.copyWith(alimento: value));
  });
}
}


/// Adds pattern-matching-related methods to [DiaryEntry].
extension DiaryEntryPatterns on DiaryEntry {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DiaryEntry value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DiaryEntry() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DiaryEntry value)  $default,){
final _that = this;
switch (_that) {
case _DiaryEntry():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DiaryEntry value)?  $default,){
final _that = this;
switch (_that) {
case _DiaryEntry() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  Food alimento,  MealType pasto,  double quantita,  double kcal,  double carboidratiG,  double proteineG,  double grassiG,  DateTime giorno,  DateTime registrato)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DiaryEntry() when $default != null:
return $default(_that.id,_that.alimento,_that.pasto,_that.quantita,_that.kcal,_that.carboidratiG,_that.proteineG,_that.grassiG,_that.giorno,_that.registrato);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  Food alimento,  MealType pasto,  double quantita,  double kcal,  double carboidratiG,  double proteineG,  double grassiG,  DateTime giorno,  DateTime registrato)  $default,) {final _that = this;
switch (_that) {
case _DiaryEntry():
return $default(_that.id,_that.alimento,_that.pasto,_that.quantita,_that.kcal,_that.carboidratiG,_that.proteineG,_that.grassiG,_that.giorno,_that.registrato);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  Food alimento,  MealType pasto,  double quantita,  double kcal,  double carboidratiG,  double proteineG,  double grassiG,  DateTime giorno,  DateTime registrato)?  $default,) {final _that = this;
switch (_that) {
case _DiaryEntry() when $default != null:
return $default(_that.id,_that.alimento,_that.pasto,_that.quantita,_that.kcal,_that.carboidratiG,_that.proteineG,_that.grassiG,_that.giorno,_that.registrato);case _:
  return null;

}
}

}

/// @nodoc


class _DiaryEntry extends DiaryEntry {
  const _DiaryEntry({this.id, required this.alimento, required this.pasto, required this.quantita, required this.kcal, required this.carboidratiG, required this.proteineG, required this.grassiG, required this.giorno, required this.registrato}): super._();
  

@override final  int? id;
@override final  Food alimento;
@override final  MealType pasto;
@override final  double quantita;
@override final  double kcal;
@override final  double carboidratiG;
@override final  double proteineG;
@override final  double grassiG;
@override final  DateTime giorno;
@override final  DateTime registrato;

/// Create a copy of DiaryEntry
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DiaryEntryCopyWith<_DiaryEntry> get copyWith => __$DiaryEntryCopyWithImpl<_DiaryEntry>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _DiaryEntry&&(identical(other.id, id) || other.id == id)&&(identical(other.alimento, alimento) || other.alimento == alimento)&&(identical(other.pasto, pasto) || other.pasto == pasto)&&(identical(other.quantita, quantita) || other.quantita == quantita)&&(identical(other.kcal, kcal) || other.kcal == kcal)&&(identical(other.carboidratiG, carboidratiG) || other.carboidratiG == carboidratiG)&&(identical(other.proteineG, proteineG) || other.proteineG == proteineG)&&(identical(other.grassiG, grassiG) || other.grassiG == grassiG)&&(identical(other.giorno, giorno) || other.giorno == giorno)&&(identical(other.registrato, registrato) || other.registrato == registrato));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,alimento,pasto,quantita,kcal,carboidratiG,proteineG,grassiG,giorno,registrato);
}

@override
String toString() {
    return 'DiaryEntry(id: $id, alimento: $alimento, pasto: $pasto, quantita: $quantita, kcal: $kcal, carboidratiG: $carboidratiG, proteineG: $proteineG, grassiG: $grassiG, giorno: $giorno, registrato: $registrato)';
}


}

/// @nodoc
abstract mixin class _$DiaryEntryCopyWith<$Res> implements $DiaryEntryCopyWith<$Res> {
  factory _$DiaryEntryCopyWith(_DiaryEntry value, $Res Function(_DiaryEntry) _then) = __$DiaryEntryCopyWithImpl;
@override @useResult
$Res call({
 int? id, Food alimento, MealType pasto, double quantita, double kcal, double carboidratiG, double proteineG, double grassiG, DateTime giorno, DateTime registrato
});


@override $FoodCopyWith<$Res> get alimento;

}
/// @nodoc
class __$DiaryEntryCopyWithImpl<$Res>
    implements _$DiaryEntryCopyWith<$Res> {
  __$DiaryEntryCopyWithImpl(this._self, this._then);

  final _DiaryEntry _self;
  final $Res Function(_DiaryEntry) _then;

/// Create a copy of DiaryEntry
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? alimento = null,Object? pasto = null,Object? quantita = null,Object? kcal = null,Object? carboidratiG = null,Object? proteineG = null,Object? grassiG = null,Object? giorno = null,Object? registrato = null,}) {
  return _then(_DiaryEntry(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,alimento: null == alimento ? _self.alimento : alimento // ignore: cast_nullable_to_non_nullable
as Food,pasto: null == pasto ? _self.pasto : pasto // ignore: cast_nullable_to_non_nullable
as MealType,quantita: null == quantita ? _self.quantita : quantita // ignore: cast_nullable_to_non_nullable
as double,kcal: null == kcal ? _self.kcal : kcal // ignore: cast_nullable_to_non_nullable
as double,carboidratiG: null == carboidratiG ? _self.carboidratiG : carboidratiG // ignore: cast_nullable_to_non_nullable
as double,proteineG: null == proteineG ? _self.proteineG : proteineG // ignore: cast_nullable_to_non_nullable
as double,grassiG: null == grassiG ? _self.grassiG : grassiG // ignore: cast_nullable_to_non_nullable
as double,giorno: null == giorno ? _self.giorno : giorno // ignore: cast_nullable_to_non_nullable
as DateTime,registrato: null == registrato ? _self.registrato : registrato // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

/// Create a copy of DiaryEntry
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FoodCopyWith<$Res> get alimento {
  
  return $FoodCopyWith<$Res>(_self.alimento, (value) {
    return _then(_self.copyWith(alimento: value));
  });
}
}

// dart format on
