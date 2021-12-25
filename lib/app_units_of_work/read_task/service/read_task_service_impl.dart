import 'dart:convert';

import 'package:flutter_starter_app/app_units_of_work/read_task/service/read_task_service.dart';
import 'package:flutter_starter_app/database/app_database_service.dart';
import 'package:flutter_starter_app/models/task_model.dart';
import 'package:flutter_starter_app/units/date_transform/task_date_service_impl.dart';

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

    tasks.forEach((element) {
      print("element is ${element.data?.description}");
    });
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

}