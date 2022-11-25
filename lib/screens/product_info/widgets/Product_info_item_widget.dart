import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import '../../../data/api/models/product_model.dart';
import '../../../data/api/repository/repository_item.dart';
import '../../../data/count_price_model.dart';
import '../../../data/database/database.dart';
import '../../../data/database/local_item_model.dart';
import '../../../utils/app_colors.dart';
import '../../../widgets/style_widget.dart';

class ProductItemWidget extends StatefulWidget {
  final int productindex;

  ProductItemWidget({Key? key, required this.productindex}) : super(key: key);

  @override
  State<ProductItemWidget> createState() => _ProductItemWidgetState();
}

int categoryindex = 0;

class _ProductItemWidgetState extends State<ProductItemWidget> {

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ProductItem>(
      future: AppRepository.getProductFromId(widget.productindex),
      builder: (context, AsyncSnapshot<ProductItem> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }
        if (snapshot.hasData) {
          var data = snapshot.data;
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
                      imageUrl: data!.image!,
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
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                ),
                SizedBox(height: 20.r),
                Column(
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
                        data!.title.toString(),
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
                      "\$ ${data.price}",
                      style: fontInterW600(appcolor: AppColors.C_9775FA)
                          .copyWith(fontSize: 22.sp),
                    ),
                  ],
                ),
                SizedBox(height: 20.r),
                Text(
                  'Description',
                  style: fontInterW600(appcolor: AppColors.C_1D1E20),
                ),
                SizedBox(height: 15.r),
                Text(
                  data.description!.length > 195
                      ? "${data.description.toString().substring(0, 195)}..."
                      : data.description.toString(),
                  style: fontInterW400(appcolor: AppColors.C_8F959E)
                      .copyWith(fontSize: 15.sp),
                ),
                SizedBox(height: 50.h),
                InkWell(
                  borderRadius: BorderRadius.circular(15.r),
                  onTap: (() async {
                    CountPrice.tests[data.id!.toInt()].count++;
                    CountPrice.tests[data.id!.toInt()].count  == 1 ? await LocalDatabase.insertToDatabase(Product(
                        image_url: data.image.toString(),
                        id: data.id!.toInt(),
                        name: data.title.toString(),
                        description: data.description.toString(),
                        price: data.price!.toInt(),
                        category_id: 1).copyWith(id: data.id!.toInt())) : 1==1;
                  }),
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
        } else {
          return const Center(
            child: Text("ERROR"),
          );
        }
      },
    );
  }
}
// Widget nameAndPrice() {
//   return Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       Text(
//         'Product name',
//         style: fontInterW600(appcolor: AppColors.C_1D1E20),
//       ),
//       SizedBox(height: 8.h),
//       SizedBox(
//         width: double.infinity,
//         child: Text(
//           data!.title.toString(),
//           style: fontInterW400(appcolor: AppColors.C_8F959E),
//         ),
//       ),
//       SizedBox(height: 16.h),
//       Text(
//         'Price',
//         style: fontInterW600(appcolor: AppColors.C_1D1E20),
//       ),
//       SizedBox(height: 8.h),
//       Text(
//         "\$ ${widget.data.price}",
//         style: fontInterW600(appcolor: AppColors.C_9775FA)
//             .copyWith(fontSize: 22.sp),
//       ),
//     ],
//   );
// }

// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:shimmer/shimmer.dart';
// import 'package:working_with_git/data/api/models/product_model.dart';
// import 'package:working_with_git/utils/app_colors.dart';
// import 'package:working_with_git/widgets/style_widget.dart';
//
// class - extends StatefulWidget {
//   ProductItem data;
//   ProductItemWidget({super.key, required this.data});
//
//   @override
//   State<ProductItemWidget> createState() => _ProductItemWidgetState();
// }
//
// class _ProductItemWidgetState extends State<ProductItemWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(12).r,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Center(
//             child: SizedBox(
//               width: 250.w,
//               height: 250.h,
//               child: CachedNetworkImage(
//                 imageUrl: widget.data.image.toString(),
//                 fit: BoxFit.contain,
//                 placeholder: (context, url) {
//                   return Shimmer.fromColors(
//                     period: const Duration(seconds: 2),
//                     baseColor: Colors.grey.shade300,
//                     highlightColor: Colors.grey.shade100,
//                     child: Container(
//                       width: 250,
//                       height: 250,
//                       color: Colors.white,
//                     ),
//                   );
//                 },
//                 errorWidget: (context, url, error) => const Icon(Icons.error),
//               ),
//             ),
//           ),
//           SizedBox(height: 20.r),
//           nameAndPrice(),
//           SizedBox(height: 20.r),
//           Text(
//             'Description',
//             style: fontInterW600(appcolor: AppColors.C_1D1E20),
//           ),
//           SizedBox(height: 15.r),
//           Text(
//             widget.data.description!.length > 195
//                 ? "${widget.data.description.toString().substring(0, 195)}..."
//                 : widget.data.description.toString(),
//             style: fontInterW400(appcolor: AppColors.C_8F959E)
//                 .copyWith(fontSize: 15.sp),
//           ),
//           SizedBox(height: 50.h),
//           InkWell(
//             borderRadius: BorderRadius.circular(15.r),
//             onTap: () {},
//             child: Container(
//               width: double.infinity,
//               height: 75.h,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(15.r),
//                 gradient: const LinearGradient(
//                   colors: [
//                     AppColors.C_B59DFB,
//                     AppColors.C_9775FA,
//                   ],
//                 ),
//               ),
//               child: Center(
//                 child: Text(
//                   "Add to cart",
//                   style: fontInterW600(appcolor: Colors.white),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget nameAndPrice() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           'Product name',
//           style: fontInterW600(appcolor: AppColors.C_1D1E20),
//         ),
//         SizedBox(height: 8.h),
//         SizedBox(
//           width: double.infinity,
//           child: Text(
//             widget.data.title.toString(),
//             style: fontInterW400(appcolor: AppColors.C_8F959E),
//           ),
//         ),
//         SizedBox(height: 16.h),
//         Text(
//           'Price',
//           style: fontInterW600(appcolor: AppColors.C_1D1E20),
//         ),
//         SizedBox(height: 8.h),
//         Text(
//           "\$ ${widget.data.price}",
//           style: fontInterW600(appcolor: AppColors.C_9775FA)
//               .copyWith(fontSize: 22.sp),
//         ),
//       ],
//     );
//   }
// }
