import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../common/constants/app_collors.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({
    super.key,
    required this.product,
  });

  final QueryDocumentSnapshot<Map<String, dynamic>> product;

  @override
  State<ProductPage> createState() => _ProductPageState();


}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    bool isCheek = false;
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
                        print(isCheek);
                        print(!isCheek);
                      });
                      // Provider.of<ProFunc>(context, listen: false)
                      //     .addFavoriteFirestore(widget.product.data());
                    },
                    icon: Icon(
                      isCheek == true ? Icons.favorite_border : Icons.favorite,
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
                style: const TextStyle(color: Colors.black, fontSize: 36),
                children: [
                  TextSpan(
                      text: "${widget.product.data()['name']}\n",
                      style: TextStyle(color: Colors.black)),
                  TextSpan(
                    text: "${widget.product.data()['description']}\n\n",
                    style: TextStyle(color: Colors.grey, fontSize: 25),
                  ),
                  TextSpan(
                      text: "${widget.product.data()['price']} so'm\n",
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.indigo)),
                  TextSpan(
                      text: "${widget.product.data()['phoNum']}\n",
                      style: TextStyle(color: Colors.black)),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
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
