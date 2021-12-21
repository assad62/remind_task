import 'dart:convert';
import 'package:flutter_starter_app/database/app_database_service.dart';
import 'package:flutter_starter_app/units/create/service/create_task_service.dart';
import 'package:sembast/sembast.dart';

class CreateTaskService implements ICreateTaskService{
  var _store = StoreRef.main();

  Future<void> _saveTaskToLocalDb(Map<String,dynamic> taskMap) async{
       var db = await AppDatabaseService().getAppDataBase();
      _store.record(taskMap["uuid"]).put(db, json.encode(taskMap));
  }

  @override
  Future<void> addTaskToDatabase(Map<String,dynamic> taskMap) async {
       await _saveTaskToLocalDb(taskMap);
  }

}