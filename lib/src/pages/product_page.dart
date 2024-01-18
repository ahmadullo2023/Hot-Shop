import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../common/provider.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({
    super.key,
    required this.product,
  });

  final QueryDocumentSnapshot<Map<String, dynamic>> product;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(children: [
          Container(
            height: 500,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  "${product['url']}",
                ),
              ),
            ),
          ),
          Align(
            alignment: const Alignment(-.9, 0),
            child: Text(
              "${product.data()['name']}\n"
                  "${product.data()['description']}\n\n"
                  "Price:  ${product.data()['price']}\n",
              style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: ElevatedButton(
                  onPressed: () {
                  },
                  child: const Text("Hoziroq sotib olish"),
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.only(left: 10, right: 10),
              //   child: ElevatedButton(
              //     onPressed: () {
              //       Provider.of<ProFunc>(context, listen: false)
              //           .addBasketFirestore(product.data());
              //     },
              //     child: const Text("Savatchaga solish"),
              //   ),
              // ),
            ],
          ),
        ]),
      ),
    );
  }
}
