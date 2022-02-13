import 'dart:html';

import 'package:flutter/material.dart';

class LoginCard extends StatelessWidget {
  const LoginCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _textEditRow({required IconData icon, required String inputLabel}) {
      return Row(
        children: [
          Icon(icon), 
          const TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: inputLabel,
            ),
          ),
        ],
      );
    }
    _login() {
      Navigator.pushNamed(context, '/home');
    }

    return Container(
      padding: const EdgeInsets.all(30),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Colors.amber,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(child: Image.asset('assets/images/cadeado.png')),
          // Expanded(child: SizedBox(width: MediaQuery.of(context).size.width, child: Row(children: const [Icon(Icons.email), TextField(),],))),
          // Expanded(child: _textEditRow(icon: Icons.email, label: 'Email')),
      //     Expanded(child: _textEditRow(icon: Icons.password, label: 'Senha')),
      //     Expanded(
      //       child: ElevatedButton(
      //         onPressed: _login,
      //         child: const Text('Entrar'),
      //       ),
      //     )
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
            alignment: Alignment.topCenter,
          ),
        ),
        const LoginCard(),
      ]),
    );
  }
}
