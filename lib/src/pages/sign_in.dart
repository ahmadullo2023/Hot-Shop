import 'package:flutter/material.dart';
import 'package:hot_shop/src/pages/page_builder.dart';
import 'package:hot_shop/src/pages/sign_up.dart';
import '../common/constants/app_collors.dart';
import '../common/constants/validation.dart';
import '../service/auth_service.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        key: _formKey1,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 200,
              decoration: const BoxDecoration(
                color: AppColors.orange,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.elliptical(200, 50),
                  bottomLeft: Radius.elliptical(200, 50),
                ),
              ),
              child: const Center(
                child: Text(
                  "Hot-Shop",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
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
              prefixIcon: const Icon(
                Icons.email_outlined,
                color: AppColors.black,
              ),
              validator: (value) => Validation().emailIn(value),
            ),


            ItemTextField(
              textController: password,
              hintText: "Your Password",
              prefixIcon: const Icon(
                Icons.lock,
                color: AppColors.black,
              ),
                suffixIcon: const Icon(
                Icons.remove_red_eye_outlined,
                color: AppColors.black,
              ),
              validator: (value) => Validation().passwordIn(value),
            ),


            const Spacer(),
            Padding(
                padding: const EdgeInsets.all(12),
                child: DecoratedBox(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(40)),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey1.currentState!.validate()) {
                       signInWithEmailAndPassword();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(400, 50),
                      backgroundColor: AppColors.orange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                    child: const Text(
                      "SignIn",
                    ),
                  ),
                )),
            TextButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => const SignUp()), (route) => false,);
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
  Future<void> signInWithEmailAndPassword() async {
    await Auth()
        .signInWithEmailAndPassword(
      email: email.value.text,
      password: password.value.text,
    ).then(
          (value) => Navigator.push(
        context,
        MaterialPageRoute(builder: (BuildContext context) => const PageBuilder()),
      ),
    );
  }
}
