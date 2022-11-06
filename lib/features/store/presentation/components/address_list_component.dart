import 'package:flutter/material.dart';
import 'package:flutter_demo_app/core/extensions/extension.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_constants.dart';
import '../controller/home_controller/home_controller.dart';

class AddressesListComponents extends GetView {
  const AddressesListComponents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<HomeController>();
    return SizedBox(
      height: 60.h,
      child: ListView.builder(
          itemCount: controller.addresses.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            var item = controller.addresses[index];
            return Container(
                    width: 170.w,
                    height: 50.h,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: AppColors.textFiledBorderColor),
                        borderRadius: BorderRadius.circular(
                            AppConstants.borderRadius)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 42.w,
                          height: 42.h,
                          decoration: BoxDecoration(
                              color: AppColors.containerColor,
                              border: Border.all(
                                  color: AppColors.textFiledBorderColor),
                              borderRadius: BorderRadius.circular(
                                  AppConstants.borderRadius)),
                        ).addPaddingOnly(left: 4, right: 13),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              item.title,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold),
                            ),
                            Text('${item.street} No.${item.buildingNo}'),
                            Text('floor No. ${item.floor}'),
                          ],
                        ),
                      ],
                    ).addPaddingOnly(left: 5))
                .addPaddingOnly(right: 10);
          }),
    );
  }
}
