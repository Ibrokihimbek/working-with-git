import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:working_with_git/utils/app_icon.dart';
import 'package:working_with_git/widgets/custom_appbar_widget.dart';
import 'package:working_with_git/screens/home/widgets/home_category_widget.dart';
import 'package:working_with_git/screens/home/widgets/home_search_widget.dart';
import 'package:working_with_git/utils/app_colors.dart';
import 'package:working_with_git/widgets/style_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageIndex = 0;

  List cotegoryList = [
    "All",
    "Electronics",
    "Jewelery",
    "Men's clothing",
    "Women's clothing",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.C_FEFEFE,
      appBar: MyCustomAppBar(
        onMoreTap: () {},
        onBasketTap: () {},
        iconName: AppIcon.icon_more,
        iconName1: AppIcon.icon_basket,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Text(
              'developper team',
              style: fontInterW600(appcolor: AppColors.C_1D1E20)
                  .copyWith(fontSize: 28.sp),
            ),
            subtitle: Text(
              'Welcome to Laza',
              style: fontInterW400(appcolor: AppColors.C_8F959E)
                  .copyWith(fontSize: 15.sp),
            ),
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
          SizedBox(height: 15.h),
          SizedBox(
            height: 50.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: cotegoryList.length,
              shrinkWrap: true,
              itemBuilder: ((context, index) {
                return buildPadding(index);
              }),
            ),
          ),
          Expanded(
            child: CategoryHomeItems(listindex: pageIndex),
          ),
        ],
      ),
    );
  }

  Widget buildPadding(int index) {
    return InkWell(
      borderRadius: BorderRadius.circular(25.r),
      onTap: (() {
        setState(() {
          pageIndex = index;
        });
      }),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 170.w,
          height: 50.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.r),
            color: index == pageIndex
                ? AppColors.C_9775FA.withOpacity(0.7)
                : AppColors.C_F5F6FA,
          ),
          child: Center(
            child: Text(
              cotegoryList[index],
              style: fontInterW600(
                appcolor:
                    index == pageIndex ? Colors.white : AppColors.C_1D1E20,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
