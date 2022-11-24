import 'package:flutter/material.dart';

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
            return ShimmerCategory();
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
              ),
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: Colors.amber,
                    child: Text(
                      data[index].title.toString(),
                    ),
                  ),
                );
              },
            );
          } else
            return Center(
              child: Text("ERROR"),
            );
        });
  }
}
