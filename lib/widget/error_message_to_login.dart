// ignore_for_file: deprecated_member_use, unnecessary_new, prefer_const_constructors
import 'package:elangsung_test_mobile/screens/login/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:page_transition/page_transition.dart';

class ShowDialogError {
  static get context => null;

  static void showDialogErrorToLogin(message, BuildContext context) {
    final _storage = FlutterSecureStorage();
    _storage.delete(key: 'password');
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(message),
          actions: <Widget>[
            new FlatButton(
              child: Text("Close"),
              onPressed: () {
                Navigator.pushReplacement(context,
                  PageTransition(
                    type: PageTransitionType.fade,
                    child: LoginScreen(),
                  )
                );
              },
            ),
          ],
        );
      },
    );
  }
}