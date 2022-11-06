import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_app/features/store/domain/entities/product.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_constants.dart';
import '../controller/home_controller/home_controller.dart';

class BannerComponent extends GetView {
  const BannerComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<HomeController>();

    return controller.obx(
      (_) => BuildBody(item: controller.banner.value),
      onLoading: const Scaffold(
        body: Center(
          child: CupertinoActivityIndicator(),
        ),
      ),
    );
  }
}

class BuildBody extends GetView {
  const BuildBody({Key? key, required this.item}) : super(key: key);

  final Product item;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 131.h,
      width: context.width,
      decoration: BoxDecoration(
          color: const Color(0xffFEC8BD),
          borderRadius: BorderRadius.circular(AppConstants.borderRadius)),
      child: Row(
        children: [
          SizedBox(width: context.width / 2.3),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 150.w,
                child: const Text(
                  'Mega',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.bottomBarSelectedColor),
                  maxLines: 1,
                  overflow: TextOverflow.fade,
                ),
              ),
              Text(
                item.name.toUpperCase(),
                style:  TextStyle(color: AppColors.darKPurpleColor, fontWeight: FontWeight.bold, fontSize: 20.sp),
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
                  Text(
                    '\$${item.priceAfterDiscount}',
                    style: const TextStyle(
                        decoration: TextDecoration.lineThrough,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
