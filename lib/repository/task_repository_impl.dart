import 'package:flutter_starter_app/models/task_model.dart';
import 'package:flutter_starter_app/repository/task_repository.dart';

class TaskRepoImpl extends ITaskRepository{
  @override
  Future<void> deleteTask(String taskId) {
    // TODO: implement deleteTask
    throw UnimplementedError();
  }

  @override
  Future<TaskModel> getAllTasks() {
    // TODO: implement getAllTasks
    throw UnimplementedError();
  }

  @override
  List<TaskModel> getListOfTasks() {
    // TODO: implement getListOfTasks
    throw UnimplementedError();
  }

  @override
  Future<void> insertTask(Map taskFormData) {
    // TODO: implement insertTask
    throw UnimplementedError();
  }

  @override
  void updateTask(TaskModel newTask) {
    // TODO: implement updateTask
  }

}