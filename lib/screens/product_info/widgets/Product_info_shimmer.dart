import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ProductItemShimmer extends StatelessWidget {
  const ProductItemShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12).r,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: shimmerMethod(250, 250),
          ),
          SizedBox(height: 20.r),
          shimmerMethod(180, 20),
          SizedBox(height: 8.h),
          shimmerMethod(260, 25),
          SizedBox(height: 1.h),
          shimmerMethod(280, 25),
          SizedBox(height: 16.h),
          shimmerMethod(50, 20),
          SizedBox(height: 8.h),
          shimmerMethod(100, 30),
          SizedBox(height: 20.r),
          shimmerMethod(150, 20),
          SizedBox(height: 15.h),
          shimmerMethod(380, 20),
          SizedBox(height: 1.h),
          shimmerMethod(double.infinity, 20),
          SizedBox(height: 1.h),
          shimmerMethod(350, 20),
          SizedBox(height: 1.h),
          shimmerMethod(350, 20),
          SizedBox(height: 1.h),
          shimmerMethod(200, 20),
          SizedBox(height: 45.h),
          shimmerMethod(double.infinity, 75),
        ],
      ),
    );
  }

  Shimmer shimmerMethod(num width, num height) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[400]!,
      child: Container(
        width: width.w,
        height: height.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          color: Colors.black,
        ),
      ),
    );
  }
}
