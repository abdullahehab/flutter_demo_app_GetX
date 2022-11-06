import 'package:flutter/material.dart';
import 'package:flutter_demo_app/core/extensions/extension.dart';
import 'package:flutter_demo_app/core/utils/app_colors.dart';
import 'package:flutter_demo_app/core/utils/app_constants.dart';
import 'package:flutter_demo_app/features/store/presentation/controller/custom_bottom_bar_controller/bottom_bar_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class EmptyCart extends StatelessWidget {
  const EmptyCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var bottomBarController = Get.find<BottomBarController>();

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          AppConstants.emptyCartIcon,
          width: 150.w,
          height: 140.h,
          color: AppColors.bottomBarSelectedColor,
        ),
        SizedBox(height: 20.h),
        TextButton(
          onPressed: () {
            /// navigate to home page
            bottomBarController.setSelectedMenuIndex = 0;
          },
          child: const Text('لم يتم اضافه منتجات الذهاب للتسوق'),
        )
      ],
    ).setCenter();
  }
}
