import 'package:flutter_demo_app/features/cart/data/datasource/cart_remote_datasource.dart';
import 'package:flutter_demo_app/features/cart/presentation/controller/cart_controller_binding.dart';
import 'package:flutter_demo_app/features/store/data/datasource/remote_data_source.dart';
import 'package:flutter_demo_app/features/store/data/repository/home_repository.dart';
import 'package:flutter_demo_app/features/store/presentation/controller/home_controller/home_controller_binding.dart';
import 'package:get/get.dart';

import '../../features/cart/data/repository/cart_repository.dart';
import '../../features/store/presentation/controller/custom_bottom_bar_controller/bottom_bar_controller_bending.dart';

class DependencyCreator {
  static init() {
    Get.lazyPut(() => HomeRemoteDataSource());
    Get.lazyPut(() => HomeRepository(Get.find<HomeRemoteDataSource>()));

    Get.lazyPut(() => CartRemoteDataSource());
    Get.lazyPut(() => CartRepository(Get.find<CartRemoteDataSource>()));

    HomePageBinding().dependencies();
    BottomBarBinding().dependencies();
    CartControllerBinding().dependencies();
  }
}
