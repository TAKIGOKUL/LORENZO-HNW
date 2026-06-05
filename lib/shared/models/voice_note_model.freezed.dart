// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'voice_note_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VoiceNote {

 String get id; DateTime get timestamp; String get audioPath; String? get transcription; List<LorenzoTask> get extractedTasks; List<String> get mentionedNames; bool get isSynced;
/// Create a copy of VoiceNote
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VoiceNoteCopyWith<VoiceNote> get copyWith => _$VoiceNoteCopyWithImpl<VoiceNote>(this as VoiceNote, _$identity);

  /// Serializes this VoiceNote to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VoiceNote&&(identical(other.id, id) || other.id == id)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.audioPath, audioPath) || other.audioPath == audioPath)&&(identical(other.transcription, transcription) || other.transcription == transcription)&&const DeepCollectionEquality().equals(other.extractedTasks, extractedTasks)&&const DeepCollectionEquality().equals(other.mentionedNames, mentionedNames)&&(identical(other.isSynced, isSynced) || other.isSynced == isSynced));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,timestamp,audioPath,transcription,const DeepCollectionEquality().hash(extractedTasks),const DeepCollectionEquality().hash(mentionedNames),isSynced);

@override
String toString() {
  return 'VoiceNote(id: $id, timestamp: $timestamp, audioPath: $audioPath, transcription: $transcription, extractedTasks: $extractedTasks, mentionedNames: $mentionedNames, isSynced: $isSynced)';
}


}

/// @nodoc
abstract mixin class $VoiceNoteCopyWith<$Res>  {
  factory $VoiceNoteCopyWith(VoiceNote value, $Res Function(VoiceNote) _then) = _$VoiceNoteCopyWithImpl;
@useResult
$Res call({
 String id, DateTime timestamp, String audioPath, String? transcription, List<LorenzoTask> extractedTasks, List<String> mentionedNames, bool isSynced
});




}
/// @nodoc
class _$VoiceNoteCopyWithImpl<$Res>
    implements $VoiceNoteCopyWith<$Res> {
  _$VoiceNoteCopyWithImpl(this._self, this._then);

  final VoiceNote _self;
  final $Res Function(VoiceNote) _then;

/// Create a copy of VoiceNote
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? timestamp = null,Object? audioPath = null,Object? transcription = freezed,Object? extractedTasks = null,Object? mentionedNames = null,Object? isSynced = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,audioPath: null == audioPath ? _self.audioPath : audioPath // ignore: cast_nullable_to_non_nullable
as String,transcription: freezed == transcription ? _self.transcription : transcription // ignore: cast_nullable_to_non_nullable
as String?,extractedTasks: null == extractedTasks ? _self.extractedTasks : extractedTasks // ignore: cast_nullable_to_non_nullable
as List<LorenzoTask>,mentionedNames: null == mentionedNames ? _self.mentionedNames : mentionedNames // ignore: cast_nullable_to_non_nullable
as List<String>,isSynced: null == isSynced ? _self.isSynced : isSynced // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [VoiceNote].
extension VoiceNotePatterns on VoiceNote {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VoiceNote value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VoiceNote() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VoiceNote value)  $default,){
final _that = this;
switch (_that) {
case _VoiceNote():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VoiceNote value)?  $default,){
final _that = this;
switch (_that) {
case _VoiceNote() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  DateTime timestamp,  String audioPath,  String? transcription,  List<LorenzoTask> extractedTasks,  List<String> mentionedNames,  bool isSynced)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VoiceNote() when $default != null:
return $default(_that.id,_that.timestamp,_that.audioPath,_that.transcription,_that.extractedTasks,_that.mentionedNames,_that.isSynced);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  DateTime timestamp,  String audioPath,  String? transcription,  List<LorenzoTask> extractedTasks,  List<String> mentionedNames,  bool isSynced)  $default,) {final _that = this;
switch (_that) {
case _VoiceNote():
return $default(_that.id,_that.timestamp,_that.audioPath,_that.transcription,_that.extractedTasks,_that.mentionedNames,_that.isSynced);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  DateTime timestamp,  String audioPath,  String? transcription,  List<LorenzoTask> extractedTasks,  List<String> mentionedNames,  bool isSynced)?  $default,) {final _that = this;
switch (_that) {
case _VoiceNote() when $default != null:
return $default(_that.id,_that.timestamp,_that.audioPath,_that.transcription,_that.extractedTasks,_that.mentionedNames,_that.isSynced);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VoiceNote extends VoiceNote {
  const _VoiceNote({required this.id, required this.timestamp, required this.audioPath, this.transcription, final  List<LorenzoTask> extractedTasks = const [], final  List<String> mentionedNames = const [], this.isSynced = false}): _extractedTasks = extractedTasks,_mentionedNames = mentionedNames,super._();
  factory _VoiceNote.fromJson(Map<String, dynamic> json) => _$VoiceNoteFromJson(json);

@override final  String id;
@override final  DateTime timestamp;
@override final  String audioPath;
@override final  String? transcription;
 final  List<LorenzoTask> _extractedTasks;
@override@JsonKey() List<LorenzoTask> get extractedTasks {
  if (_extractedTasks is EqualUnmodifiableListView) return _extractedTasks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_extractedTasks);
}

 final  List<String> _mentionedNames;
@override@JsonKey() List<String> get mentionedNames {
  if (_mentionedNames is EqualUnmodifiableListView) return _mentionedNames;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_mentionedNames);
}

@override@JsonKey() final  bool isSynced;

/// Create a copy of VoiceNote
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VoiceNoteCopyWith<_VoiceNote> get copyWith => __$VoiceNoteCopyWithImpl<_VoiceNote>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VoiceNoteToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VoiceNote&&(identical(other.id, id) || other.id == id)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.audioPath, audioPath) || other.audioPath == audioPath)&&(identical(other.transcription, transcription) || other.transcription == transcription)&&const DeepCollectionEquality().equals(other._extractedTasks, _extractedTasks)&&const DeepCollectionEquality().equals(other._mentionedNames, _mentionedNames)&&(identical(other.isSynced, isSynced) || other.isSynced == isSynced));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,timestamp,audioPath,transcription,const DeepCollectionEquality().hash(_extractedTasks),const DeepCollectionEquality().hash(_mentionedNames),isSynced);

