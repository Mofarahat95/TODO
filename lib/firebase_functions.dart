import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo/features/tasks/domain/task_model.dart';

class FirebaseFunctions {
  static CollectionReference<TaskModel> getCollection() {
    return FirebaseFirestore.instance
        .collection('Tasks')
        .withConverter<TaskModel>(
            fromFirestore: (snapshot, _) =>
                TaskModel.fromJson(snapshot.data()!),
            toFirestore: (task, _) => task.toJson());
  }

  static addTask(TaskModel model) {
    var collection = getCollection();
    var docRef = collection.doc();
    model.id = docRef.id;
    docRef.set(model);
  }

  static Stream<QuerySnapshot<TaskModel>> getTasks(DateTime date) {
    var collection = getCollection();
    return collection
        .where("date", isEqualTo: DateUtils.dateOnly(date).millisecondsSinceEpoch)
        .snapshots();
  }

  static updateTask(TaskModel model) {
    var collection = getCollection();
    return collection.doc(model.id).update(model.toJson());
  }

  static void deleteTask(String id) {
    var collection = getCollection();
    collection.doc(id).delete();
  }
}
