import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hot_shop/src/common/constants/app_collors.dart';
import 'package:hot_shop/src/screens/product_view.dart';
import 'karusel.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.bcColor,
      body: HomeItem(),
    );
  }
}

class HomeItem extends StatelessWidget {
  const HomeItem({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('product').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }
        var products = snapshot.data!.docs;
        return Column(
          children: [
            const CustomHomeCarousel(),
            Expanded(
              child: Masonry(products: products),
            ),
          ],
        );
      },
    );
  }
}
