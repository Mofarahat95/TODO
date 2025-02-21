import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:todo/features/auth/data/user_model.dart';
import 'package:todo/features/auth/firebase/firebase_auth.dart';

class UserProvider extends ChangeNotifier {
  UserModel? userModel;
  User? firebaseUser;

  UserProvider() {
    firebaseUser = FirebaseAuth.instance.currentUser;
    if (firebaseUser != null) {
      initUser();
    }
  }

  Future<void> initUser() async {
    userModel = await FireAuth.readUserData(firebaseUser!.uid);
    notifyListeners();
  }
}
