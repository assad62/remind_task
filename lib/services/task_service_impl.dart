import 'dart:convert';

import 'package:flutter_starter_app/database/app_database_service.dart';
import 'package:flutter_starter_app/models/task_model.dart';
import 'package:flutter_starter_app/services/task_service.dart';
import 'package:sembast/sembast.dart';

class TaskService extends ITaskService{




  var _store = StoreRef.main();

  @override
  Future<void> deleteTask(String taskId) {
    // TODO: implement deleteTask
    throw UnimplementedError();
  }

  @override
  Future<TaskModel> getAllTasks() {
    // TODO: implement getAllTasks
    throw UnimplementedError();


    //var title = await store.record('title').get(db) as String;
  }

  @override
  Future<List<TaskModel>> getListOfTasks() async {
    // TODO: implement getListOfTasks


    int count = await _store.count(await AppDatabaseService().getAppDataBase());

    var finder = Finder();
    var records = await _store.find(await AppDatabaseService().getAppDataBase(), finder: finder);
    for(RecordSnapshot<dynamic, dynamic> map in records){

      print("inputMap is $map");
      //UploadTagModel().uploadToServer(inputMap);
    }




    throw UnimplementedError();


  }

  @override
  TaskModel getSingeTask(String uuid) {
    // TODO: implement getSingeTask
    throw UnimplementedError();
  }

  @override
  Future<void> insertTask(Map taskFormData) async{
    var db = await AppDatabaseService().getAppDataBase();
    await _store.record(taskFormData['uuid']).
        put(db, taskFormData['data']);
  }

  @override
  void updateTask(TaskModel newTask) {
    // TODO: implement updateTask
  }
  
}