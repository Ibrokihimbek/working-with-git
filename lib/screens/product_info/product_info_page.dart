import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:working_with_git/data/api/models/product_model.dart';
import 'package:working_with_git/screens/product_info/widgets/Product_info_item_widget.dart';
import 'package:working_with_git/utils/app_icon.dart';
import 'package:working_with_git/widgets/custom_appbar_widget.dart';

class ProductInfoPage extends StatefulWidget {
   int?  productInfo = 0;
   ProductInfoPage({super.key, required this.productInfo});

  @override
  State<ProductInfoPage> createState() => _ProductInfoPageState();
}

class _ProductInfoPageState extends State<ProductInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyCustomAppBar(
        onMoreTap: () {},
        onBasketTap: () {},
        iconName: AppIcon.icon_back_arrow,
        iconName1: AppIcon.icon_basket,
      ),
      body: ProductItemWidget(productindex: widget.productInfo!.toInt()),
    );
  }
}
