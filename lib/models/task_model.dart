class TaskModel {
  DateTime dateTime;
  String title;
  String description;
  bool remindMe;
  String? attachmentPath;


  TaskModel({
             required this.dateTime,
             required this.title,
             required this.description,
             required this.remindMe,
             this.attachmentPath});
}