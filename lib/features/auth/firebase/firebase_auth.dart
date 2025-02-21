import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo/features/auth/data/user_model.dart';

class FireAuth {
  static signUpAccount(
    String email,
    String password, {
    required UserModel model,
    required Function onSuccess,
    required Function onError,
  }) async {
    try {
      final credintial =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      addUser(model);
      credintial.user?.sendEmailVerification();
      onSuccess();
    } on FirebaseAuthException catch (e) {
      onError(e.message);
    } catch (e) {
      onError(e.toString());
    }
  }

  static CollectionReference<UserModel> getUserCollection() {
    return FirebaseFirestore.instance
        .collection('Users')
        .withConverter<UserModel>(
            fromFirestore: (snapshot, _) => UserModel.fromJson(
                  snapshot.data()!,
                ),
            toFirestore: (user, _) => user.toJson());
  }

  static Future<void> addUser(UserModel model) async {
    model.id = FirebaseAuth.instance.currentUser!.uid;
    var collection = getUserCollection();
    var docRef = collection.doc(model.id);
    docRef.set(model);
  }

  static Future<UserModel?> readUserData(String userId) async {
    var collection = getUserCollection();
    DocumentSnapshot<UserModel> docUser = await collection.doc(userId).get();
    return docUser.data();
  }

  static loginAccount(
    String email,
    String password, {
    required Function onSuccess,
    required Function onError,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      if (credential.user!.emailVerified) {
        onSuccess();
      }
    } on FirebaseAuthException catch (e) {
      onError(e.message);
    }
  }
}
