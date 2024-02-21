import 'package:flutter/material.dart';
import 'package:hot_shop/src/screens/sign_up.dart';
import '../common/constants/app_collors.dart';
import '../common/constants/validation.dart';
import '../view/custom_item.dart';
import '../view/textformfield_item.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key, this.onTap}) : super(key: key);
  final void Function()? onTap;

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey1 = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bcColor,
      resizeToAvoidBottomInset: false,
      body: Form(
        key: _formKey1,
        child: Column(
          children: [
            const HotShopEntr(),
            const SizedBox(height: 100),
            const Center(
              child: Text(
                "Sign In Now",
                style: TextStyle(
                    color: AppColors.orange,
                    fontSize: 28,
                    fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(height: 20),
            ItemTextField(
              textController: email,
              hintText: "Your Email",
              isPasswordVisible: true,
              prefixIcon: const Icon(
                Icons.email_outlined,
                color: AppColors.black,
              ),
              validator: (value) => Validation().emailIn(value),
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
              validator: (value) => Validation().passwordIn(value),
              obscureText: true,
            ),
            const Spacer(),
            Sign(
              formKey1: _formKey1,
              email: email,
              password: password,
              inOrUp: 'SignIn',
            ),
            TextButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => const SignUp()),
                  (route) => false,
                );
              },
              child: const Text(
                "SignUp",
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
