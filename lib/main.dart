import 'package:flutter/material.dart';
import 'package:flutter_demo_app/features/store/presentation/screens/home_screen.dart';
import 'package:get/get_navigation/src/root/get_cupertino_app.dart';

import 'core/utils/dependency.dart';

void main() {
  DependencyCreator.init();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const GetCupertinoApp(
      initialRoute: "/",
      // initialBinding: AuthBinding(),
      home: HomeScreen(),
    );
  }
}
