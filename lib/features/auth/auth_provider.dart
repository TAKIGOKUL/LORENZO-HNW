import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../core/services/storage_service.dart';
import '../../shared/models/user_model.dart';

final authProvider = NotifierProvider<AuthNotifier, LorenzoUser?>(() {
  return AuthNotifier();
});

class AuthNotifier extends Notifier<LorenzoUser?> {
  final _box = Hive.box<String>(StorageService.userBox);

  @override
  LorenzoUser? build() {
    final userData = _box.get('profile');
    if (userData != null) {
      return LorenzoUser.fromJson(jsonDecode(userData));
    }
    return null;
  }

  Future<void> saveUser(LorenzoUser user) async {
    await _box.put('profile', jsonEncode(user.toJson()));
    state = user;
  }
}
