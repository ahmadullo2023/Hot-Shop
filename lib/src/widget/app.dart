import 'package:flutter/material.dart';
import 'package:hot_shop/src/widget/splash_page.dart';
import 'package:provider/provider.dart';
import '../controller/provider.dart';
import '../screens/onboarding.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProFunc(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
      //  home: MyApp(),
        home:  SplashPage(),
      ),
    );
  }
}
