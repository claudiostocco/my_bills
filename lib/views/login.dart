import 'package:flutter/material.dart';

import '/constants/widgets.dart';
import '../widgets/input_field.dart';

class LoginCard extends StatelessWidget {
  const LoginCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _textEditRow({required IconData icon, required String inputLabel, bool isPassword = false, int flex = 4}) {
      return Expanded(
        flex: flex,
        child: Row(
          children: [
            Icon(icon), 
            const SizedBox(width: 20,),
            InputField(
              inputLabel: inputLabel,
              inputType: isPassword ? kInputTypes.itPassword : kInputTypes.itEmail,
            ),
          ],
        ),
      );
    }

    Expanded _submitButton(Function login, {int flex = 4}) {
      return Expanded(
            flex: flex,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: ElevatedButton(
                  onPressed: () => login(),
                  child: const Text('Entrar'),
                ),
              ),
            ),
          );
    }

    void _login() {
      print('login');
      Navigator.pushNamed(context, '/home');
    }

    Widget _separator({int flex = 1}) {
      return Expanded(
            flex: flex,
            child: const SizedBox(),
      );
    }

    return Container(
      padding: const EdgeInsets.all(30),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/cadeado.png'),
          Container(
              color: Colors.black.withOpacity(0.5),
              height: 200,
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  _textEditRow(icon: Icons.email, inputLabel: 'Email'),
                  _separator(),
                  _textEditRow(icon: Icons.password, inputLabel: 'Senha', isPassword: true),
                  _separator(flex: 2),
                  _submitButton(_login)
                ],
              ),
            ),
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
