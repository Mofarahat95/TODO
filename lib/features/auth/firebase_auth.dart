import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo/features/auth/signup/data/user_model.dart';

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

  static loginAccount(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }
}
