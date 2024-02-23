import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../screens/page_builder.dart';
import '../service/auth_service.dart';

class ProFunc extends ChangeNotifier {
  int value2 = 0;
  int value3 = 0;
  String categoryId = '';
  String categoryId1 = '';
  late LatLng latLng1;
  TextEditingController searchTerm1 = TextEditingController();


  LatLng latLngFunc(latLng2){
    latLng1 = latLng2;
    return latLng1;
    notifyListeners();
  }


  void searchText(searchTerm){
    searchTerm1 = searchTerm;
    notifyListeners();
  }


  Future<void> addTextToFirestore(
    String textName,
    String textPrice,
    String textDescription,
    String url1,
    String textPhone,
    String categoryId,
    String latLng,
  ) async {
    print("opopopoopopopopopopopopoppopo");
    try {
      FirebaseFirestore.instance.collection('product').add({
        "name": textName,
        "price": textPrice,
        "description": textDescription,
        "url": url1,
        "phoNum": textPhone,
        "categoryId": categoryId,
        "latLng": latLng
      });
      print('Text added successfully');
    } catch (e) {
      print('Error adding text: $e');
    }
  }

  Future<void> addFavoriteFirestore(
    Map<String, dynamic> product,
  ) async {
    try {
      await FirebaseFirestore.instance.collection('favorite').add(product);
      print('Text added successfully');
    } catch (e) {
      print('Error adding text: $e');
    }
  }

  Future<void>  deleteFavoriteFirestore(
    final productId,
  ) async {
    try{
      await FirebaseFirestore.instance.collection('favorite').doc(productId).delete();
      print('Document deleted successfully');
    } catch (e){
      print('Error deleting text: $e');
    }
  }



  void categoryIdHome(String? value, snapshot) {
    value3 = int.parse(value!);
    categoryId1 = snapshot.data!.docs[value3].id.toString();
    notifyListeners();
  }

  void categoryDropDown(String? value, snapshot) {
    value2 = int.parse(value!);
    categoryId = snapshot.data!.docs[value2].id.toString();
    notifyListeners();
  }

  Future<void> signInWithEmailAndPassword(email, password, context) async {
    await Auth()
        .signInWithEmailAndPassword(
          email: email.value.text,
          password: password.value.text,
        )
        .then(
          (value) => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => const PageBuilder()),
          ),
        );
  }

  Future<void> createUserWithEmailAndPassword(email, password, context) async {
    await Auth()
        .createUserWithEmailAndPassword(
          email: email.value.text,
          password: password.value.text,
        )
        .then(
          (value) => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => const PageBuilder()),
          ),
        );
  }

  Future<void> searchFirestore(String searchTerm) async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('product')
        .where('name', isEqualTo: searchTerm)
        .get();

    for (QueryDocumentSnapshot document in querySnapshot.docs) {
      print(document.data());
    }
  }
}
