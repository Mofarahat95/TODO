import 'package:cloud_firestore/cloud_firestore.dart';

class TaskModel {
  String id;
  String title;
  String descreption;
  int date;
  bool isDone;

  TaskModel({
    required this.title,
    required this.descreption,
    required this.date,
    this.id = '',
    this.isDone = false,
  });
  TaskModel.fromJson(Map<String, dynamic> json)
      : this(
          title: json['title'],
          descreption: json['descreption'],
          date: json['date'],
          isDone: json['isDone'],
          id: json['id'],
        );
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'descreption': descreption,
      'date': date,
      'id': id,
      'isDone': isDone,
    };
  }
}
