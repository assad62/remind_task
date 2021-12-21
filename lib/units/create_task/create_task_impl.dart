
import 'package:flutter_starter_app/units/create_task/repository/create_task_repository_impl.dart';
import 'create_task.dart';

class CreateTaskUnit implements ICreateTaskUnit{

  var _repo = CreateTaskRepository();

  @override
  Future<void> addTaskToDatabase(Map<String,dynamic> taskMap) async {
    await _repo.addTaskToDatabase(taskMap);
  }

}