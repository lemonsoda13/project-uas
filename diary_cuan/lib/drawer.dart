import 'package:diary_cuan/DrawList/about_us.dart';
import 'package:diary_cuan/DrawList/grapik.dart';
import 'package:diary_cuan/DrawList/kategori.dart';
import 'package:flutter/material.dart';

import 'header_drawer.dart';
import 'DrawList/grapik.dart';
import 'DrawList/kategori.dart';
import 'DrawList/about_us.dart';

class DrawerPage extends StatelessWidget {
  const DrawerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawer(),
    );
  }
}

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color(0xFF332FD0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            MyHeaderDrawer(),
            buildMenuItems(context),
          ],
        ),
      ),
    );
  }

  Widget buildMenuItems(BuildContext context) {
    return Column(
      children: [
        Wrap(children: [
          ListTile(
            title: Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                "Graphic",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Graphic()));
            },
          ),
          ListTile(
            title: Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                "Kategori",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            onTap: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => KategoriPage()));
            },
          ),
          ListTile(
            title: Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                "Tentang Kami",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            onTap: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => AboutPage()));
            },
          ),
        ])
      ],
    );
  }
}
