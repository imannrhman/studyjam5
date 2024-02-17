import 'package:flutter/material.dart';
import 'package:studyjam5/page/navigation/navigation_page.dart';
import 'package:studyjam5/page/network_storage/network_storage_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              child: const Text("Network & Storage"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NetworkStoragePage(),
                  ),
                );
              },
            ),
          ),
          Center(
            child: ElevatedButton(
                child: const Text("Navigation"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NavigationPage(),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
