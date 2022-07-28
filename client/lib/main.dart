import 'package:flutter/material.dart';

import 'theme.dart';
import 'views/home.dart';
import 'views/login.dart';

void main() {
  runApp(const MyBills());
}

class MyBills extends StatelessWidget {
  const MyBills({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Minhas Contas',
      theme: CustomizedTheme(kThemes.dark).getCustomizedTheme(),
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => const Login(),
        '/home': (BuildContext context) => const Home(),
      },
    );
  }
}
