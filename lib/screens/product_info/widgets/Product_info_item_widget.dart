import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:working_with_git/data/api/models/product_model.dart';
import 'package:working_with_git/utils/app_colors.dart';
import 'package:working_with_git/widgets/style_widget.dart';

class ProductItemWidget extends StatefulWidget {
  ProductItem data;
  ProductItemWidget({super.key, required this.data});

  @override
  State<ProductItemWidget> createState() => _ProductItemWidgetState();
}

class _ProductItemWidgetState extends State<ProductItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12).r,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: SizedBox(
              width: 250.w,
              height: 250.h,
              child: CachedNetworkImage(
                imageUrl: widget.data.image.toString(),
                fit: BoxFit.contain,
                placeholder: (context, url) {
                  return Shimmer.fromColors(
                    period: const Duration(seconds: 2),
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                    child: Container(
                      width: 250,
                      height: 250,
                      color: Colors.white,
                    ),
                  );
                },
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),
          SizedBox(height: 20.r),
          nameAndPrice(),
          SizedBox(height: 20.r),
          Text(
            'Description',
            style: fontInterW600(appcolor: AppColors.C_1D1E20),
          ),
          SizedBox(height: 15.r),
          Text(
            widget.data.description!.length > 195
                ? "${widget.data.description.toString().substring(0, 195)}..."
                : widget.data.description.toString(),
            style: fontInterW400(appcolor: AppColors.C_8F959E)
                .copyWith(fontSize: 15.sp),
          ),
          SizedBox(height: 50.h),
          InkWell(
            borderRadius: BorderRadius.circular(15.r),
            onTap: () {},
            child: Container(
              width: double.infinity,
              height: 75.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.r),
                gradient: const LinearGradient(
                  colors: [
                    AppColors.C_B59DFB,
                    AppColors.C_9775FA,
                  ],
                ),
              ),
              child: Center(
                child: Text(
                  "Add to cart",
                  style: fontInterW600(appcolor: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget nameAndPrice() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Product name',
          style: fontInterW600(appcolor: AppColors.C_1D1E20),
        ),
        SizedBox(height: 8.h),
        SizedBox(
          width: double.infinity,
          child: Text(
            widget.data.title.toString(),
            style: fontInterW400(appcolor: AppColors.C_8F959E),
          ),
        ),
        SizedBox(height: 16.h),
        Text(
          'Price',
          style: fontInterW600(appcolor: AppColors.C_1D1E20),
        ),
        SizedBox(height: 8.h),
        Text(
          "\$ ${widget.data.price}",
          style: fontInterW600(appcolor: AppColors.C_9775FA)
              .copyWith(fontSize: 22.sp),
        ),
      ],
    );
  }
}
