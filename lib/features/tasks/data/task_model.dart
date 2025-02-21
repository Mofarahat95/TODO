class TaskModel {
  final String title;
  final String description;
  final int date;
   bool isDone;
  String id;
  String uid;

  TaskModel({
    this.id = '',
    required this.title,
    required this.uid,
    required this.description,
    required this.date,
    this.isDone = false,
  });

  TaskModel.fromJson(Map<String, dynamic> json)
      : this(
          uid: json['uid'],
          title: json['title'],
          description: json['description'],
          date: json['date'],
          isDone: json['isDone'],
          id: json['id'],
        );

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'id': id,
      'title': title,
      'description': description,
      'date': date,
      'isDone': isDone,
    };
  }
}
