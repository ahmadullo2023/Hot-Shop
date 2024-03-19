import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hot_shop/src/view/product_view.dart';
import 'package:provider/provider.dart';
import '../common/constants/app_collors.dart';
import '../controller/provider.dart';
import '../view/drop_down.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final formKey1 = GlobalKey<FormState>();
  TextEditingController searchTerm = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bcColor,
      body: Form(
        key: formKey1,
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('product')
              //.where("categoryId", isEqualTo: Provider.of<ProFunc>(context).categoryId)
              .where("name",
                  isEqualTo: Provider.of<ProFunc>(context, listen: false)
                      .searchTerm1
                      .text)
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            var products = snapshot.data!.docs;
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Row(
                    children: [
                      const DropDownCategory(),
                      Expanded(
                        child: SizedBox(
                          height: 45,
                          child: TextField(
                              controller: searchTerm,
                              style: const TextStyle(color: Colors.white),
                              decoration: const InputDecoration(
                                suffixIcon: Icon(Icons.search),
                                hintText: "Search",
                                hintStyle: TextStyle(color: Colors.white),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                              ),
                              onChanged: (value) {
                                Provider.of<ProFunc>(context, listen: false)
                                    .searchFirestore(value);
                                Provider.of<ProFunc>(context, listen: false)
                                    .searchText(searchTerm);
                              }),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Masonry(products: products),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
