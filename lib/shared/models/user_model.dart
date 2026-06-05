import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
abstract class LorenzoUser with _$LorenzoUser {
  const LorenzoUser._();
  const factory LorenzoUser({
    required String name,
    required String email,
    required String employeeCode,
    required Map<String, String> schoolNames,
    required Map<String, String> weekdaySchoolMap,
    required Map<String, String> whatsappGroups,
  }) = _LorenzoUser;

  factory LorenzoUser.fromJson(Map<String, dynamic> json) => _$LorenzoUserFromJson(json);

  factory LorenzoUser.initial() => const LorenzoUser(
    name: 'Taki',
    email: '',
    employeeCode: 'HNW103',
    schoolNames: {
      'schoolA': 'LC Silver oak',
      'schoolB': 'LC Serene Valley',
      'schoolC': 'LC Svmps',
    },
    weekdaySchoolMap: {
      '1': 'schoolA', // Monday
      '2': 'schoolB',
      '3': 'schoolC',
      '4': 'schoolA',
      '5': 'schoolB',
    },
    whatsappGroups: {},
  );
}
