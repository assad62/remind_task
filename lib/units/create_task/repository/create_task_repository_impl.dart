import 'package:flutter_starter_app/units/create_task/service/create_task_service_impl.dart';
import 'create_task_repository.dart';

class CreateTaskRepository implements ICreateTaskRepo{
  var _service = CreateTaskService();
  @override
  Future<void> addTaskToDatabase(Map<String,dynamic> taskMap) async{
    await _service.addTaskToDatabase(taskMap);
  }

}