@override
String toString() {
  return 'VoiceNote(id: $id, timestamp: $timestamp, audioPath: $audioPath, transcription: $transcription, extractedTasks: $extractedTasks, mentionedNames: $mentionedNames, isSynced: $isSynced)';
}


}

/// @nodoc
abstract mixin class _$VoiceNoteCopyWith<$Res> implements $VoiceNoteCopyWith<$Res> {
  factory _$VoiceNoteCopyWith(_VoiceNote value, $Res Function(_VoiceNote) _then) = __$VoiceNoteCopyWithImpl;
@override @useResult
$Res call({
 String id, DateTime timestamp, String audioPath, String? transcription, List<LorenzoTask> extractedTasks, List<String> mentionedNames, bool isSynced
});




}
/// @nodoc
class __$VoiceNoteCopyWithImpl<$Res>
    implements _$VoiceNoteCopyWith<$Res> {
  __$VoiceNoteCopyWithImpl(this._self, this._then);

  final _VoiceNote _self;
  final $Res Function(_VoiceNote) _then;

/// Create a copy of VoiceNote
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? timestamp = null,Object? audioPath = null,Object? transcription = freezed,Object? extractedTasks = null,Object? mentionedNames = null,Object? isSynced = null,}) {
  return _then(_VoiceNote(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,audioPath: null == audioPath ? _self.audioPath : audioPath // ignore: cast_nullable_to_non_nullable
as String,transcription: freezed == transcription ? _self.transcription : transcription // ignore: cast_nullable_to_non_nullable
as String?,extractedTasks: null == extractedTasks ? _self._extractedTasks : extractedTasks // ignore: cast_nullable_to_non_nullable
as List<LorenzoTask>,mentionedNames: null == mentionedNames ? _self._mentionedNames : mentionedNames // ignore: cast_nullable_to_non_nullable
as List<String>,isSynced: null == isSynced ? _self.isSynced : isSynced // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
