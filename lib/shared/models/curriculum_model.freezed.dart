// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'curriculum_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CurriculumProject {

 String get id; String get grade; String get chapterName; int get chapterNumber; String get projectTitle; ProjectStatus get status; String? get notes; DateTime? get targetCompletionDate;
/// Create a copy of CurriculumProject
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CurriculumProjectCopyWith<CurriculumProject> get copyWith => _$CurriculumProjectCopyWithImpl<CurriculumProject>(this as CurriculumProject, _$identity);

  /// Serializes this CurriculumProject to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CurriculumProject&&(identical(other.id, id) || other.id == id)&&(identical(other.grade, grade) || other.grade == grade)&&(identical(other.chapterName, chapterName) || other.chapterName == chapterName)&&(identical(other.chapterNumber, chapterNumber) || other.chapterNumber == chapterNumber)&&(identical(other.projectTitle, projectTitle) || other.projectTitle == projectTitle)&&(identical(other.status, status) || other.status == status)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.targetCompletionDate, targetCompletionDate) || other.targetCompletionDate == targetCompletionDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,grade,chapterName,chapterNumber,projectTitle,status,notes,targetCompletionDate);

@override
String toString() {
  return 'CurriculumProject(id: $id, grade: $grade, chapterName: $chapterName, chapterNumber: $chapterNumber, projectTitle: $projectTitle, status: $status, notes: $notes, targetCompletionDate: $targetCompletionDate)';
}


}

