import 'package:flutter/material.dart';
import 'package:flutter_starter_app/common/base_model.dart';
import 'package:flutter_starter_app/common/navigation_service.dart';
import 'package:flutter_starter_app/common/viewstate.dart';
import 'package:flutter_starter_app/models/task_model.dart';
import 'package:flutter_starter_app/ui/router.dart';
import 'package:flutter_starter_app/units/read_task/read_task_impl.dart';

import '../locator.dart';

class TodayViewModel extends BaseModel{
  var _context = locator<NavigationService>().navigatorKey.currentContext!;
  var _readTaskUnit = ReadTaskUnit();


  List<TaskModel> tasksList = [];
  void addNewTask() async{

   await Navigator.pushNamed(_context, AppRoutes.createTaskPageRoute);
   getTasks();
   print("aaaaaa is on back first load");
  }

  void onFirstLoad() async{
      getTasks();
      print("aaaaaa is inside first load");

  }

  void getTasks() async{
     setState(ViewState.Busy);
     tasksList = await _readTaskUnit.getAllTasks();
     setState(ViewState.Idle);
  }
}