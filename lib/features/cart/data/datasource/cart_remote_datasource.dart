import 'package:dartz/dartz.dart';
import 'package:flutter_demo_app/features/cart/data/model/cart_model.dart';
import 'package:flutter_demo_app/features/cart/domain/entity/cart.dart';

List<CartModel> _cartList = [];

abstract class BaseCartRemoteDataSource {
  Future<Unit> addProductToCart(CartModel product);
  Future<List<Cart>> getCartProducts();
}

class CartRemoteDataSource implements BaseCartRemoteDataSource {
  @override
  Future<Unit> addProductToCart(CartModel model) {
    _cartList.add(model);

    print('cart length => ${_cartList.length}');
    return Future.value(unit);
  }

  @override
  Future<List<Cart>> getCartProducts() {
    return Future.value(_cartList);
  }
}
