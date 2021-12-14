import 'package:flutter_starter_app/models/task_model.dart';

abstract class ITaskService {
  List<TaskModel> getListOfTasks();
  TaskModel getSingeTask(String uuid);
  Future<void> insertTask(Map taskFormData);
  Future<void> deleteTask(String taskId);
  void updateTask(TaskModel newTask);
  Future<TaskModel> getAllTasks();
}