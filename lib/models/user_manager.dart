import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:loja_virtual/helpers/firebase_errors.dart';
import 'package:loja_virtual/models/user_app.dart';

import 'database_objects/cliente.dart';

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


  Future<void> addCliente(
      {Cliente? cliente, Function? onFail, Function? onSuccess}) async {
    loading = (true);
    try {
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
