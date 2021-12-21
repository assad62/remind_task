import 'package:flutter_starter_app/models/task_model.dart';
import 'package:flutter_starter_app/units/read/read_task.dart';
import 'package:flutter_starter_app/units/read/repository/read_task_repository_impl.dart';

class ReadTaskUnit implements IReadTaskUnit{

  var _repo = ReadTaskRepository();

  @override
  Future<List<TaskModel>> getAllTasks() async {
     return await _repo.getAllTasks();
  }

}