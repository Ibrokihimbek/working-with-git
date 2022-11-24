import 'package:flutter/material.dart';
import 'package:working_with_git/screens/home/home_page.dart';
import 'package:working_with_git/screens/product_info/product_info_page.dart';
import 'package:working_with_git/screens/splash/splash_page.dart';

import 'main/main_page.dart';

abstract class RoutName {
  static const splash = 'splash';
  static const main = 'main';
  static const home = 'home';
  static const productInfo = 'productInfo';
}

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutName.splash:
        return MaterialPageRoute(builder: (_) => SplashPage());
      case RoutName.main:
        return MaterialPageRoute(builder: (_) => MainPage());
      case RoutName.home:
        return MaterialPageRoute(builder: (_) => HomePage());
      case RoutName.productInfo:
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (_) => ProductInfoPage(
            productInfo: args['productInfo'],
          ),
        );
      default:
        return MaterialPageRoute(builder: (_) => Scaffold());
    }
  }
}
