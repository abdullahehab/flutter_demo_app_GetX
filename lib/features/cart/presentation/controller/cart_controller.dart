import 'package:flutter_demo_app/features/cart/domain/entity/cart.dart';
import 'package:flutter_demo_app/features/cart/domain/usecase/add_product_to_cart_usecase.dart';
import 'package:flutter_demo_app/features/cart/domain/usecase/get_cart_prodcuts_usecase.dart';
import 'package:flutter_demo_app/features/store/domain/entities/product.dart';
import 'package:get/get.dart';
import '../../../../core/extensions/extension.dart';
import '../../../../core/widgets/toaster.dart';

class CartController extends GetxController with StateMixin<List<Cart>> {
  final AddProductToCartUseCase _cartUseCase;
  final GetCartProductUseCase _getCartProductUseCase;

  CartController(this._cartUseCase, this._getCartProductUseCase);

  @override
  void onInit() async {
    await getCartProducts();
    return super.onInit();
  }

  Future getCartProducts() async {
    var result = await _getCartProductUseCase();

    if (result.isEmpty) {
      change(null, status: RxStatus.empty());
    } else {
      change(result, status: RxStatus.success());
    }
  }

  addProductToCart(Product product) async {
    Cart productCart = Cart(
      amount: 1,
      price: product.price.toInt(),
      productModel: product,
    );

    await _cartUseCase.call(product: productCart);

    showToast(message: "تم الاضافه الي السله");

    await getCartProducts();
    calculateTotal();
  }

  productIncrement(Cart cart) {
    cart.amount = ++cart.amount;

    cart.price = cart.amount * cart.productModel.price.toInt();

    calculateTotal();
    update();
  }

  productDecrement(Cart cart) {
    if (cart.amount == 1) {
      return;
    }
    cart.amount = --cart.amount;
    cart.price = cart.amount * cart.productModel.price.toInt();

    calculateTotal();
    update();
  }

  var totalCost = 0.obs;
  calculateTotal() {
    totalCost.value = 0;
    for (var cart in state!) {
      totalCost += cart.price;
    }
  }
}
