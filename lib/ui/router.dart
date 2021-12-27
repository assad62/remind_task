import 'package:flutter/material.dart';
import 'package:flutter_starter_app/ui/views/create_task_view.dart';
import 'views/home_view.dart';


class SelectedDate{
  DateTime? selectedDate;

  SelectedDate({ this.selectedDate});
}


class AppRoutes{
  static const String homeRoute ="home";
  static const String loginPageRoute = "login";
  static const String newTaskPageRoute = "new_task";
  static const String createTaskPageRoute = "create_task";
}

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.homeRoute:
        return MaterialPageRoute(builder: (_) => HomeView());
      case AppRoutes.createTaskPageRoute:

        var selectedDate = settings.arguments as SelectedDate;
        return MaterialPageRoute(builder: (_) =>
            CreateTaskView(selectedDate:selectedDate.selectedDate)
        );

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