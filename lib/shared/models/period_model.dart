import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../core/utils/json_converters.dart';

part 'period_model.freezed.dart';
part 'period_model.g.dart';

@freezed
abstract class Period with _$Period {
  const Period._();
  const factory Period({
    required String id,
    required String schoolId,
    required String weekday,
    required int periodNumber,
    @TimeOfDayConverter() required TimeOfDay startTime,
    @TimeOfDayConverter() required TimeOfDay endTime,
    required String grade,
    required String subject,
  }) = _Period;

  factory Period.fromJson(Map<String, dynamic> json) => _$PeriodFromJson(json);
}
