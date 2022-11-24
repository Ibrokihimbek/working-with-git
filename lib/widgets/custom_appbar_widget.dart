import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:working_with_git/utils/app_colors.dart';
import 'package:working_with_git/utils/app_icon.dart';

class MyCustomAppBar extends StatelessWidget implements PreferredSize {
  const MyCustomAppBar({
    Key? key,
    required this.onMoreTap,
    required this.onBasketTap,
    required this.iconName,
    required this.iconName1,
  }) : super(key: key);

  final VoidCallback onMoreTap;
  final VoidCallback onBasketTap;
  final String iconName;
  final String iconName1;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.C_FEFEFE,
      elevation: 0,
      leading: Padding(
        padding: const EdgeInsets.only(left: 8).r,
        child: InkWell(
          onTap: onMoreTap,
          child: SizedBox(
            width: 45.w,
            height: 45.h,
            child: SvgPicture.asset(iconName),
          ),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 8).r,
          child: InkWell(
            onTap: onBasketTap,
            child: SizedBox(
              width: 45.w,
              height: 45.h,
              child: SvgPicture.asset(iconName1),
            ),
          ),
        ),
      ],
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: AppColors.C_FEFEFE,
      ),
    );
  }

  @override
  Widget get child => throw UnimplementedError();

  @override
  Size get preferredSize => const Size(double.infinity, 60);
}
