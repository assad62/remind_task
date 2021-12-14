import 'package:flutter/material.dart';
import 'package:flutter_starter_app/common/base_model.dart';
import 'package:flutter_starter_app/common/navigation_service.dart';
import 'package:flutter_starter_app/database/app_database_service.dart';
import 'package:flutter_starter_app/services/task_service_impl.dart';
import 'package:flutter_starter_app/ui/router.dart';

import '../locator.dart';

class TodayViewModel extends BaseModel{
  var _context = locator<NavigationService>().navigatorKey.currentContext!;

  void addNewTask() async{

   await Navigator.pushNamed(_context, AppRoutes.createTaskPageRoute);
   await TaskService().getListOfTasks();
  }

  void onFirstLoad() async{
  }
}