class TaskModel {
  String? uuid;
  Data? data;

  TaskModel({required this.uuid,required this.data});

  TaskModel.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uuid'] = this.uuid;
    if (this.data != null) {
      data['data'] = this.data?.toJson();
    }
    return data;
  }
}

class Data {
  int? date;
  int? startTime;
  int? endTime;
  String? title;
  String? description;
  String? attachmentPhoto;
  bool? remindMe;

  Data(
      {this.date,
        this.startTime,
        this.endTime,
        this.title,
        this.description,
        this.attachmentPhoto,
        this.remindMe});

  Data.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    startTime = json['startTime'];
    endTime = json['endTime'];
    title = json['title'];
    description = json['description'];
    attachmentPhoto = json['attachmentPhoto'];
    remindMe = json['remindMe'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['endTime'] = this.endTime;
    data['startTime'] = this.startTime;
    data['title'] = this.title;
    data['description'] = this.description;
    data['attachmentPhoto'] = this.attachmentPhoto;
    data['remindMe'] = this.remindMe;
    return data;
  }
}