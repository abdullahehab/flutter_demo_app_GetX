import 'package:flutter/material.dart';
import 'package:flutter_demo_app/core/extensions/extension.dart';
import 'package:flutter_demo_app/core/utils/app_constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/utils/app_colors.dart';
import '../controller/home_controller/home_controller.dart';

class CategoriesListComponents extends GetView {
  const CategoriesListComponents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<HomeController>();
    return SizedBox(
      height: 80.h,
      child: ListView.builder(
          itemCount: controller.categories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            var item = controller.categories[index];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 56.w,
                  height: 56.h,
                  decoration: BoxDecoration(
                      color: Color(item.color.toInt()),
                      borderRadius:
                          BorderRadius.circular(AppConstants.borderRadius + 6)),
                ).addPaddingOnly(bottom: 8),
                Text(
                  item.name,
                  style: TextStyle(color: Color(item.color.toInt())),
                )
              ],
            ).addPaddingOnly(left: 5).addPaddingOnly(right: 10);
          }),
    );
  }
}
