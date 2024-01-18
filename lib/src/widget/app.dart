import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../common/provider.dart';
import '../pages/sign_in.dart';

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
        home: SignIn(),
      ),
    );
  }
}


