import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_app/core/extensions/extension.dart';
import 'package:flutter_demo_app/core/utils/app_constants.dart';
import 'package:flutter_demo_app/features/store/domain/entities/bottom_bar_data.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../../core/utils/app_colors.dart';

typedef GestureTapIndexCallback = void Function(int index);

class BottomBar extends GetView {
  const BottomBar({Key? key, required this.onTap, required this.initialIndex})
      : super(key: key);
  final GestureTapIndexCallback onTap;

  final int initialIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.h + (context.bottomSafeArea / 2),
      decoration: const BoxDecoration(
        color: AppColors.bottomBarColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: BottomBarData.bottomDataList
            .asMap()
            .map(
              (index, value) => MapEntry(
                index,
                InkWell(
                  onTap: () => onTap(index),
                  child: index == 2
                      ? const SizedBox()
                      : SizedBox(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              const SizedBox(),
                              SvgPicture.asset(
                                value.image,
                                height: 20.h,
                                placeholderBuilder: (_) =>
                                    SizedBox(height: 20.h),
                                color: index == initialIndex
                                    ? AppColors.bottomBarSelectedColor
                                    : AppColors.greyTextColor,
                              ),
                               SizedBox(height: 8.h),
                              Text(
                                value.name,
                                style: TextStyle(
                                    color: index == initialIndex
                                        ? AppColors.bottomBarSelectedColor
                                        : AppColors.greyTextColor),
                              ),
                               SizedBox(height: 5.h),
                            ],
                          ),
                        ),
                ),
              ),
            )
            .values
            .toList(),
      ).addPaddingOnly(bottom: (context.bottomSafeArea / 2)),
    );
  }
}
