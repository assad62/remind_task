class TaskModel {
  String uuid;
  String title;
  String description;
  bool remindMe;
  String? attachmentPath;


  TaskModel({required this.uuid, required this.title, required this.description, required this.remindMe, this.attachmentPath});
}