import 'package:flutter_starter_app/models/task_model.dart';
import 'package:flutter_starter_app/units/read_task/repository/read_task_repository.dart';
import 'package:flutter_starter_app/units/read_task/service/read_task_service_impl.dart';

class ReadTaskRepository implements IReadTaskRepository{

  var _service = ReadTaskService();

  @override
  Future<List<TaskModel>> getAllTasks() async{

    return await _service.getAllTasks();
  }

}