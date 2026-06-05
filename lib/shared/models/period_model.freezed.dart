// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'period_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Period {

 String get id; String get schoolId; String get weekday; int get periodNumber;@TimeOfDayConverter() TimeOfDay get startTime;@TimeOfDayConverter() TimeOfDay get endTime; String get grade; String get subject;
/// Create a copy of Period
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PeriodCopyWith<Period> get copyWith => _$PeriodCopyWithImpl<Period>(this as Period, _$identity);

  /// Serializes this Period to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Period&&(identical(other.id, id) || other.id == id)&&(identical(other.schoolId, schoolId) || other.schoolId == schoolId)&&(identical(other.weekday, weekday) || other.weekday == weekday)&&(identical(other.periodNumber, periodNumber) || other.periodNumber == periodNumber)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&(identical(other.grade, grade) || other.grade == grade)&&(identical(other.subject, subject) || other.subject == subject));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,schoolId,weekday,periodNumber,startTime,endTime,grade,subject);

@override
String toString() {
  return 'Period(id: $id, schoolId: $schoolId, weekday: $weekday, periodNumber: $periodNumber, startTime: $startTime, endTime: $endTime, grade: $grade, subject: $subject)';
}


}

/// @nodoc
abstract mixin class $PeriodCopyWith<$Res>  {
  factory $PeriodCopyWith(Period value, $Res Function(Period) _then) = _$PeriodCopyWithImpl;
@useResult
$Res call({
 String id, String schoolId, String weekday, int periodNumber,@TimeOfDayConverter() TimeOfDay startTime,@TimeOfDayConverter() TimeOfDay endTime, String grade, String subject
});




}
/// @nodoc
class _$PeriodCopyWithImpl<$Res>
    implements $PeriodCopyWith<$Res> {
  _$PeriodCopyWithImpl(this._self, this._then);

  final Period _self;
  final $Res Function(Period) _then;

/// Create a copy of Period
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? schoolId = null,Object? weekday = null,Object? periodNumber = null,Object? startTime = null,Object? endTime = null,Object? grade = null,Object? subject = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,schoolId: null == schoolId ? _self.schoolId : schoolId // ignore: cast_nullable_to_non_nullable
as String,weekday: null == weekday ? _self.weekday : weekday // ignore: cast_nullable_to_non_nullable
as String,periodNumber: null == periodNumber ? _self.periodNumber : periodNumber // ignore: cast_nullable_to_non_nullable
as int,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as TimeOfDay,endTime: null == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as TimeOfDay,grade: null == grade ? _self.grade : grade // ignore: cast_nullable_to_non_nullable
as String,subject: null == subject ? _self.subject : subject // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Period].
extension PeriodPatterns on Period {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Period value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Period() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Period value)  $default,){
final _that = this;
switch (_that) {
case _Period():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Period value)?  $default,){
final _that = this;
switch (_that) {
case _Period() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String schoolId,  String weekday,  int periodNumber, @TimeOfDayConverter()  TimeOfDay startTime, @TimeOfDayConverter()  TimeOfDay endTime,  String grade,  String subject)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Period() when $default != null:
return $default(_that.id,_that.schoolId,_that.weekday,_that.periodNumber,_that.startTime,_that.endTime,_that.grade,_that.subject);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String schoolId,  String weekday,  int periodNumber, @TimeOfDayConverter()  TimeOfDay startTime, @TimeOfDayConverter()  TimeOfDay endTime,  String grade,  String subject)  $default,) {final _that = this;
switch (_that) {
case _Period():
return $default(_that.id,_that.schoolId,_that.weekday,_that.periodNumber,_that.startTime,_that.endTime,_that.grade,_that.subject);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String schoolId,  String weekday,  int periodNumber, @TimeOfDayConverter()  TimeOfDay startTime, @TimeOfDayConverter()  TimeOfDay endTime,  String grade,  String subject)?  $default,) {final _that = this;
switch (_that) {
case _Period() when $default != null:
return $default(_that.id,_that.schoolId,_that.weekday,_that.periodNumber,_that.startTime,_that.endTime,_that.grade,_that.subject);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Period extends Period {
  const _Period({required this.id, required this.schoolId, required this.weekday, required this.periodNumber, @TimeOfDayConverter() required this.startTime, @TimeOfDayConverter() required this.endTime, required this.grade, required this.subject}): super._();
  factory _Period.fromJson(Map<String, dynamic> json) => _$PeriodFromJson(json);

@override final  String id;
@override final  String schoolId;
@override final  String weekday;
@override final  int periodNumber;
@override@TimeOfDayConverter() final  TimeOfDay startTime;
@override@TimeOfDayConverter() final  TimeOfDay endTime;
@override final  String grade;
@override final  String subject;

/// Create a copy of Period
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PeriodCopyWith<_Period> get copyWith => __$PeriodCopyWithImpl<_Period>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PeriodToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Period&&(identical(other.id, id) || other.id == id)&&(identical(other.schoolId, schoolId) || other.schoolId == schoolId)&&(identical(other.weekday, weekday) || other.weekday == weekday)&&(identical(other.periodNumber, periodNumber) || other.periodNumber == periodNumber)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&(identical(other.grade, grade) || other.grade == grade)&&(identical(other.subject, subject) || other.subject == subject));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,schoolId,weekday,periodNumber,startTime,endTime,grade,subject);

@override
String toString() {
  return 'Period(id: $id, schoolId: $schoolId, weekday: $weekday, periodNumber: $periodNumber, startTime: $startTime, endTime: $endTime, grade: $grade, subject: $subject)';
}


}

/// @nodoc
abstract mixin class _$PeriodCopyWith<$Res> implements $PeriodCopyWith<$Res> {
  factory _$PeriodCopyWith(_Period value, $Res Function(_Period) _then) = __$PeriodCopyWithImpl;
@override @useResult
$Res call({
 String id, String schoolId, String weekday, int periodNumber,@TimeOfDayConverter() TimeOfDay startTime,@TimeOfDayConverter() TimeOfDay endTime, String grade, String subject
});




}
/// @nodoc
class __$PeriodCopyWithImpl<$Res>
    implements _$PeriodCopyWith<$Res> {
  __$PeriodCopyWithImpl(this._self, this._then);

  final _Period _self;
  final $Res Function(_Period) _then;

/// Create a copy of Period
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? schoolId = null,Object? weekday = null,Object? periodNumber = null,Object? startTime = null,Object? endTime = null,Object? grade = null,Object? subject = null,}) {
  return _then(_Period(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,schoolId: null == schoolId ? _self.schoolId : schoolId // ignore: cast_nullable_to_non_nullable
as String,weekday: null == weekday ? _self.weekday : weekday // ignore: cast_nullable_to_non_nullable
as String,periodNumber: null == periodNumber ? _self.periodNumber : periodNumber // ignore: cast_nullable_to_non_nullable
as int,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as TimeOfDay,endTime: null == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as TimeOfDay,grade: null == grade ? _self.grade : grade // ignore: cast_nullable_to_non_nullable
as String,subject: null == subject ? _self.subject : subject // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
