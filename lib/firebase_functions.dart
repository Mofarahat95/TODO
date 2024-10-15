import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo/features/domain/entities/taskmodel.dart';

class FirebaseFunctions {
  static CollectionReference<TaskModel> getTaskCollection() {
    return FirebaseFirestore.instance
        .collection("Tasks")
        .withConverter<TaskModel>(
          fromFirestore: (snapshot, _) => TaskModel.fromJson(snapshot.data()!),
          toFirestore: (TaskModel, _) => TaskModel.toJson(),
        );
  }

  static void addTask(TaskModel model) {
    var collection = getTaskCollection();
    var docRef = collection.doc();
    model.id = docRef.id;
    docRef.set(model);
  }

  static Stream<QuerySnapshot<TaskModel>> getTask(DateTime Date) {
    var collection = getTaskCollection();
    return collection
        .where(
          'date',
          isEqualTo: DateUtils.dateOnly(Date).millisecondsSinceEpoch,
        )
        .snapshots();
  }

  static Future<void> deleteTask(String id) {
    return getTaskCollection().doc(id).delete();
  }

 static Future<void> updateTask(TaskModel model) {
   return getTaskCollection().doc(model.id).update(model.toJson());
  }
}
