import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hot_shop/src/common/constants/app_collors.dart';
import 'package:hot_shop/src/view/product_view.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bcColor,
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('favorite').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          var products = snapshot.data!.docs;
          return Column(
            children: [
              Expanded(
                child: Masonry(products: products),
              ),
            ],
          );
        },
      ),
    );
  }
}
