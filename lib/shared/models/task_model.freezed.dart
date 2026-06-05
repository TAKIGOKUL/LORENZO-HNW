// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LorenzoTask {

 String get id; String get title; String? get description; TaskPriority get priority; DateTime get dueDate; bool get isCompleted; TaskType get type; String? get schoolId; int get remindDaysBefore;
/// Create a copy of LorenzoTask
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LorenzoTaskCopyWith<LorenzoTask> get copyWith => _$LorenzoTaskCopyWithImpl<LorenzoTask>(this as LorenzoTask, _$identity);

  /// Serializes this LorenzoTask to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LorenzoTask&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.priority, priority) || other.priority == priority)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&(identical(other.isCompleted, isCompleted) || other.isCompleted == isCompleted)&&(identical(other.type, type) || other.type == type)&&(identical(other.schoolId, schoolId) || other.schoolId == schoolId)&&(identical(other.remindDaysBefore, remindDaysBefore) || other.remindDaysBefore == remindDaysBefore));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description,priority,dueDate,isCompleted,type,schoolId,remindDaysBefore);

@override
String toString() {
  return 'LorenzoTask(id: $id, title: $title, description: $description, priority: $priority, dueDate: $dueDate, isCompleted: $isCompleted, type: $type, schoolId: $schoolId, remindDaysBefore: $remindDaysBefore)';
}


}

/// @nodoc
abstract mixin class $LorenzoTaskCopyWith<$Res>  {
  factory $LorenzoTaskCopyWith(LorenzoTask value, $Res Function(LorenzoTask) _then) = _$LorenzoTaskCopyWithImpl;
@useResult
$Res call({
 String id, String title, String? description, TaskPriority priority, DateTime dueDate, bool isCompleted, TaskType type, String? schoolId, int remindDaysBefore
});




}
/// @nodoc
class _$LorenzoTaskCopyWithImpl<$Res>
    implements $LorenzoTaskCopyWith<$Res> {
  _$LorenzoTaskCopyWithImpl(this._self, this._then);

  final LorenzoTask _self;
  final $Res Function(LorenzoTask) _then;

/// Create a copy of LorenzoTask
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? description = freezed,Object? priority = null,Object? dueDate = null,Object? isCompleted = null,Object? type = null,Object? schoolId = freezed,Object? remindDaysBefore = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,priority: null == priority ? _self.priority : priority // ignore: cast_nullable_to_non_nullable
as TaskPriority,dueDate: null == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as DateTime,isCompleted: null == isCompleted ? _self.isCompleted : isCompleted // ignore: cast_nullable_to_non_nullable
as bool,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as TaskType,schoolId: freezed == schoolId ? _self.schoolId : schoolId // ignore: cast_nullable_to_non_nullable
as String?,remindDaysBefore: null == remindDaysBefore ? _self.remindDaysBefore : remindDaysBefore // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [LorenzoTask].
extension LorenzoTaskPatterns on LorenzoTask {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LorenzoTask value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LorenzoTask() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LorenzoTask value)  $default,){
final _that = this;
switch (_that) {
case _LorenzoTask():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LorenzoTask value)?  $default,){
final _that = this;
switch (_that) {
case _LorenzoTask() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String? description,  TaskPriority priority,  DateTime dueDate,  bool isCompleted,  TaskType type,  String? schoolId,  int remindDaysBefore)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LorenzoTask() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.priority,_that.dueDate,_that.isCompleted,_that.type,_that.schoolId,_that.remindDaysBefore);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String? description,  TaskPriority priority,  DateTime dueDate,  bool isCompleted,  TaskType type,  String? schoolId,  int remindDaysBefore)  $default,) {final _that = this;
switch (_that) {
case _LorenzoTask():
return $default(_that.id,_that.title,_that.description,_that.priority,_that.dueDate,_that.isCompleted,_that.type,_that.schoolId,_that.remindDaysBefore);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String? description,  TaskPriority priority,  DateTime dueDate,  bool isCompleted,  TaskType type,  String? schoolId,  int remindDaysBefore)?  $default,) {final _that = this;
switch (_that) {
case _LorenzoTask() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.priority,_that.dueDate,_that.isCompleted,_that.type,_that.schoolId,_that.remindDaysBefore);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LorenzoTask extends LorenzoTask {
  const _LorenzoTask({required this.id, required this.title, this.description, required this.priority, required this.dueDate, this.isCompleted = false, required this.type, this.schoolId, this.remindDaysBefore = 2}): super._();
  factory _LorenzoTask.fromJson(Map<String, dynamic> json) => _$LorenzoTaskFromJson(json);

@override final  String id;
@override final  String title;
@override final  String? description;
@override final  TaskPriority priority;
@override final  DateTime dueDate;
@override@JsonKey() final  bool isCompleted;
@override final  TaskType type;
@override final  String? schoolId;
@override@JsonKey() final  int remindDaysBefore;

/// Create a copy of LorenzoTask
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LorenzoTaskCopyWith<_LorenzoTask> get copyWith => __$LorenzoTaskCopyWithImpl<_LorenzoTask>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LorenzoTaskToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LorenzoTask&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.priority, priority) || other.priority == priority)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&(identical(other.isCompleted, isCompleted) || other.isCompleted == isCompleted)&&(identical(other.type, type) || other.type == type)&&(identical(other.schoolId, schoolId) || other.schoolId == schoolId)&&(identical(other.remindDaysBefore, remindDaysBefore) || other.remindDaysBefore == remindDaysBefore));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description,priority,dueDate,isCompleted,type,schoolId,remindDaysBefore);

@override
String toString() {
  return 'LorenzoTask(id: $id, title: $title, description: $description, priority: $priority, dueDate: $dueDate, isCompleted: $isCompleted, type: $type, schoolId: $schoolId, remindDaysBefore: $remindDaysBefore)';
}


}

/// @nodoc
abstract mixin class _$LorenzoTaskCopyWith<$Res> implements $LorenzoTaskCopyWith<$Res> {
  factory _$LorenzoTaskCopyWith(_LorenzoTask value, $Res Function(_LorenzoTask) _then) = __$LorenzoTaskCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String? description, TaskPriority priority, DateTime dueDate, bool isCompleted, TaskType type, String? schoolId, int remindDaysBefore
});




}
/// @nodoc
class __$LorenzoTaskCopyWithImpl<$Res>
    implements _$LorenzoTaskCopyWith<$Res> {
  __$LorenzoTaskCopyWithImpl(this._self, this._then);

  final _LorenzoTask _self;
  final $Res Function(_LorenzoTask) _then;

/// Create a copy of LorenzoTask
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? description = freezed,Object? priority = null,Object? dueDate = null,Object? isCompleted = null,Object? type = null,Object? schoolId = freezed,Object? remindDaysBefore = null,}) {
  return _then(_LorenzoTask(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,priority: null == priority ? _self.priority : priority // ignore: cast_nullable_to_non_nullable
as TaskPriority,dueDate: null == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as DateTime,isCompleted: null == isCompleted ? _self.isCompleted : isCompleted // ignore: cast_nullable_to_non_nullable
as bool,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as TaskType,schoolId: freezed == schoolId ? _self.schoolId : schoolId // ignore: cast_nullable_to_non_nullable
as String?,remindDaysBefore: null == remindDaysBefore ? _self.remindDaysBefore : remindDaysBefore // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
