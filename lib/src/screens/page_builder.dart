import 'package:flutter/material.dart';
import 'package:hot_shop/src/screens/profile_page.dart';
import 'package:hot_shop/src/screens/search_page.dart';
import '../common/constants/app_collors.dart';
import '../view/custom_item.dart';
import '../view/dealog.dart';
import 'add_page.dart';
import 'favorite_page.dart';
import 'home_page.dart';

class PageBuilder extends StatefulWidget {
  const PageBuilder({super.key});

  @override
  State<PageBuilder> createState() => _PageBuilderState();
}

class _PageBuilderState extends State<PageBuilder> {
  late final PageController controller;

  @override
  void initState() {
    controller = PageController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void onTap(int value) {
    controller.animateToPage(
      value,
      duration: const Duration(milliseconds: 150),
      curve: Curves.linear,
    );
  }

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.bcColor,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              MyHomePage().showYesNoDialog(context);
            },
            icon: const Icon(Icons.logout),
            color: AppColors.orange),
        title: const Center(
          child: Text(
            "Hot-Shop",
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w700,
                color: AppColors.orange),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.all(12),
            child: IconButton(
                onPressed: () {
                  setState(() {
                    onTap(index = 4);
                  });
                },
                icon: const Icon(Icons.person),
                color: AppColors.orange),
          ),
        ],
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.bcColor,
      bottomNavigationBar: Padding(
        padding:
            const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(
            Radius.circular(45),
          ),
          child: BottomAppBar(
            color: AppColors.white,
            height: 55,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomBottomItem(
                  iconName: Icon(Icons.home_outlined),
                  currentPage: 0,
                  index: index,
                  onTap: () {
                    setState(() {
                      onTap(index = 0);
                    });
                  },
                ),
                CustomBottomItem(
                  iconName: Icon(Icons.search),
                  currentPage: 1,
                  index: index,
                  onTap: () {
                    setState(() {
                      onTap(index = 1);
                    });
                  },
                ),
                CustomBottomItem(
                  iconName: Icon(Icons.favorite_border),
                  currentPage: 2,
                  index: index,
                  onTap: () {
                    setState(() {
                      onTap(index = 2);
                    });
                  },
                ),
                CustomBottomItem(
                  iconName: Icon(Icons.add),
                  index: index,
                  currentPage: 3,
                  onTap: () {
                    setState(() {
                      onTap(index = 3);
                    });
                  },
                ),
                CustomBottomItem(
                  iconName: Icon(Icons.person_outline),
                  index: index,
                  currentPage: 4,
                  onTap: () {
                    setState(() {
                      onTap(index = 4);
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller,
        children: const [
          HomePage(),
          SearchPage(),
          FavoritePage(),
          AddPage(),
          ProfilePage()
        ],
      ),
    );
  }
}
