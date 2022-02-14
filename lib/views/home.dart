import 'package:flutter/material.dart';

import '../widgets/separator.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

UserData user = const UserData('claudiostocco@gmail.com', 'Claudio Marcio Stocco',
    userImage: 'https://avatars.githubusercontent.com/u/47143084?v=4');

class _HomeState extends State<Home> {
  void _logout() {
    Navigator.pushReplacementNamed(context, '/');
  }

  Widget _drawer() {
    return Column(
      children: [
        DrawerItem(userData: user),
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

class UserData {
  const UserData(this.userEmail, this.userName, {this.userImage});

  final String userName;
  final String userEmail;
  final String? userImage;
}

class DrawerItem extends StatelessWidget {
  const DrawerItem({Key? key, this.title, this.icon, this.separator = false, this.onTap, this.userData})
      : assert((title != null && icon != null && onTap != null) || separator || userData != null),
        super(key: key);

  final String? title;
  final IconData? icon;
  final bool separator;
  final GestureTapCallback? onTap;
  final UserData? userData;

  @override
  Widget build(BuildContext context) {
    if (separator) {
      return const LineSeparator(
        thickness: 2,
      );
    } else if (userData != null) {
      var userAccountsDrawerHeader = UserAccountsDrawerHeader(
        accountEmail: Text(userData!.userEmail),
        accountName: Text(userData!.userName),
      );
      // userAccountsDrawerHeader.currentAccountPicture.createElement(CircleAvatar(
      //   backgroundImage: NetworkImage(userData!.userImage ?? ''),
      // ));

      return userAccountsDrawerHeader;
    } else {
      return ListTile(
        leading: Icon(icon),
        title: Text(title ?? ''),
        onTap: onTap,
      );
    }
  }
}
