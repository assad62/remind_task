abstract class ICreateTaskUnit {
  Future<void> addTaskToDatabase(Map<String,dynamic> taskMap);
}