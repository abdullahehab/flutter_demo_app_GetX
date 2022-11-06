import 'package:flutter/material.dart';
import 'package:flutter_demo_app/features/store/presentation/screens/grocery.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'core/utils/dependency.dart';
import 'features/store/presentation/screens/main_screen.dart';

void main() {
  DependencyCreator.init();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (_, __) => const GetMaterialApp(
              debugShowCheckedModeBanner: false,
              home: MainScreen(),
            ));
  }
}
