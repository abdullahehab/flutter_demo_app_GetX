import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_demo_app/features/store/domain/entities/product.dart';
import 'package:flutter_demo_app/features/store/presentation/components/product_item.dart';
import 'package:flutter_demo_app/features/store/presentation/controller/home_controller/home_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../../core/extensions/extension.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_constants.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../cart/presentation/controller/cart_controller.dart';

class FavoriteScreen extends GetView<HomeController> {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (_) => BuildBody(
        products: controller.favoriteList,
      ),
    );
  }
}

class BuildBody extends GetView {
  BuildBody({Key? key, required this.products}) : super(key: key);

  final List<Product> products;

  var cartController = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    print('fac list -> ${products.length}');
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomAppBar(),
            SizedBox(height: 25.h),
            const Text('Favorites',
                style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 35.h),
            Expanded(
                child: products.isEmpty
                    ? const Text('There is No products added to favourite')
                        .setCenter()
                    : ListView.builder(
                        itemCount: products.length,
                        itemBuilder: (context, index) {
                          var item = products[index];

                          return ProductItemComponent(item: item)
                              .addPaddingOnly(left: 5, right: 10, bottom: 10);
                        })),
          ],
        ),
      ).addPaddingHorizontalVertical(horizontal: 11),
    );
  }
}
