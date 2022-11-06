import 'package:dartz/dartz.dart';
import 'package:flutter_demo_app/features/cart/domain/entity/cart.dart';
import 'package:flutter_demo_app/features/cart/domain/repository/base_cart_repository.dart';

class AddProductToCartUseCase {
  final BaseCartRepository _repository;
  AddProductToCartUseCase(this._repository);

  Future<Unit> call({required Cart product}) {
    return _repository.addProductToCart(product: product);
  }
}
