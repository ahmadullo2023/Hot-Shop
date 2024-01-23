import 'package:flutter/material.dart';
import 'package:hot_shop/src/common/constants/app_collors.dart';
import 'package:lottie/lottie.dart';

import '../screens/sign_in.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5)).then((value) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (builder) => const SignIn()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Center(
        child: Lottie.asset("assets/lottie/Animation - 1705557629757.json",
            height: 300, width: 300),
      ),
    );
  }
}
