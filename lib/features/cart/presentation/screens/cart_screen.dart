import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../../core/extensions/extension.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_constants.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../domain/entity/cart.dart';
import '../components/empty_cart.dart';
import '../controller/cart_controller.dart';

class CartScreen extends GetView<CartController> {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return controller.obx(
        (cartProducts) => BuildBody(cartProducts: cartProducts!),
        onEmpty: const EmptyCart());
  }
}

class BuildBody extends GetView {
  const BuildBody({Key? key, required this.cartProducts}) : super(key: key);

  final List<Cart> cartProducts;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomAppBar(),
            SizedBox(height: 25.h),
            const Text('Cart', style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 35.h),
            Expanded(
                child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: cartProducts.length,
                    itemBuilder: (context, index) {
                      var item = cartProducts[index];
                      return ProductItem(item: item);
                    })),
          ],
        ),
      ).addPaddingHorizontalVertical(horizontal: 11),
    );
  }
}

class ProductItem extends GetView<CartController> {
  const ProductItem({Key? key, required this.item}) : super(key: key);

  final Cart item;
  @override
  Widget build(BuildContext context) {
    return controller.obx((state) => Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Row(
                children: [
                  Container(
                    width: 56.w,
                    height: 56.h,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(
                            AppConstants.borderRadius + 6)),
                  ).addPaddingOnly(bottom: 8, right: 18),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 150.w,
                        child: Text(
                          item.productModel.name,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                          maxLines: 1,
                          overflow: TextOverflow.fade,
                        ),
                      ),
                      SizedBox(height: 5.h),
                      SizedBox(
                        child: Text('${item.productModel.quantity} Grammes'),
                      ),
                      SizedBox(height: 5.h),
                      Row(
                        children: [
                          Text(
                            '\$ ${item.price != 0 ? item.price : item.productModel.price}',
                            style: const TextStyle(
                                color: AppColors.bottomBarSelectedColor,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(width: 10.w),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Row(
              children: [
                CalculateButton(
                  childIcon: Icons.add,
                  onTap: () => controller.productIncrement(item),
                ),
                Text(
                  '${item.amount}',
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 15.sp),
                ).addPaddingHorizontalVertical(horizontal: 10),
                CalculateButton(
                  childIcon: Icons.remove,
                  onTap: () => controller.productDecrement(item),
                ),
              ],
            )
          ],
        ).addPaddingOnly(right: 10));
  }
}

class CalculateButton extends StatelessWidget {
  const CalculateButton(
      {Key? key, required this.onTap, required this.childIcon})
      : super(key: key);

  final GestureTapCallback onTap;
  final IconData childIcon;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 33.w,
        height: 33.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppConstants.borderRadius),
            color: AppColors.blueColor),
        child: Icon(
          childIcon,
          color: AppColors.darKBlueColor,
        ),
      ),
    );
  }
}
