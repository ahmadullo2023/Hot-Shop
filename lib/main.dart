import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:hot_shop/src/common/fire_base_api.dart';
import 'package:hot_shop/src/widget/app.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform);
  await FireBaseApi().initNotifications();
  runApp(const App());
}

