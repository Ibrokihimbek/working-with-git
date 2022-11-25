import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:working_with_git/screens/home/home_page.dart';
import 'package:working_with_git/utils/app_colors.dart';
import 'package:working_with_git/utils/app_icon.dart';
import 'package:working_with_git/widgets/style_widget.dart';

import '../boxpage/boxpage.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Widget> _pages = [
    HomePage(),
    BoxPage(),
    Container(),
  ];

  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.C_FEFEFE,
      body: _pages[currentPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        backgroundColor: AppColors.C_FEFEFE,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        currentIndex: currentPageIndex,
        onTap: (index) {
          setState(
            () {
              currentPageIndex = index;
            },
          );
        },
        items: [
          BottomNavigationBarItem(
              icon: SizedBox(
                  width: 50.w,
                  height: 30.h,
                  child: SvgPicture.asset(AppIcon.icon_home)),
              label: ''),
          BottomNavigationBarItem(
              icon: SizedBox(
                  width: 21.w,
                  height: 21.h,
                  child: SvgPicture.asset(AppIcon.icon_cart)),
              label: ''),
          BottomNavigationBarItem(
              icon: SizedBox(
                  width: 21.w,
                  height: 21.h,
                  child: SvgPicture.asset(AppIcon.icon_wallet)),
              label: ''),
        ],
      ),
    );
  }
}
