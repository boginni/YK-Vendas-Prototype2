import 'package:app_loja01/helpers/firebase_errors.dart';
import 'package:app_loja01/models/user_app.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';

class UserManager extends ChangeNotifier {
  final FirebaseAuth auth = FirebaseAuth.instance;

  bool _loading = false;
  bool get loading => _loading;

  Future<void> signIn(
      {UserApp? userApp, Function? onFail, Function? onSuccess}) async {
    loading = (true);
    try {
      final UserCredential result = await auth.signInWithEmailAndPassword(
          email: userApp!.email, password: userApp.password);
      onSuccess!();
    } on FirebaseAuthException catch (e) {
      onFail!(getErrorString(e.code));
    }
    loading = (false);
  }

  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }
}
