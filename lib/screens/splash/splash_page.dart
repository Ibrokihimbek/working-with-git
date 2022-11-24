import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:working_with_git/utils/app_icon.dart';

import '../app_routs.dart';
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    super.initState();
    onNextPage();
  }

  onNextPage(){
    Future.delayed(Duration(seconds: 3000),(){
        Navigator.pushNamed(context, RoutName.home);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Color(0xFF9775FA),
        child: Container(
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height*0.25),
              Image.asset("assets/images/splash_image.png", height: 222,),
              SizedBox(height: MediaQuery.of(context).size.height*0.02,),
              Text("STYLISH", style: GoogleFonts.firaSans().copyWith(color: Colors.white, fontSize: 35, fontWeight: FontWeight.w400), ),
              SizedBox(height: MediaQuery.of(context).size.height*0.02,),
              Text("Find Your Slyle", style: GoogleFonts.sacramento().copyWith(color: Colors.white, fontSize: 40, fontWeight: FontWeight.w400),),
            ],
          ),
        ),

      ),
    );
  }
}