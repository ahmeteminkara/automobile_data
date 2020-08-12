import 'package:flutter/material.dart';

class DrawerFilterOptions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          ListTile(title: Text("List 1")),
          ListTile(title: Text("List 2")),
          ListTile(title: Text("List 3")),
          ListTile(title: Text("List 4")),
          ListTile(title: Text("List 5")),
        ],
      ),
    );
  }
}
