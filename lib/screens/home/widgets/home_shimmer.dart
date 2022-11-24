import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
class ShimmerCategory extends StatelessWidget {
  const ShimmerCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return    SizedBox(
      height: MediaQuery.of(context).size.height*0.82,
      child:  Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[400]!,
          child: Container(
            padding: const EdgeInsets.all(12),
            child: SizedBox(
              height: MediaQuery
                  .of(context)
                  .size
                  .height * 0.84,
              width: MediaQuery
                  .of(context)
                  .size
                  .width * 1,
              child: GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 4,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 2.5 / 3.1,
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 12
                  ),
                  itemBuilder: (context, i) {
                    return Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.red,
                      ),

                    );
                  }

              ),
            ),
          )
      ),
    );
  }
}
