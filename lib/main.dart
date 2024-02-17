import 'package:flutter/material.dart';
import 'package:studyjam5/page/network_storage/network_storage_page.dart';
import 'package:studyjam5/util/goroutes.dart';
import 'package:go_router/go_router.dart';
import 'util/routes.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      onGenerateRoute: Routes.generateRoute,
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return MaterialApp.router(
  //     title: 'Flutter Demo',
  //     theme: ThemeData(
  //       colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
  //       useMaterial3: true,
  //     ),
  //    routerConfig: GoRoutes.router,
  //   );
  // }



}

