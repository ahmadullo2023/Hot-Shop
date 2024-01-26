import 'package:flutter/material.dart';
import '../common/constants/app_collors.dart';
import '../view/custom_item.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.bcColor,
      body: Padding(
        padding: EdgeInsets.only(left: 15, right: 15),
        child: Column(
          children: [
            Center(
              child: Icon(
                Icons.account_circle,
                size: 100,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            ProfileItem(
              titleT: Text("History"),
              trailingI: Icon(Icons.arrow_forward_ios),
            ),
            ProfileItem(
              titleT: Text("Massage"),
              trailingI: Icon(Icons.arrow_forward_ios),
            ),
            ProfileItem(
              titleT: Text("Payments"),
              trailingI: Icon(Icons.arrow_forward_ios),
            ),
            ProfileItem(
              titleT: Text("basket"),
              trailingI: Icon(Icons.arrow_forward_ios),
            ),
            ProfileItem(
              titleT: Text("Other"),
              trailingI: Icon(Icons.arrow_forward_ios),
            ),
          ],
        ),
      ),
    );
  }
}
