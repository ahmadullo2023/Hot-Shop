import 'package:flutter/material.dart';
import 'package:hot_shop/src/common/constants/app_collors.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.de9,
      body: Padding(
        padding: EdgeInsets.only(right: 20, left: 20),
        child: ListView(
          children: [
            Container(
              height: 170,
              width: 165,
              color: Colors.blue,
            ),
            SizedBox(height: 15),
            Container(
              height: 170,
              width: 165,
              color: Colors.orange,
            ),
            SizedBox(height: 15),
            Container(
              height: 170,
              width: 165,
              color: Colors.yellow,
            ),
            SizedBox(height: 15),
            Container(
              height: 170,
              width: 165,
              color: Colors.green,
            ),
            SizedBox(height: 15),
            Container(
              height: 170,
              width: 165,
              color: Colors.orange,
            ),
          ],
        ),
      ),
    );
  }
}