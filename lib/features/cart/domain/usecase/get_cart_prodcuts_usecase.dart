import 'package:dartz/dartz.dart';
import 'package:flutter_demo_app/features/cart/domain/entity/cart.dart';
import 'package:flutter_demo_app/features/cart/domain/repository/base_cart_repository.dart';

class GetCartProductUseCase {
  final BaseCartRepository _repository;
  GetCartProductUseCase(this._repository);

  Future<List<Cart>> call() async {
    return await _repository.getCartProducts();
  }
}
