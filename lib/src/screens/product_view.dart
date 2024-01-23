import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:hot_shop/src/screens/product_page.dart';

class Masonry extends StatelessWidget {
  const Masonry({super.key, required this.products});

  final List<QueryDocumentSnapshot<Map<String, dynamic>>> products;

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
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
            context,
            MaterialPageRoute(
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
                              color: Colors.white, fontSize: 20)),
                      TextSpan(
                          text: "${product.data()['price']}\n",
                          style: const TextStyle(color: Colors.white)),
                    ],
                  ),
                )),
          ]),
        ),
      ),
    );
  }
}
