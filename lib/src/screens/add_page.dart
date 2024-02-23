import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hot_shop/src/view/textformfield_item.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../common/constants/app_collors.dart';
import '../controller/provider.dart';
import '../widget/google_map.dart';

class AddPage extends StatefulWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final formKey1 = GlobalKey<FormState>();
  final TextEditingController textName = TextEditingController();
  final TextEditingController textPrice = TextEditingController();
  final TextEditingController textDescription = TextEditingController();
  final TextEditingController textPhone = TextEditingController();

  int? value1 = 0;
  int? value2 = 0;
  String brandId = '';
  String categoryId = '';
  LatLng latLng = LatLng(33.6844, 73.0479);
  String latLng4 = "Hello";
  XFile? image1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bcColor,
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.blueGrey,
              ),
              child: Center(
                child: image1 == null
                    ? IconButton(
                        onPressed: () async {
                          showModalBottomSheet<void>(
                            context: context,
                            builder: (BuildContext context) {
                              return Container(
                                height: 75,
                                color: const Color(0xFF040210),
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      ElevatedButton(
                                        onPressed: () async {
                                          XFile? image = await ImagePicker()
                                              .pickImage(
                                                  source: ImageSource.camera);
                                          setState(() {
                                            image1 = image;
                                          });
                                        },
                                        child: const Text('Camera'),
                                      ),
                                      ElevatedButton(
                                        onPressed: () async {
                                          XFile? image = await ImagePicker()
                                              .pickImage(
                                                  source: ImageSource.gallery);
                                          setState(() {
                                            image1 = image;
                                          });
                                        },
                                        child: const Text('Gallery'),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        icon: const Icon(
                          Icons.add_circle_outline,
                          color: Colors.white,
                          size: 35,
                        ),
                      )
                    : GestureDetector(
                        onTap: () async {
                          showModalBottomSheet<void>(
                            context: context,
                            builder: (BuildContext context) {
                              return Container(
                                height: 75,
                                color: const Color(0xFF040210),
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      ElevatedButton(
                                        onPressed: () async {
                                          XFile? image = await ImagePicker()
                                              .pickImage(
                                                  source: ImageSource.camera);
                                          setState(() {
                                            image1 = image;
                                          });
                                        },
                                        child: const Text('Camera'),
                                      ),
                                      ElevatedButton(
                                        onPressed: () async {
                                          XFile? image = await ImagePicker()
                                              .pickImage(
                                                  source: ImageSource.gallery);
                                          setState(() {
                                            image1 = image;
                                          });
                                        },
                                        child: const Text('Gallery'),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        child: Image.file(
                          File(image1!.path),
                          height: 200,
                        ),
                      ),
              ),
            ),
          ),
          ItemTextField2(
            hintText: 'Maxsulot nomi',
            textController: textName,
            maxLength: 15,
          ),
          ItemTextField2(
            hintText: 'Maxsulot narxi',
            textController: textPrice,
            textType: TextInputType.number,
          ),
          ItemTextField2(
            hintText: 'Maxsulot haqida ikki og\'iz ma\'lumot',
            textController: textDescription,
          ),
          ItemTextField2(
            hintText: "Bog'lanish uchun telefon raqamingiz",
            textController: textPhone,
            textType: TextInputType.phone,
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Container(
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.blueAccent,
              ),
              child: Padding(
                padding: const EdgeInsets.only(right: 10, left: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Katigoriyasi",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection('category')
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return const CircularProgressIndicator();
                        }
                        return DropdownButton<String>(
                          value: value2.toString(),
                          icon: const Icon(Icons.arrow_downward),
                          onChanged: (String? value) {
                            setState(() {
                              value2 = int.parse(value!);
                              categoryId =
                                  snapshot.data!.docs[value2!].id.toString();
                            });
                          },
                          items: List.generate(
                            snapshot.data!.docs.length,
                            (index) {
                              return DropdownMenuItem(
                                value: index.toString(),
                                child: Text(
                                  "${snapshot.data!.docs[index].get('name')}",
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Container(
              height: 200,
              width: double.infinity,
              color: Colors.blueGrey,
              child: const GoogleMap1(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: SizedBox(
              height: 55,
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () async {
                  var snapshot = await FirebaseStorage.instance
                      .ref()
                      .child('images/${image1!.path.split('/').last}')
                      .putFile(File(image1!.path));
                  var downloadUrl = await snapshot.ref.getDownloadURL();

                  await Provider.of<ProFunc>(context, listen: false)
                      .addTextToFirestore(
                    textName.text,
                    textPrice.text,
                    textDescription.text,
                    downloadUrl,
                    textPhone.text,
                    categoryId,
                    //Provider.of<ProFunc>(context).latLng1.toString(),
                    latLng.toString(),
                  );
                },
                style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    side: const BorderSide(
                      color: Colors.white,
                    )),
                child: const Text(
                  "Jo'ylash",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
