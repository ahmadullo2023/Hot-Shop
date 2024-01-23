import 'package:flutter/material.dart';
import 'package:hot_shop/src/screens/sign_in.dart';
import '../common/constants/app_collors.dart';
import '../common/constants/validation.dart';
import '../view/custom_item.dart';
import '../view/textformfield_item.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key, this.onTap}) : super(key: key);
  final void Function()? onTap;

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey2 = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bcColor,
      resizeToAvoidBottomInset: false,
      body: Form(
        key: _formKey2,
        child: Column(
          children: [
            const HotShopEntr(),
            const SizedBox(height: 100),
            const Center(
              child: Text(
                "Create Account Now",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                  color: AppColors.orange,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const ItemTextField(
              hintText: "Your Name",
              isPasswordVisible: true,
              prefixIcon: Icon(
                Icons.person,
                color: AppColors.black,
              ),
            ),
            ItemTextField(
              textController: email,
              hintText: "Your Email",
              isPasswordVisible: true,
              prefixIcon: const Icon(
                Icons.email_outlined,
                color: AppColors.black,
              ),
              validator: (value) => Validation().emailUp(value),
            ),
            ItemTextField(
              textController: password,
              hintText: "Your Password",
              isPasswordVisible: isPasswordVisible,
              prefixIcon: const Icon(
                Icons.lock,
                color: AppColors.black,
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() {
                    isPasswordVisible = !isPasswordVisible;
                  });
                },
              ),
              validator: (value) => Validation().passwordUp(value),
            ),
            const Spacer(),
            Sign(
              formKey1: _formKey2,
              email: email,
              password: password,
              inOrUp: 'SignUp',
            ),
            TextButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => const SignIn()),
                  (route) => false,
                );
              },
              child: const Text(
                "SignIn",
                style: TextStyle(
                  color: AppColors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            const SizedBox(height: 18)
          ],
        ),
      ),
    );
  }
}
