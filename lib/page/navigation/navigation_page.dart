import 'package:flutter/material.dart';

import '../../util/routes.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
        title: const Text("Navigation"),
      ),
      drawer: Drawer(
        child: ListView(),
      ),
      body: ListView(
        children: [
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
            ),
            onPressed: () {
              Navigator.pushNamed(context, Routes.firstPage);
            },
            child: const Text(".push()"),
          ),
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
            ),
            onPressed: () {
              Navigator.pushReplacementNamed(context, Routes.secondPage);
            },
            child: const Text(".pushReplacement()"),
          ),
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.amberAccent,
              foregroundColor: Colors.white,
            ),
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, Routes.firstPage, (routes) => false);
            },
            child: const Text(".pushNamedAndRemoveUntil()"),
          ),
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
            ),
            onPressed: () {
              Navigator.popAndPushNamed(context, Routes.secondPage);
            },
            child: const Text(".popAndPushNamed()"),
          ),
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.deepPurple,
              foregroundColor: Colors.white,
            ),
            onPressed: () {
              Navigator.popAndPushNamed(context, Routes.secondPage);
            },
            child: const Text(".popAndPushNamed()"),
          ),
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.teal,
              foregroundColor: Colors.white,
            ),
            onPressed: () {
              Navigator.restorablePushNamed(context, Routes.secondPage);
            },
            child: const Text(".restorablePushNamed()"),
          ),

        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.camera), label: "Camera"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
