import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:working_with_git/screens/app_routs.dart';

import '../../../data/api/models/product_model.dart';
import '../../../data/api/repository/repository_item.dart';
import '../../../utils/app_colors.dart';
import '../../../widgets/style_widget.dart';
import 'home_shimmer.dart';

class CategoryHomeItems extends StatefulWidget {
  final int listindex;
  CategoryHomeItems({Key? key, required this.listindex}) : super(key: key);

  @override
  State<CategoryHomeItems> createState() => _CategoryHomeItemsState();
}

class _CategoryHomeItemsState extends State<CategoryHomeItems> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ProductItem>>(
      future: AppRepository.getCategoryItemData(widget.listindex.toInt()),
      builder: (context, AsyncSnapshot<List<ProductItem>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const ShimmerCategory();
        }
        if (snapshot.hasData) {
          var data = snapshot.data;
          return GridView.builder(
            shrinkWrap: true,
            itemCount: data!.length,
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 2.5 / 3.1,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
            ),
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, RoutName.productInfo);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.r),
                      color: AppColors.C_F5F6FA,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: SizedBox(
                              width: 100.w,
                              height: 100.w,
                              child: Image.network(
                                data[index].image!,
                              ),
                            ),
                          ),
                          SizedBox(height: 12.h),
                          Text(
                            data[index].title!.length > 53
                                ? "${data[index].title.toString().substring(0, 53)}..."
                                : data[index].title!,
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            '\$ ${data[index].price}',
                            style: fontInterW600(appcolor: AppColors.C_9775FA),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
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
