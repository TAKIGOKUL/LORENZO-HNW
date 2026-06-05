// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LorenzoUser {

 String get name; String get email; String get employeeCode; Map<String, String> get schoolNames; Map<String, String> get weekdaySchoolMap; Map<String, String> get whatsappGroups;
/// Create a copy of LorenzoUser
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LorenzoUserCopyWith<LorenzoUser> get copyWith => _$LorenzoUserCopyWithImpl<LorenzoUser>(this as LorenzoUser, _$identity);

  /// Serializes this LorenzoUser to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LorenzoUser&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.employeeCode, employeeCode) || other.employeeCode == employeeCode)&&const DeepCollectionEquality().equals(other.schoolNames, schoolNames)&&const DeepCollectionEquality().equals(other.weekdaySchoolMap, weekdaySchoolMap)&&const DeepCollectionEquality().equals(other.whatsappGroups, whatsappGroups));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,email,employeeCode,const DeepCollectionEquality().hash(schoolNames),const DeepCollectionEquality().hash(weekdaySchoolMap),const DeepCollectionEquality().hash(whatsappGroups));

@override
String toString() {
  return 'LorenzoUser(name: $name, email: $email, employeeCode: $employeeCode, schoolNames: $schoolNames, weekdaySchoolMap: $weekdaySchoolMap, whatsappGroups: $whatsappGroups)';
}


}

/// @nodoc
abstract mixin class $LorenzoUserCopyWith<$Res>  {
  factory $LorenzoUserCopyWith(LorenzoUser value, $Res Function(LorenzoUser) _then) = _$LorenzoUserCopyWithImpl;
@useResult
$Res call({
 String name, String email, String employeeCode, Map<String, String> schoolNames, Map<String, String> weekdaySchoolMap, Map<String, String> whatsappGroups
});




}
/// @nodoc
class _$LorenzoUserCopyWithImpl<$Res>
    implements $LorenzoUserCopyWith<$Res> {
  _$LorenzoUserCopyWithImpl(this._self, this._then);

  final LorenzoUser _self;
  final $Res Function(LorenzoUser) _then;

/// Create a copy of LorenzoUser
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? email = null,Object? employeeCode = null,Object? schoolNames = null,Object? weekdaySchoolMap = null,Object? whatsappGroups = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,employeeCode: null == employeeCode ? _self.employeeCode : employeeCode // ignore: cast_nullable_to_non_nullable
as String,schoolNames: null == schoolNames ? _self.schoolNames : schoolNames // ignore: cast_nullable_to_non_nullable
as Map<String, String>,weekdaySchoolMap: null == weekdaySchoolMap ? _self.weekdaySchoolMap : weekdaySchoolMap // ignore: cast_nullable_to_non_nullable
as Map<String, String>,whatsappGroups: null == whatsappGroups ? _self.whatsappGroups : whatsappGroups // ignore: cast_nullable_to_non_nullable
as Map<String, String>,
  ));
}

}


