import 'package:flutter/material.dart';

class SideDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: Text('HOME'),
              onTap: () => Navigator.pushReplacementNamed(context, 'home'),
            ),
            ListTile(
              title: Text('SEARCH'),
              onTap: () => Navigator.pushNamed(context, 'search'),
            ),
            ListTile(
              title: Text('SETTINGS'),
              onTap: () => Navigator.pushNamed(context, 'settings'),
            ),
          ],
        ),
      ),
    );
  }
}
