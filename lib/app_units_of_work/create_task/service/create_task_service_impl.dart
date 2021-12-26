import 'dart:convert';
import 'package:flutter_starter_app/database/app_database_service.dart';
import 'package:sembast/sembast.dart';
import 'create_task_service.dart';

class CreateTaskService implements ICreateTaskService{
  var _store = StoreRef.main();

  Future<void> _saveTaskToLocalDb(Map<String,dynamic> taskMap) async{
      print("taskMap save to local db is $taskMap");
       var db = await AppDatabaseService().getAppDataBase();


       print("******");
       print("***about to save");


       await _store.record(taskMap["uuid"]).put(db, json.encode(taskMap));
       //try{
       //   _store.record(taskMap["uuid"]).put(db, json.encode(taskMap)).
       //   catchError((e)=>print(e));

       // }
       // catch(e){
       //   print("e is $e");
       // }

      print("**save complete");






  }

  @override
  Future<void> addTaskToDatabase(Map<String,dynamic> taskMap) async {
       await _saveTaskToLocalDb(taskMap);
  }

}