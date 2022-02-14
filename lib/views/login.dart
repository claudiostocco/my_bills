import 'package:flutter/material.dart';

import '../widgets/separator.dart';
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
            const SizedBox(
              width: 20,
            ),
            InputField(
              inputLabel: inputLabel,
              inputType: isPassword ? kInputTypes.itPassword : kInputTypes.itEmail,
            ),
          ],
        ),
      );
    }

    Expanded _submitButton(Function onPressed, {int flex = 4}) {
      return Expanded(
        flex: flex,
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: ElevatedButton(
              onPressed: () => onPressed(),
              child: const Text('Entrar'),
              style: ElevatedButton.styleFrom(
                elevation: 20,
                shadowColor: const Color(0xFF08295C),
              ),
            ),
          ),
        ),
      );
    }

    void _login() {
      Navigator.pushReplacementNamed(context, '/home');
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
            color: Colors.black.withOpacity(0.6),
            width: MediaQuery.of(context).size.width > 500 ? 500 : MediaQuery.of(context).size.width,
            height: 200,
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                _textEditRow(icon: Icons.email, inputLabel: 'Email'),
                const Separator(),
                _textEditRow(icon: Icons.password, inputLabel: 'Senha', isPassword: true),
                const Separator(flex: 2),
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
