import 'dart:convert';
import 'package:flutter_starter_app/app_units_of_work/read_task/service/read_task_service.dart';
import 'package:flutter_starter_app/database/app_database_service.dart';
import 'package:flutter_starter_app/models/task_model.dart';
import 'package:flutter_starter_app/units/date_transform/task_date_service_impl.dart';
import 'package:intl/intl.dart';

import 'package:sembast/sembast.dart';

class ReadTaskService implements IReadTaskService{

  var _store = StoreRef.main();
  var _transformDate = TaskDateService();


  Future<List<TaskModel>> _getAllTasksFromDb () async{
    var finder = Finder();
    var records = await _store.find(await AppDatabaseService().getAppDataBase(), finder: finder);
    List<TaskModel> tasks = [];

    for(RecordSnapshot<dynamic, dynamic> map in records){
      tasks.add(TaskModel.fromJson(json.decode(map.value)));
    }

    return tasks;
  }

  @override
  Future<List<TaskModel>> getAllTasks()async {

    return await _getAllTasksFromDb();


  }


  String _getFormattedTime(int time){
     return _transformDate.formatDateTimeToString(time);
  }

  String getFormattedStartEndTime(int startTime, int endTime) {
    String startTimeAsString = _getFormattedTime(startTime);
    String endTimeAsString = _getFormattedTime(endTime);

    return "$startTimeAsString - $endTimeAsString";
  }

  @override
  Future<List<TaskModel>> getTasksForDay(DateTime day) async {

    String date =  DateFormat.yMMMd().format(day);
    List<TaskModel> allTasks = await _getAllTasksFromDb();

    List<TaskModel> filteredTasks = allTasks.where((e) => e.date == date).toList();

    filteredTasks.forEach((element) {
      print("eeee is ${element.date}");
    });
    return filteredTasks;
  }

  @override
  Future<Map<String, List<TaskModel>>> getTasksForMonth(DateTime today) async {

    Map<String, List<TaskModel>> tasksForMonth = {};


    DateTime now = new DateTime.now();
    DateTime lastDayOfMonth = new DateTime(now.year, now.month+1, 0);
    print("N days: ${lastDayOfMonth.day}");

    List<TaskModel> allTasks = await _getAllTasksFromDb();

    for(int a=0;a<allTasks.length;a++){
        String date = allTasks[0].date ?? "";
        tasksForMonth[date] = allTasks.where((element) => element.date == date).toList();
    }



     return tasksForMonth;
  }



}