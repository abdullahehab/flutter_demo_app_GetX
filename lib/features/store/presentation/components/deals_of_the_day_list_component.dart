import 'package:flutter/material.dart';
import 'package:flutter_demo_app/core/extensions/extension.dart';
import 'package:flutter_demo_app/features/store/presentation/components/product_item.dart';
import 'package:flutter_demo_app/features/store/presentation/controller/home_controller/home_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DealsOfTheDayListComponent extends GetView {
  const DealsOfTheDayListComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<HomeController>();

    return controller.obx((state) => SizedBox(
          height: 90.h,
          child: ListView.builder(
              itemCount: controller.dealOfTheDay.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                var item = controller.dealOfTheDay[index];
                return ProductItemComponent(item: item)
                    .addPaddingOnly(left: 5)
                    .addPaddingOnly(right: 10);
              }),
        ));
  }
}
