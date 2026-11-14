// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'Food.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Food {

 int? get id; String? get codiceBarre; String get nome; String? get marca; Unit get unita; double get kcal100; double get carboidrati100; double get proteine100; double get grassi100;
/// Create a copy of Food
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FoodCopyWith<Food> get copyWith => _$FoodCopyWithImpl<Food>(this as Food, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as Food;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Food&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.codiceBarre, _this.codiceBarre) || other.codiceBarre == _this.codiceBarre)&&(identical(other.nome, _this.nome) || other.nome == _this.nome)&&(identical(other.marca, _this.marca) || other.marca == _this.marca)&&(identical(other.unita, _this.unita) || other.unita == _this.unita)&&(identical(other.kcal100, _this.kcal100) || other.kcal100 == _this.kcal100)&&(identical(other.carboidrati100, _this.carboidrati100) || other.carboidrati100 == _this.carboidrati100)&&(identical(other.proteine100, _this.proteine100) || other.proteine100 == _this.proteine100)&&(identical(other.grassi100, _this.grassi100) || other.grassi100 == _this.grassi100));
}


@override
int get hashCode {
  final _this = this as Food;
  return Object.hash(runtimeType,_this.id,_this.codiceBarre,_this.nome,_this.marca,_this.unita,_this.kcal100,_this.carboidrati100,_this.proteine100,_this.grassi100);
}

@override
String toString() {
  final _this = this as Food;
  return 'Food(id: ${_this.id}, codiceBarre: ${_this.codiceBarre}, nome: ${_this.nome}, marca: ${_this.marca}, unita: ${_this.unita}, kcal100: ${_this.kcal100}, carboidrati100: ${_this.carboidrati100}, proteine100: ${_this.proteine100}, grassi100: ${_this.grassi100})';
}


}

/// @nodoc
abstract mixin class $FoodCopyWith<$Res>  {
  factory $FoodCopyWith(Food value, $Res Function(Food) _then) = _$FoodCopyWithImpl;
@useResult
$Res call({
 int? id, String? codiceBarre, String nome, String? marca, Unit unita, double kcal100, double carboidrati100, double proteine100, double grassi100
});




}
/// @nodoc
class _$FoodCopyWithImpl<$Res>
    implements $FoodCopyWith<$Res> {
  _$FoodCopyWithImpl(this._self, this._then);

  final Food _self;
  final $Res Function(Food) _then;

/// Create a copy of Food
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? codiceBarre = freezed,Object? nome = null,Object? marca = freezed,Object? unita = null,Object? kcal100 = null,Object? carboidrati100 = null,Object? proteine100 = null,Object? grassi100 = null,}) {
  return _then(Food(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,codiceBarre: freezed == codiceBarre ? _self.codiceBarre : codiceBarre // ignore: cast_nullable_to_non_nullable
as String?,nome: null == nome ? _self.nome : nome // ignore: cast_nullable_to_non_nullable
as String,marca: freezed == marca ? _self.marca : marca // ignore: cast_nullable_to_non_nullable
as String?,unita: null == unita ? _self.unita : unita // ignore: cast_nullable_to_non_nullable
as Unit,kcal100: null == kcal100 ? _self.kcal100 : kcal100 // ignore: cast_nullable_to_non_nullable
as double,carboidrati100: null == carboidrati100 ? _self.carboidrati100 : carboidrati100 // ignore: cast_nullable_to_non_nullable
as double,proteine100: null == proteine100 ? _self.proteine100 : proteine100 // ignore: cast_nullable_to_non_nullable
as double,grassi100: null == grassi100 ? _self.grassi100 : grassi100 // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [Food].
extension FoodPatterns on Food {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Food value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Food() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Food value)  $default,){
final _that = this;
switch (_that) {
case _Food():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Food value)?  $default,){
final _that = this;
switch (_that) {
case _Food() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String? codiceBarre,  String nome,  String? marca,  Unit unita,  double kcal100,  double carboidrati100,  double proteine100,  double grassi100)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Food() when $default != null:
return $default(_that.id,_that.codiceBarre,_that.nome,_that.marca,_that.unita,_that.kcal100,_that.carboidrati100,_that.proteine100,_that.grassi100);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String? codiceBarre,  String nome,  String? marca,  Unit unita,  double kcal100,  double carboidrati100,  double proteine100,  double grassi100)  $default,) {final _that = this;
switch (_that) {
case _Food():
return $default(_that.id,_that.codiceBarre,_that.nome,_that.marca,_that.unita,_that.kcal100,_that.carboidrati100,_that.proteine100,_that.grassi100);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String? codiceBarre,  String nome,  String? marca,  Unit unita,  double kcal100,  double carboidrati100,  double proteine100,  double grassi100)?  $default,) {final _that = this;
switch (_that) {
case _Food() when $default != null:
return $default(_that.id,_that.codiceBarre,_that.nome,_that.marca,_that.unita,_that.kcal100,_that.carboidrati100,_that.proteine100,_that.grassi100);case _:
  return null;

}
}

}

