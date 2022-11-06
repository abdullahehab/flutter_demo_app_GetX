import 'package:flutter_demo_app/features/cart/data/repository/cart_repository.dart';
import 'package:flutter_demo_app/features/cart/domain/usecase/add_product_to_cart_usecase.dart';
import 'package:flutter_demo_app/features/cart/domain/usecase/get_cart_prodcuts_usecase.dart';
import 'package:flutter_demo_app/features/cart/presentation/controller/cart_controller.dart';
import 'package:get/get.dart';

class CartControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddProductToCartUseCase(Get.find<CartRepository>()));
    Get.lazyPut(() => GetCartProductUseCase(Get.find<CartRepository>()));
    Get.lazyPut(() => CartController(Get.find(), Get.find()));
  }
}
