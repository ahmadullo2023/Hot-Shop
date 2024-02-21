import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../common/constants/app_collors.dart';
import '../controller/provider.dart';

class CustomBottomItem extends StatelessWidget {
  const CustomBottomItem({
    super.key,
    required this.iconName,
    required this.onTap,
    required this.index,
    required this.currentPage,
  });

  final void Function()? onTap;
  final Widget iconName;
  final int index;
  final int currentPage;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          iconName,
          const SizedBox(height: 2),
          index == currentPage
              ? Container(
                  height: 5,
                  width: 5,
                  decoration: const BoxDecoration(
                    color: AppColors.orange,
                    shape: BoxShape.circle,
                  ),
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}

class ProfileItem extends StatelessWidget {
  const ProfileItem({
    super.key,
    required this.titleT,
    required this.trailingI,
  });

  final Widget trailingI;
  final Widget titleT;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {






            showModalBottomSheet<void>(
              context: context,
              builder: (BuildContext context) {
                return Container(
                  height: 100,
                  color: Color(0xFF040210),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        ElevatedButton(
                          child: const Text('Camera'),
                          onPressed: () => Navigator.pop(context),
                        ),
                        ElevatedButton(
                          child: const Text('Gallery'),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );









            //DialogItem().dialogItem(context);
          },
          child: ListTile(
            title: titleT,
            trailing: trailingI,
            textColor: Colors.white,
            iconColor: Colors.white,
          ),
        ),
        const Divider(color: Colors.white),
      ],
    );
  }
}

class HotShopEntr extends StatelessWidget {
  const HotShopEntr({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
              color: Colors.white, fontSize: 40, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}

class Sign extends StatelessWidget {
  const Sign({
    required this.formKey1,
    required this.email,
    required this.password,
    required this.inOrUp,
  });

  final formKey1;
  final TextEditingController email;
  final TextEditingController password;
  final String inOrUp;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(12),
        child: DecoratedBox(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(40)),
          child: ElevatedButton(
            onPressed: () {
              if (formKey1.currentState!.validate()) {
                inOrUp == "SignIn"
                    ? Provider.of<ProFunc>(context, listen: false)
                        .signInWithEmailAndPassword(email, password, context)
                    : Provider.of<ProFunc>(context, listen: false)
                        .createUserWithEmailAndPassword(
                            email, password, context);
              }
            },
            style: ElevatedButton.styleFrom(
              fixedSize: const Size(400, 50),
              backgroundColor: AppColors.orange,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40),
              ),
            ),
            child: Text(inOrUp),
          ),
        ));
  }
}

class DialogItem {
  void dialogItem(context) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Dialog(
              backgroundColor: Color(0xFFFDE2F4),
              child: SizedBox(
                width: 300,
                height: 150,
                child: Padding(
                  padding: EdgeInsets.all(36),
                  child: Column(
                    children: [
                      Text("Tuzatish ishlari olib borilyapti",
                       textAlign: TextAlign.center,
                       style: TextStyle(fontSize: 25)),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
