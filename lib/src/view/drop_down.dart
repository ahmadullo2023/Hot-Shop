import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/provider.dart';

class DropDownCategory extends StatelessWidget {
  const DropDownCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Padding(
        padding: const EdgeInsets.only(right: 0, left: 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            StreamBuilder(
              stream:
                  FirebaseFirestore.instance.collection('category').snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const CircularProgressIndicator();
                }
                return DropdownButton(
                  dropdownColor: Colors.indigoAccent,
                  value: Provider.of<ProFunc>(context).value2.toString(),
                  onChanged: (String? value) {
                    Provider.of<ProFunc>(context, listen: false)
                        .categoryDropDown(value, snapshot);
                  },
                  items: List.generate(
                    snapshot.data!.docs.length,
                    (index) {
                      return DropdownMenuItem(
                        value: index.toString(),
                        child: Text(
                          "${snapshot.data!.docs[index].get('name')}",
                          style: TextStyle(color: Colors.white),
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
    );
  }
}
