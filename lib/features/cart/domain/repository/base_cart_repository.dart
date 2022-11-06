import 'package:dartz/dartz.dart';
import 'package:flutter_demo_app/features/cart/domain/entity/cart.dart';

abstract class BaseCartRepository {
  Future<Unit> addProductToCart({required Cart product});
  Future<List<Cart>> getCartProducts();
}
