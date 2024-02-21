import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hot_shop/src/screens/profile_page.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../common/constants/app_collors.dart';
import '../controller/provider.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({
    super.key,
    required this.product,
  });
  final QueryDocumentSnapshot<Map<String, dynamic>> product;
  @override
  State<ProductPage> createState() => _ProductPageState();
}

bool isCheek = false;

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.bcColor,
        body: ListView(children: [
          Stack(
            children: [
              Container(
                height: 550,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      "${widget.product['url']}",
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back_ios_new),
                    color: AppColors.orange,
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        isCheek = !isCheek;
                      });
                      isCheek
                          ? Provider.of<ProFunc>(context, listen: false)
                              .addFavoriteFirestore(widget.product.data())
                          : Provider.of<ProFunc>(context, listen: false)
                              .deleteFavoriteFirestore(widget.product.id);
                    },
                    icon: Icon(
                      isCheek ? Icons.favorite : Icons.favorite_border,
                    ),
                    color: AppColors.orange,
                  ),
                ],
              ),
            ],
          ),
          Align(
            alignment: const Alignment(-.9, 0),
            child: RichText(
              text: TextSpan(
                style: const TextStyle(color: Colors.white, fontSize: 36),
                children: [
                  TextSpan(
                    text: "${widget.product.data()['name']}\n",
                  ),
                  TextSpan(
                    text: "${widget.product.data()['description']}\n\n",
                    style: const TextStyle(color: Colors.grey, fontSize: 25),
                  ),
                  TextSpan(
                    text: "${widget.product.data()['price']} so'm\n",
                    style: const TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.blue),
                  ),
                  TextSpan(
                      text: "${widget.product.data()['phoNum']}\n",
                      style:
                          const TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 300,
            width: double.infinity,
            color: Colors.blueGrey,
            child: const GoogleMap1(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: ElevatedButton(
                  onPressed: () async {
                    makePhoneCall(widget.product.data()['phoNum'].toString());
                  },
                  child: const Text("Hoziroq sotib olish"),
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}

Future<void> makePhoneCall(String phoneNumber) async {
  final Uri launchUri = Uri(
    scheme: 'tel',
    path: phoneNumber,
  );
  await launchUrl(launchUri);
}
