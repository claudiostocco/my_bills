import 'package:flutter/material.dart';
import 'package:my_bills/services/api/bills.dart';

import '../controllers/app_controller.dart';
import '../widgets/drawer_item.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _menuItem = 0;

  void _logout() {
    Navigator.pushReplacementNamed(context, '/');
  }

  void _setMenuItem(int item) {
    setState(() => _menuItem = item);
  }

  Widget _drawer() {
    return Column(
      children: [
        DrawerItem(userData: AppController.instance.userData, anonymous: AppController.instance.userData == null),
        DrawerItem(icon: Icons.list, title: 'Todas', onTap: () => _setMenuItem(0)),
        DrawerItem(icon: Icons.list, title: 'A vencer', onTap: () => _setMenuItem(1)),
        DrawerItem(icon: Icons.list, title: 'Por Período', onTap: () => _setMenuItem(2)),
        const DrawerItem(separator: true),
        DrawerItem(icon: Icons.logout, title: 'Sair', onTap: () => {_logout()}),
      ],
    );
  }

  Widget _listingBills() {
    getBills(null);

    switch (_menuItem) {
      case 0:
        return const Text('Todas as contas');
      case 1:
        return const Text('Contas a vencer');
      case 2:
        return const Text('Contas a vencidas');
      default:
        return const Text('Indefinido');
    }
  }

  @override
  Widget build(BuildContext context) {
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
        child: _listingBills(),
      ),
    );
  }
}
