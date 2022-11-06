import 'package:flutter/material.dart';
import 'package:flutter_demo_app/features/store/presentation/screens/grocery.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../../cart/presentation/screens/cart_screen.dart';


class BottomBarController extends GetxController {

  final List<Widget> _tabs = <Widget>[
   const HomeScreen(),
    Center(child: const Text('news')),
    const SizedBox(),
    Center(child: const Text('fav')),
    const CartScreen(),

  ];

  Widget get tab => _tabs[selectedMenuIndex];

  final _selectedMenuIndex = 0.obs;
  int get selectedMenuIndex => _selectedMenuIndex.value;
  set setSelectedMenuIndex(int newVlu) {
    _selectedMenuIndex.value = newVlu;
  }
}
