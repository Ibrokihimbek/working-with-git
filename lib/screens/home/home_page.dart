import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:working_with_git/utils/app_colors.dart';
import 'package:working_with_git/utils/app_icon.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.C_F3F3F3,
      appBar: AppBar(
        backgroundColor: AppColors.C_F3F3F3,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(AppIcon.icon_more),
        ),
      ),
    );
  }
}
