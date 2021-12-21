import 'package:flutter_starter_app/units/create/create_task.dart';
import 'package:flutter_starter_app/units/create/repository/create_task_repository_impl.dart';

class CreateTaskUnit implements ICreateTaskUnit{

  var _repo = CreateTaskRepository();

  @override
  Future<void> addTaskToDatabase(Map<String,dynamic> taskMap) async {
    await _repo.addTaskToDatabase(taskMap);
  }

}