import 'package:flutter/material.dart';

import '../controllers/app_controller.dart';
import '../widgets/drawer_item.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void _logout() {
    Navigator.pushReplacementNamed(context, '/');
  }

  Widget _drawer() {
    return Column(
      children: [
        DrawerItem(userData: AppController.instance.userData),
        DrawerItem(icon: Icons.list, title: 'Todas', onTap: () => {}),
        DrawerItem(icon: Icons.list, title: 'A vencer', onTap: () => {}),
        DrawerItem(icon: Icons.list, title: 'Por Período', onTap: () => {}),
        const DrawerItem(separator: true),
        DrawerItem(icon: Icons.logout, title: 'Sair', onTap: () => {_logout()}),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    print('build: ' + AppController.instance.userData!.userEmail);

    return Scaffold(
      drawer: Drawer(
        child: _drawer(),
      ),
      appBar: AppBar(
        actions: [
          IconButton(
            padding: const EdgeInsets.only(right: 15),
            onPressed: _logout,
            icon: const Icon(Icons.logout),
          ),
        ],
        title: Text('Minhas Contas'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[],
        ),
      ),
    );
  }
}
