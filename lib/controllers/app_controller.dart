import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../types/user_data.dart';
import '../services/api/login.dart' as loginApi;

class AppController extends ChangeNotifier {
  static AppController instance = AppController();

  UserData? userData;

  Future<bool> login(String user, String pass, void Function(String error)? onError) async {
    if (user.isEmpty || pass.isEmpty || !RegExp(kRegExpIsValidEmail).hasMatch(user)) {
      if (onError != null) onError('Usuário ou senha inválidos!');
      return false;
    }

    var response = await loginApi.login(user, pass);
    userData = response.success ? response.data : null;

    // userData = const UserData(
    //   'claudiostocco@gmail.com',
    //   'Claudio Marcio Stocco',
    // );
    notifyListeners();
    return response.success;
  }

  logout() {
    userData = null;
    notifyListeners();
  }
}
