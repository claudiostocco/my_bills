import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../types/user_data.dart';

class AppController extends ChangeNotifier {
  static AppController instance = AppController();

  UserData? userData;

  bool login(String user, String pass, void Function(String error)? onError) {
    if (user.isEmpty || pass.isEmpty || !RegExp(kRegExpIsValidEmail).hasMatch(user)) {
      if (onError != null) onError('Usuário ou senha inválidos!');
      return false;
    }

    userData = const UserData(
      'claudiostocco@gmail.com',
      'Claudio Marcio Stocco',
      userImage: 'https://avatars.githubusercontent.com/u/47143084?v=4',
    );
    notifyListeners();
    return true;
  }

  logout() {
    userData = null;
    notifyListeners();
  }
}
