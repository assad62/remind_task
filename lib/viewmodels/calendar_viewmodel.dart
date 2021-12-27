import 'package:flutter/material.dart';
import 'package:flutter_starter_app/app_units_of_work/read_task/read_task_impl.dart';
import 'package:flutter_starter_app/common/base_model.dart';
import 'package:flutter_starter_app/common/navigation_service.dart';
import 'package:flutter_starter_app/common/viewstate.dart';
import 'package:flutter_starter_app/models/task_model.dart';
import 'package:flutter_starter_app/ui/router.dart';
import 'package:intl/intl.dart';

import '../locator.dart';


class CalendarViewModel extends BaseModel{
  var _readTaskUnit = ReadTaskUnit();
  var _context = locator<NavigationService>().navigatorKey.currentContext!;
  List<TaskModel> tasksForDay = [];
  Map<String,List<TaskModel>>tasksForMonth = {};

  void addNewTask (DateTime selectedDay) async{
     print("selected date is $selectedDay");

     await Navigator.pushNamed(_context,
         AppRoutes.createTaskPageRoute,
         arguments: SelectedDate(selectedDate: selectedDay)
     );

     getTasksForMonth();
  }



  void onFirstLoad() async{

      getTasksForMonth();

  }

  void getTasksForMonth()async{
    setState(ViewState.Busy);
    tasksForMonth = await _readTaskUnit.getTasksForMonth(DateTime.now());
    setState(ViewState.Idle);
  }

  Future<List<TaskModel?>> getEventsFoSelectedDay(DateTime dateTime)async{

    tasksForDay = await _readTaskUnit.getTasksForDay(dateTime) ?? [];
    print("tasks for day length is $tasksForDay");
    return tasksForDay;


  }


  List getEventsForDay(DateTime day){


    return tasksForMonth[DateFormat.yMMMd().format(day)] ?? [];
  }

  Widget getMarkers(DateTime date, TaskModel task) {


      return Padding(
        padding: const EdgeInsets.only(left: 1.0),
        child: Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(
              color: Color(task.data?.colorPicker ?? 0) ,
              borderRadius:
              BorderRadius.all(Radius.circular(20))),
        ),
      );

  }


}