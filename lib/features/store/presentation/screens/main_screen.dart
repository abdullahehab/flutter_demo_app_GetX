import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_demo_app/core/utils/app_colors.dart';
import 'package:flutter_demo_app/core/utils/app_constants.dart';
import 'package:flutter_demo_app/features/cart/presentation/controller/cart_controller.dart';
import 'package:flutter_demo_app/features/store/presentation/components/custom_bottom_bar.dart';
import 'package:flutter_demo_app/features/store/presentation/controller/custom_bottom_bar_controller/bottom_bar_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class MainScreen extends GetView<BottomBarController> {
  const MainScreen();

  @override
  Widget build(BuildContext context) {
    return GetX(
      init: controller,
      builder: (DisposableInterface con) {
        var pageIndex = controller.selectedMenuIndex;

        return WillPopScope(
          onWillPop: () async {
            if (pageIndex == 0) {
              return true;
            }
            controller.setSelectedMenuIndex = 0;
            return false;
          },
          child: Scaffold(
            backgroundColor: Colors.white,
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: CircleAvatar(
              radius: 35,
              backgroundColor: AppColors.bottomBarSelectedColor,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  GetBuilder<CartController>(
                    builder: (controller) => Text(
                      '\$${controller.totalCost}',
                      style:  TextStyle(color: Colors.white, fontSize: 10.sp),
                    ).paddingOnly(right: 13, bottom: 15),
                  ),
                  SvgPicture.asset(AppConstants.shippingIcon, width: 35.w, height: 35.h)
                ],
              ),
            ),
            bottomNavigationBar: BottomBar(
              initialIndex: pageIndex,
              onTap: (int index) => controller.setSelectedMenuIndex = index,
              key: ValueKey<int>(pageIndex),
            ),
            body: controller.tab,
          ),
        );
      },
    );
  }
}
