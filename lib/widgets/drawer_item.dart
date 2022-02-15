import 'package:flutter/material.dart';

import '../types/user_data.dart';
import './separator.dart';

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
      if (userData!.userImage!.isNotEmpty) {
        return UserAccountsDrawerHeader(
          accountEmail: Text(userData!.userEmail),
          accountName: Text(userData!.userName),
          currentAccountPicture: CircleAvatar(
            backgroundImage: NetworkImage(userData!.userImage ?? ''),
          ),
        );
      } else {
        return UserAccountsDrawerHeader(
          accountEmail: Text(userData!.userEmail),
          accountName: Text(userData!.userName),
        );
      }
    } else {
      return ListTile(
        leading: Icon(icon),
        title: Text(title ?? ''),
        onTap: onTap,
      );
    }
  }
}
