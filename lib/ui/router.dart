import 'package:flutter/material.dart';
import 'views/home_view.dart';


class AppRoutes{
  static const String homeRoute ="home";
  static const String loginPageRoute = "login";
  static const String newTaskPageRoute = "new_task";
}

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.homeRoute:
        return MaterialPageRoute(builder: (_) => HomeView());

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
              body: Center(
                child: Text('No route defined for ${settings.name}'),
              ),
            ));
    }
  }
}