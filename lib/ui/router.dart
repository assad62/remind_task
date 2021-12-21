import 'package:flutter/material.dart';
import 'package:flutter_starter_app/ui/views/create_task_view.dart';
import 'views/home_view.dart';


class AppRoutes{
  static const String homeRoute ="home";
  static const String loginPageRoute = "login";
  static const String newTaskPageRoute = "new_task";
  static const String createTaskPageRoute = "create";
}

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.homeRoute:
        return MaterialPageRoute(builder: (_) => HomeView());
      case AppRoutes.createTaskPageRoute:
        return MaterialPageRoute(builder: (_) => CreateTaskView());

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