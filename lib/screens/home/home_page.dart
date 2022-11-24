import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:working_with_git/screens/home/widgets/home_appbar_widget.dart';
import 'package:working_with_git/screens/home/widgets/home_search_widget.dart';
import 'package:working_with_git/utils/app_colors.dart';
import 'package:working_with_git/widgets/style_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List cotegoryList = [
    "electronics",
    "jewelery",
    "men's clothing",
    "women's clothing",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.C_FEFEFE,
      appBar: MyCustomAppBar(onMoreTap: () {}, onBasketTap: () {}),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Text('developper team',
                style: fontInterW600(appcolor: AppColors.C_1D1E20)
                    .copyWith(fontSize: 28.sp)),
            subtitle: Text('Welcome to Laza',
                style: fontInterW400(appcolor: AppColors.C_8F959E)
                    .copyWith(fontSize: 15.sp)),
          ),
          SizedBox(height: 20.h),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: HomeSearchPage(),
          ),
          SizedBox(height: 20.h),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12).r,
            child: Text(
              'Choose category',
              style: fontInterW600(appcolor: AppColors.C_1D1E20),
            ),
          ),
          ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: cotegoryList.length,
            shrinkWrap: true,
            itemBuilder: ((context, index) {
              return Container();
            }),
          ),
        ],
      ),
    );
  }
}
