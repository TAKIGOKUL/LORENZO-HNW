// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LorenzoUser _$LorenzoUserFromJson(Map<String, dynamic> json) => _LorenzoUser(
  name: json['name'] as String,
  email: json['email'] as String,
  employeeCode: json['employeeCode'] as String,
  schoolNames: Map<String, String>.from(json['schoolNames'] as Map),
  weekdaySchoolMap: Map<String, String>.from(json['weekdaySchoolMap'] as Map),
  whatsappGroups: Map<String, String>.from(json['whatsappGroups'] as Map),
);

Map<String, dynamic> _$LorenzoUserToJson(_LorenzoUser instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'employeeCode': instance.employeeCode,
      'schoolNames': instance.schoolNames,
      'weekdaySchoolMap': instance.weekdaySchoolMap,
      'whatsappGroups': instance.whatsappGroups,
    };
