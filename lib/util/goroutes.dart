import 'package:go_router/go_router.dart';
import 'package:studyjam5/page/main_page.dart';
import 'package:studyjam5/page/navigation/navigation_page.dart';
import 'package:studyjam5/page/navigation/pages/first_page.dart';

abstract class GoRoutes {
  static GoRouter router = GoRouter(
    routes: [
      GoRoute(path: "/",
          builder: (context, state) => const MainPage(),
          routes: [
        GoRoute(
            path: 'navigation',
            builder: (context, state) {
              return const NavigationPage();
            },
            routes: [
              GoRoute(
                path: 'first_page',
                builder: (context, state) {
                  return const FirstPage();
                },
              ),
              GoRoute(
                path: 'second_page',
                builder: (context, state) {
                  return const FirstPage();
                },
              ),
            ]),
      ])
    ],
  );
}
