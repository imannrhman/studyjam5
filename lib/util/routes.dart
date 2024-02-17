import 'package:flutter/material.dart';
import 'package:studyjam5/page/main_page.dart';
import 'package:studyjam5/page/navigation/navigation_page.dart';
import 'package:studyjam5/page/navigation/pages/first_page.dart';

import '../page/navigation/pages/second_page.dart';

class Routes {
  static const String splash = '/';
  static const String firstPage = '/first_page';
  static const String secondPage = '/second_page';
  static const String navigationPage = '/navigation_page';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const MainPage());
      case navigationPage:
        return MaterialPageRoute(builder: (_) => const NavigationPage());
      case firstPage:
        return MaterialPageRoute(builder: (_) => const FirstPage());
      case secondPage:
        return MaterialPageRoute(builder: (_) => const SecondPage());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
              body: Center(
                  child: Text('No route defined for ${settings.name}')),
            ));
    }
  }
}