import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../di/di.dart';

class AuthManager {
  static final ValueNotifier<String?> authChangeNotifire = ValueNotifier(null);

  static final SharedPreferences _sharedpref = locator.get();

  static void saveToken(String token) async {
    _sharedpref.setString('access_token', token);
  }

  static String readAuth() {
    return _sharedpref.getString('access_token') ?? '';
  }

  static void logout() {
    _sharedpref.clear();
  }
}
