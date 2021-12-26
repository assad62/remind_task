class TaskModel {
  String? uuid;
  Data? data;
  String? date;
  TaskModel({required this.uuid,required this.data, required this.date});

  TaskModel.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    date = json['date'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uuid'] = this.uuid;
    data['date'] = this.date;
    if (this.data != null) {
      data['data'] = this.data?.toJson();
    }
    return data;
  }
}

class Data {

  int? startTime;
  int? endTime;
  String? title;
  String? description;
  String? attachmentPhoto;
  bool? remindMe;
  int? colorPicker;

  Data(
      {
        this.startTime,
        this.endTime,
        this.title,
        this.description,
        this.colorPicker,
        this.attachmentPhoto,
        this.remindMe});

  Data.fromJson(Map<String, dynamic> json) {
    colorPicker= json['colorPicker'];

    startTime = json['startTime'];
    endTime = json['endTime'];
    title = json['title'];
    description = json['description'];
    attachmentPhoto = json['attachmentPhoto'];
    remindMe = json['remindMe'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['endTime'] = this.endTime;
    data['startTime'] = this.startTime;
    data['title'] = this.title;
    data['description'] = this.description;
    data['attachmentPhoto'] = this.attachmentPhoto;
    data['remindMe'] = this.remindMe;
    data['colorPicker'] = this.colorPicker;
    return data;
  }
}