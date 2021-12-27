import 'package:flutter/material.dart';
import 'package:flutter_starter_app/app_units_of_work/read_task/read_task_impl.dart';
import 'package:flutter_starter_app/common/base_model.dart';
import 'package:flutter_starter_app/common/navigation_service.dart';
import 'package:flutter_starter_app/common/viewstate.dart';
import 'package:flutter_starter_app/models/task_model.dart';
import 'package:flutter_starter_app/ui/router.dart';
import '../locator.dart';

class TodayViewModel extends BaseModel{
  var _context = locator<NavigationService>().navigatorKey.currentContext!;
  var _readTaskUnit = ReadTaskUnit();


  List<TaskModel> tasksList = [];
  void addNewTask() async{

   await Navigator.pushNamed(_context,
       AppRoutes.createTaskPageRoute,
       arguments: SelectedDate()
   );
   getTasks();

  }

  void onFirstLoad() async{
      getTasks();
      print("aaaaaa is inside first load");

  }

  void getTasks() async{
     setState(ViewState.Busy);
     tasksList = await _readTaskUnit.getTasksForDay(DateTime.now()) ?? [];
     setState(ViewState.Idle);
  }

  String getTime(TaskModel taskModel) {
    return _readTaskUnit.getFormattedStartEndTime(taskModel.data?.startTime ?? 0, taskModel.data?.endTime ?? 0);
  }
}