/// @nodoc


class _Food extends Food {
  const _Food({this.id, this.codiceBarre, required this.nome, this.marca, this.unita = Unit.g, required this.kcal100, required this.carboidrati100, required this.proteine100, required this.grassi100}): super._();
  

@override final  int? id;
@override final  String? codiceBarre;
@override final  String nome;
@override final  String? marca;
@override@JsonKey() final  Unit unita;
@override final  double kcal100;
@override final  double carboidrati100;
@override final  double proteine100;
@override final  double grassi100;

/// Create a copy of Food
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FoodCopyWith<_Food> get copyWith => __$FoodCopyWithImpl<_Food>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Food&&(identical(other.id, id) || other.id == id)&&(identical(other.codiceBarre, codiceBarre) || other.codiceBarre == codiceBarre)&&(identical(other.nome, nome) || other.nome == nome)&&(identical(other.marca, marca) || other.marca == marca)&&(identical(other.unita, unita) || other.unita == unita)&&(identical(other.kcal100, kcal100) || other.kcal100 == kcal100)&&(identical(other.carboidrati100, carboidrati100) || other.carboidrati100 == carboidrati100)&&(identical(other.proteine100, proteine100) || other.proteine100 == proteine100)&&(identical(other.grassi100, grassi100) || other.grassi100 == grassi100));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,codiceBarre,nome,marca,unita,kcal100,carboidrati100,proteine100,grassi100);
}

@override
String toString() {
    return 'Food(id: $id, codiceBarre: $codiceBarre, nome: $nome, marca: $marca, unita: $unita, kcal100: $kcal100, carboidrati100: $carboidrati100, proteine100: $proteine100, grassi100: $grassi100)';
}


}

/// @nodoc
abstract mixin class _$FoodCopyWith<$Res> implements $FoodCopyWith<$Res> {
  factory _$FoodCopyWith(_Food value, $Res Function(_Food) _then) = __$FoodCopyWithImpl;
@override @useResult
$Res call({
 int? id, String? codiceBarre, String nome, String? marca, Unit unita, double kcal100, double carboidrati100, double proteine100, double grassi100
});




}
/// @nodoc
class __$FoodCopyWithImpl<$Res>
    implements _$FoodCopyWith<$Res> {
  __$FoodCopyWithImpl(this._self, this._then);

  final _Food _self;
  final $Res Function(_Food) _then;

/// Create a copy of Food
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? codiceBarre = freezed,Object? nome = null,Object? marca = freezed,Object? unita = null,Object? kcal100 = null,Object? carboidrati100 = null,Object? proteine100 = null,Object? grassi100 = null,}) {
  return _then(_Food(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,codiceBarre: freezed == codiceBarre ? _self.codiceBarre : codiceBarre // ignore: cast_nullable_to_non_nullable
as String?,nome: null == nome ? _self.nome : nome // ignore: cast_nullable_to_non_nullable
as String,marca: freezed == marca ? _self.marca : marca // ignore: cast_nullable_to_non_nullable
as String?,unita: null == unita ? _self.unita : unita // ignore: cast_nullable_to_non_nullable
as Unit,kcal100: null == kcal100 ? _self.kcal100 : kcal100 // ignore: cast_nullable_to_non_nullable
as double,carboidrati100: null == carboidrati100 ? _self.carboidrati100 : carboidrati100 // ignore: cast_nullable_to_non_nullable
as double,proteine100: null == proteine100 ? _self.proteine100 : proteine100 // ignore: cast_nullable_to_non_nullable
as double,grassi100: null == grassi100 ? _self.grassi100 : grassi100 // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
