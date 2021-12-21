import 'package:flutter_starter_app/units/create/repository/create_task_repository.dart';
import 'package:flutter_starter_app/units/create/service/create_task_service_impl.dart';

class CreateTaskRepository implements ICreateTaskRepo{
  var _service = CreateTaskService();
  @override
  Future<void> addTaskToDatabase(Map<String,dynamic> taskMap) async{
    await _service.addTaskToDatabase(taskMap);
  }

}