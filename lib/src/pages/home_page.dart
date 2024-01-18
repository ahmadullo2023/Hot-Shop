import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:hot_shop/src/common/constants/app_collors.dart';
import 'package:hot_shop/src/pages/product_page.dart';
import 'package:hot_shop/src/pages/profile_page.dart';
import 'package:hot_shop/src/pages/search_page.dart';
import 'package:hot_shop/src/pages/sign_up.dart';
import 'package:provider/provider.dart';
import '../common/provider.dart';
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
        backgroundColor: AppColors.de9,
      body: HomeItem(),
    );
  }
}

class HomeItem extends StatelessWidget {
  const HomeItem({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('product')
          // .where("categoryId",
          // isEqualTo: Provider.of<ProFunc>(context).categoryId1)
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const CircularProgressIndicator();
        }
        var products = snapshot.data!.docs;
        return Column(
          children: [
            const CustomHomeCarousel(),

            Expanded(
              child: MasonryGridView.count(
                itemCount: products.length,
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                ),
                crossAxisCount: 2,
                mainAxisSpacing: 4,
                crossAxisSpacing: 4,
                itemBuilder: (context, index) {
                  return ProductCard(
                    product: products[index],
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}







class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.product,
  });

  final QueryDocumentSnapshot<Map<String, dynamic>> product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context, MaterialPageRoute(
            builder: (Builder) => ProductPage(product: product),
          ),
          );
        },
        child: SizedBox(
          height: 310,
          child: Column(children: [
            Container(
              height: 250,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    "${product['url']}",
                  ),
                ),
              ),
            ),
            Align(
                alignment: const Alignment(-.7, 0),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                          text: "${product.data()['name']}\n",
                          style: const TextStyle(
                              color: Color(0xFF131949), fontSize: 20)),
                      TextSpan(
                          text: "${product.data()['price']}\n",
                          style: const TextStyle(color: Colors.black)),
                    ],
                  ),
                )),
          ]),
        ),
      ),
    );
  }
}
