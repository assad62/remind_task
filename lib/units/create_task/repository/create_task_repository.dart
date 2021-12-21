abstract class ICreateTaskRepo{
  Future<void> addTaskToDatabase(Map<String,dynamic> taskMap);
}