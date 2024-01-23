import 'package:flutter/material.dart';
import '../screens/sign_up.dart';

class MyHomePage {
  Future showYesNoDialog(BuildContext context) async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Chiqib ketish'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Rostanham akkauntdan chiqib ketmochimisiz?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Ha'),
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => const SignUp()),
                  (route) => false,
                );
              },
            ),
            TextButton(
              child: Text('Yoq'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
