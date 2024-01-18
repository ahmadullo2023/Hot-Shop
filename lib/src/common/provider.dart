import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class ProFunc extends ChangeNotifier{

  int value1 = 0;
  int value2 = 0;
  int value3 = 0;
  String brandId = '';
  String categoryId = '';
  String categoryId1 = '';

  // void categoryIdHome(String? value, snapshot) {
  //   value3 = int.parse(value!);
  //   categoryId1 = snapshot.data!.docs[value3].id.toString();
  //   notifyListeners();
  // }

  String? nameUp(value) {
    if (value != null && !RegExp(r".{3,}").hasMatch(value)) {
      return 'at least 3 characters';
    }
    return null;
  }
  String? emailUp(value) {
    if (value != null && !RegExp(r".{6,}@gmail.com").hasMatch(value)) {
      return 'enter your email correctly';
    }
    return null;
  }
  String? passwordUp(value) {
    if (value != null && !RegExp(r".{8,}").hasMatch(value)) {
      return 'at least 8 characters';
    }
    return null;
  }
  String? emailIn(value) {
    if (value != null && !RegExp(r".{6,}@gmail.com").hasMatch(value)) {
      return 'enter your email correctly';
    }
    return null;
  }
  String? passwordIn(value) {
    if (value != null && !RegExp(r".{8,}").hasMatch(value)) {
      return 'at least 8 characters';
    }
    return null;
  }

 Future<void> addTextToFirestore(
    String textName,
    String textPrice,
    String textDescription,
    String url1,
    String categoryId,
  ) async {
          print("opopopoopopopopopopopopoppopo");

    try {
      print("KMKMKMKMMKMMKMMMMMMMMMMKMKMKMKM");
       FirebaseFirestore.instance.collection('product').add({
        "name": textName,
        "price": textPrice,
        "description": textDescription,
        "url": url1,
        "categoryId": categoryId
      });
      print('Text added successfully');
    } catch (e) {
      print('Error adding text: $e');
    }
  }
}