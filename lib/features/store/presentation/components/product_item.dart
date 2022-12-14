import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_demo_app/core/extensions/extension.dart';
import 'package:flutter_demo_app/core/utils/app_colors.dart';
import 'package:flutter_demo_app/core/utils/app_constants.dart';
import 'package:flutter_demo_app/features/cart/presentation/controller/cart_controller.dart';
import 'package:flutter_demo_app/features/store/presentation/controller/home_controller/home_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../domain/entities/product.dart';

class ProductItemComponent extends GetView {
  ProductItemComponent({Key? key, required this.item}) : super(key: key);

  final Product item;
  var homeController = Get.find<HomeController>();
  var cartController = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          children: [
            Container(
              width: 90.w,
              height: 90.h,
              decoration: BoxDecoration(
                  color: AppColors.containerColor,
                  border: Border.all(color: AppColors.textFiledBorderColor),
                  borderRadius:
                      BorderRadius.circular(AppConstants.borderRadius)),
            ).addPaddingOnly(left: 4, right: 13),

            /// favorite icon
            GestureDetector(
              onTap: () => homeController.addRemoveFavourite(product: item),
              child: CircleAvatar(
                  radius: 15,
                  backgroundColor: Colors.white,
                  child: SvgPicture.asset(
                      item.isFavourite
                          ? AppConstants.heartTappedIcon
                          : AppConstants.heartIcon,
                      width: 12.w,
                      height: 12.h)),
            ),

            /// cart icon
            Positioned(
              right: 10,
              child: GestureDetector(
                onTap: () => cartController.addProductToCart(item),
                child: CircleAvatar(
                    radius: 15,
                    backgroundColor: Colors.white,
                    child: SvgPicture.asset(AppConstants.addToCartIcon,
                        width: 12.w,
                        color: AppColors.grey2TextColor,
                        height: 12.h)),
              ),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 150.w,
              child: Text(
                item.name,
                style: const TextStyle(fontWeight: FontWeight.bold),
                maxLines: 1,
                overflow: TextOverflow.fade,
              ),
            ),
            SizedBox(height: 5.h),
            Text('Pieces. ${item.quantity}'),
            SizedBox(height: 5.h),
            Row(
              children: [
                SvgPicture.asset(
                  AppConstants.locationIcon,
                  width: 12.w,
                  height: 12.h,
                ),
                SizedBox(width: 5.w),
                Text(
                  '${item.distance} Minutes Away',
                  style:
                      TextStyle(fontSize: 10.sp, fontWeight: FontWeight.bold),
                )
              ],
            ),
            SizedBox(height: 5.h),
            Row(
              children: [
                Text(
                  '\$${item.price}',
                  style: const TextStyle(
                      color: AppColors.redColor, fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 10.w),
                Visibility(
                  visible: item.priceAfterDiscount != '',
                  child: Text(
                    '\$${item.priceAfterDiscount}',
                    style: const TextStyle(
                        decoration: TextDecoration.lineThrough,
                        color: AppColors.grey2TextColor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}
