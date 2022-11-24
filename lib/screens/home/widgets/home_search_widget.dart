import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:working_with_git/utils/app_colors.dart';
import 'package:working_with_git/utils/app_icon.dart';
import 'package:working_with_git/widgets/style_widget.dart';

class HomeSearchPage extends StatelessWidget {
  const HomeSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 275.w,
          child: TextFormField(
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              prefixIcon: Container(
                padding: const EdgeInsets.all(10).r,
                child: SvgPicture.asset(AppIcon.icon_search),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
              hintText: 'Search...',
              hintStyle: fontInterW400(appcolor: AppColors.C_8F959E)
                  .copyWith(fontSize: 15.sp),
            ),
          ),
        ),
        SizedBox(
          width: 60.w,
          height: 60.h,
          child: SvgPicture.asset(AppIcon.icon_voice),
        ),
      ],
    );
  }
}
