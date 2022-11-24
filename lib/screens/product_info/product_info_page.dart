import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:working_with_git/utils/app_icon.dart';
import 'package:working_with_git/widgets/custom_appbar_widget.dart';

class ProductInfoPage extends StatefulWidget {
  const ProductInfoPage({super.key});

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
    );
  }
}