/// Adds pattern-matching-related methods to [LorenzoUser].
extension LorenzoUserPatterns on LorenzoUser {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LorenzoUser value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LorenzoUser() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LorenzoUser value)  $default,){
final _that = this;
switch (_that) {
case _LorenzoUser():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LorenzoUser value)?  $default,){
final _that = this;
switch (_that) {
case _LorenzoUser() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String email,  String employeeCode,  Map<String, String> schoolNames,  Map<String, String> weekdaySchoolMap,  Map<String, String> whatsappGroups)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LorenzoUser() when $default != null:
return $default(_that.name,_that.email,_that.employeeCode,_that.schoolNames,_that.weekdaySchoolMap,_that.whatsappGroups);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String email,  String employeeCode,  Map<String, String> schoolNames,  Map<String, String> weekdaySchoolMap,  Map<String, String> whatsappGroups)  $default,) {final _that = this;
switch (_that) {
case _LorenzoUser():
return $default(_that.name,_that.email,_that.employeeCode,_that.schoolNames,_that.weekdaySchoolMap,_that.whatsappGroups);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String email,  String employeeCode,  Map<String, String> schoolNames,  Map<String, String> weekdaySchoolMap,  Map<String, String> whatsappGroups)?  $default,) {final _that = this;
switch (_that) {
case _LorenzoUser() when $default != null:
return $default(_that.name,_that.email,_that.employeeCode,_that.schoolNames,_that.weekdaySchoolMap,_that.whatsappGroups);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LorenzoUser extends LorenzoUser {
  const _LorenzoUser({required this.name, required this.email, required this.employeeCode, required final  Map<String, String> schoolNames, required final  Map<String, String> weekdaySchoolMap, required final  Map<String, String> whatsappGroups}): _schoolNames = schoolNames,_weekdaySchoolMap = weekdaySchoolMap,_whatsappGroups = whatsappGroups,super._();
  factory _LorenzoUser.fromJson(Map<String, dynamic> json) => _$LorenzoUserFromJson(json);

@override final  String name;
@override final  String email;
@override final  String employeeCode;
 final  Map<String, String> _schoolNames;
@override Map<String, String> get schoolNames {
  if (_schoolNames is EqualUnmodifiableMapView) return _schoolNames;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_schoolNames);
}

 final  Map<String, String> _weekdaySchoolMap;
@override Map<String, String> get weekdaySchoolMap {
  if (_weekdaySchoolMap is EqualUnmodifiableMapView) return _weekdaySchoolMap;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_weekdaySchoolMap);
}

 final  Map<String, String> _whatsappGroups;
@override Map<String, String> get whatsappGroups {
  if (_whatsappGroups is EqualUnmodifiableMapView) return _whatsappGroups;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_whatsappGroups);
}


/// Create a copy of LorenzoUser
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LorenzoUserCopyWith<_LorenzoUser> get copyWith => __$LorenzoUserCopyWithImpl<_LorenzoUser>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LorenzoUserToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LorenzoUser&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.employeeCode, employeeCode) || other.employeeCode == employeeCode)&&const DeepCollectionEquality().equals(other._schoolNames, _schoolNames)&&const DeepCollectionEquality().equals(other._weekdaySchoolMap, _weekdaySchoolMap)&&const DeepCollectionEquality().equals(other._whatsappGroups, _whatsappGroups));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,email,employeeCode,const DeepCollectionEquality().hash(_schoolNames),const DeepCollectionEquality().hash(_weekdaySchoolMap),const DeepCollectionEquality().hash(_whatsappGroups));

@override
String toString() {
  return 'LorenzoUser(name: $name, email: $email, employeeCode: $employeeCode, schoolNames: $schoolNames, weekdaySchoolMap: $weekdaySchoolMap, whatsappGroups: $whatsappGroups)';
}


}

/// @nodoc
abstract mixin class _$LorenzoUserCopyWith<$Res> implements $LorenzoUserCopyWith<$Res> {
  factory _$LorenzoUserCopyWith(_LorenzoUser value, $Res Function(_LorenzoUser) _then) = __$LorenzoUserCopyWithImpl;
@override @useResult
$Res call({
 String name, String email, String employeeCode, Map<String, String> schoolNames, Map<String, String> weekdaySchoolMap, Map<String, String> whatsappGroups
});




}
/// @nodoc
class __$LorenzoUserCopyWithImpl<$Res>
    implements _$LorenzoUserCopyWith<$Res> {
  __$LorenzoUserCopyWithImpl(this._self, this._then);

  final _LorenzoUser _self;
  final $Res Function(_LorenzoUser) _then;

/// Create a copy of LorenzoUser
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? email = null,Object? employeeCode = null,Object? schoolNames = null,Object? weekdaySchoolMap = null,Object? whatsappGroups = null,}) {
  return _then(_LorenzoUser(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,employeeCode: null == employeeCode ? _self.employeeCode : employeeCode // ignore: cast_nullable_to_non_nullable
as String,schoolNames: null == schoolNames ? _self._schoolNames : schoolNames // ignore: cast_nullable_to_non_nullable
as Map<String, String>,weekdaySchoolMap: null == weekdaySchoolMap ? _self._weekdaySchoolMap : weekdaySchoolMap // ignore: cast_nullable_to_non_nullable
as Map<String, String>,whatsappGroups: null == whatsappGroups ? _self._whatsappGroups : whatsappGroups // ignore: cast_nullable_to_non_nullable
as Map<String, String>,
  ));
}


}

// dart format on
