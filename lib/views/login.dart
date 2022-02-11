import 'dart:html';

import 'package:flutter/material.dart';

class LoginCard extends StatelessWidget {
  const LoginCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _login() {
      Navigator.pushNamed(context, '/home');
    }

    return Container(
      padding: const EdgeInsets.all(30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(child: Image.asset('assets/images/cadeado.png')),
          Expanded(
            child: ElevatedButton(
              onPressed: _login,
              child: const Text('Entrar'),
            ),
          )
        ],
      ),
    );
  }
}

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Image.asset(
            'assets/images/background.jpg',
            fit: BoxFit.cover,
          ),
        ),
        const LoginCard(),
      ]),
    );
  }
}
