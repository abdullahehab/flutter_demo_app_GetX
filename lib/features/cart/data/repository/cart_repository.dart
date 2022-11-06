import 'package:dartz/dartz.dart';
import 'package:flutter_demo_app/features/cart/data/datasource/cart_remote_datasource.dart';
import 'package:flutter_demo_app/features/cart/data/model/cart_model.dart';
import 'package:flutter_demo_app/features/cart/domain/entity/cart.dart';
import 'package:flutter_demo_app/features/cart/domain/repository/base_cart_repository.dart';

class CartRepository implements BaseCartRepository {
  final BaseCartRemoteDataSource _cartRemoteDataSource;

  CartRepository(this._cartRemoteDataSource);

  @override
  Future<Unit> addProductToCart({required Cart product}) {
    CartModel cartModel = CartModel(
        amount: product.amount,
        price: product.price,
        productModel: product.productModel);
    // TODO: implement addProductToCart
    _cartRemoteDataSource.addProductToCart(cartModel);
    return Future.value(unit);
  }

  @override
  Future<List<Cart>> getCartProducts() async {
    return await _cartRemoteDataSource.getCartProducts();
  }
}
