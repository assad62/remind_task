abstract class ICreateTaskService{
  Future<void> addTaskToDatabase(Map<String,dynamic>  taskMap);
}