/// @nodoc
abstract mixin class $CurriculumProjectCopyWith<$Res>  {
  factory $CurriculumProjectCopyWith(CurriculumProject value, $Res Function(CurriculumProject) _then) = _$CurriculumProjectCopyWithImpl;
@useResult
$Res call({
 String id, String grade, String chapterName, int chapterNumber, String projectTitle, ProjectStatus status, String? notes, DateTime? targetCompletionDate
});




}
/// @nodoc
class _$CurriculumProjectCopyWithImpl<$Res>
    implements $CurriculumProjectCopyWith<$Res> {
  _$CurriculumProjectCopyWithImpl(this._self, this._then);

  final CurriculumProject _self;
  final $Res Function(CurriculumProject) _then;

/// Create a copy of CurriculumProject
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? grade = null,Object? chapterName = null,Object? chapterNumber = null,Object? projectTitle = null,Object? status = null,Object? notes = freezed,Object? targetCompletionDate = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,grade: null == grade ? _self.grade : grade // ignore: cast_nullable_to_non_nullable
as String,chapterName: null == chapterName ? _self.chapterName : chapterName // ignore: cast_nullable_to_non_nullable
as String,chapterNumber: null == chapterNumber ? _self.chapterNumber : chapterNumber // ignore: cast_nullable_to_non_nullable
as int,projectTitle: null == projectTitle ? _self.projectTitle : projectTitle // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ProjectStatus,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,targetCompletionDate: freezed == targetCompletionDate ? _self.targetCompletionDate : targetCompletionDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [CurriculumProject].
extension CurriculumProjectPatterns on CurriculumProject {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CurriculumProject value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CurriculumProject() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CurriculumProject value)  $default,){
final _that = this;
switch (_that) {
case _CurriculumProject():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CurriculumProject value)?  $default,){
final _that = this;
switch (_that) {
case _CurriculumProject() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String grade,  String chapterName,  int chapterNumber,  String projectTitle,  ProjectStatus status,  String? notes,  DateTime? targetCompletionDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CurriculumProject() when $default != null:
return $default(_that.id,_that.grade,_that.chapterName,_that.chapterNumber,_that.projectTitle,_that.status,_that.notes,_that.targetCompletionDate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String grade,  String chapterName,  int chapterNumber,  String projectTitle,  ProjectStatus status,  String? notes,  DateTime? targetCompletionDate)  $default,) {final _that = this;
switch (_that) {
case _CurriculumProject():
return $default(_that.id,_that.grade,_that.chapterName,_that.chapterNumber,_that.projectTitle,_that.status,_that.notes,_that.targetCompletionDate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String grade,  String chapterName,  int chapterNumber,  String projectTitle,  ProjectStatus status,  String? notes,  DateTime? targetCompletionDate)?  $default,) {final _that = this;
switch (_that) {
case _CurriculumProject() when $default != null:
return $default(_that.id,_that.grade,_that.chapterName,_that.chapterNumber,_that.projectTitle,_that.status,_that.notes,_that.targetCompletionDate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CurriculumProject extends CurriculumProject {
  const _CurriculumProject({required this.id, required this.grade, required this.chapterName, required this.chapterNumber, required this.projectTitle, this.status = ProjectStatus.toLearn, this.notes, this.targetCompletionDate}): super._();
  factory _CurriculumProject.fromJson(Map<String, dynamic> json) => _$CurriculumProjectFromJson(json);

@override final  String id;
@override final  String grade;
@override final  String chapterName;
@override final  int chapterNumber;
@override final  String projectTitle;
@override@JsonKey() final  ProjectStatus status;
@override final  String? notes;
@override final  DateTime? targetCompletionDate;

/// Create a copy of CurriculumProject
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CurriculumProjectCopyWith<_CurriculumProject> get copyWith => __$CurriculumProjectCopyWithImpl<_CurriculumProject>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CurriculumProjectToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CurriculumProject&&(identical(other.id, id) || other.id == id)&&(identical(other.grade, grade) || other.grade == grade)&&(identical(other.chapterName, chapterName) || other.chapterName == chapterName)&&(identical(other.chapterNumber, chapterNumber) || other.chapterNumber == chapterNumber)&&(identical(other.projectTitle, projectTitle) || other.projectTitle == projectTitle)&&(identical(other.status, status) || other.status == status)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.targetCompletionDate, targetCompletionDate) || other.targetCompletionDate == targetCompletionDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,grade,chapterName,chapterNumber,projectTitle,status,notes,targetCompletionDate);

@override
String toString() {
  return 'CurriculumProject(id: $id, grade: $grade, chapterName: $chapterName, chapterNumber: $chapterNumber, projectTitle: $projectTitle, status: $status, notes: $notes, targetCompletionDate: $targetCompletionDate)';
}


}

/// @nodoc
abstract mixin class _$CurriculumProjectCopyWith<$Res> implements $CurriculumProjectCopyWith<$Res> {
  factory _$CurriculumProjectCopyWith(_CurriculumProject value, $Res Function(_CurriculumProject) _then) = __$CurriculumProjectCopyWithImpl;
@override @useResult
$Res call({
 String id, String grade, String chapterName, int chapterNumber, String projectTitle, ProjectStatus status, String? notes, DateTime? targetCompletionDate
});




}
/// @nodoc
class __$CurriculumProjectCopyWithImpl<$Res>
    implements _$CurriculumProjectCopyWith<$Res> {
  __$CurriculumProjectCopyWithImpl(this._self, this._then);

  final _CurriculumProject _self;
  final $Res Function(_CurriculumProject) _then;

/// Create a copy of CurriculumProject
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? grade = null,Object? chapterName = null,Object? chapterNumber = null,Object? projectTitle = null,Object? status = null,Object? notes = freezed,Object? targetCompletionDate = freezed,}) {
  return _then(_CurriculumProject(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,grade: null == grade ? _self.grade : grade // ignore: cast_nullable_to_non_nullable
as String,chapterName: null == chapterName ? _self.chapterName : chapterName // ignore: cast_nullable_to_non_nullable
as String,chapterNumber: null == chapterNumber ? _self.chapterNumber : chapterNumber // ignore: cast_nullable_to_non_nullable
as int,projectTitle: null == projectTitle ? _self.projectTitle : projectTitle // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ProjectStatus,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,targetCompletionDate: freezed == targetCompletionDate ? _self.targetCompletionDate : targetCompletionDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
