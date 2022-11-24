import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:working_with_git/data/api/models/product_model.dart';
import 'package:working_with_git/data/api/repository/repository_item.dart';
import 'package:working_with_git/screens/product_info/widgets/Product_info_item_widget.dart';
import 'package:working_with_git/screens/product_info/widgets/Product_info_shimmer.dart';
import 'package:working_with_git/utils/app_colors.dart';
import 'package:working_with_git/utils/app_icon.dart';
import 'package:working_with_git/widgets/custom_appbar_widget.dart';
import 'package:working_with_git/widgets/style_widget.dart';

// ignore: must_be_immutable
class ProductInfoPage extends StatefulWidget {
  int productInfo;
  ProductInfoPage({super.key, required this.productInfo});

  @override
  State<ProductInfoPage> createState() => _ProductInfoPageState();
}

class _ProductInfoPageState extends State<ProductInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.C_FEFEFE,
      appBar: MyCustomAppBar(
        onMoreTap: () {},
        onBasketTap: () {},
        iconName: AppIcon.icon_back_arrow,
        iconName1: AppIcon.icon_basket,
      ),
      body: Column(
        children: [
          FutureBuilder<ProductItem>(
            future: AppRepository.getProductFromId(
              widget.productInfo.toInt(),
            ),
            builder: (context, AsyncSnapshot<ProductItem> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return ProductItemShimmer();
              }
              if (snapshot.hasError) {
                return Center(child: Text(snapshot.error.toString()));
              }
              if (snapshot.hasData) {
                var data = snapshot.data;
                return ProductItemWidget(data: data!);
              } else {
                return const Center(
                  child: Text("ERROR"),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
