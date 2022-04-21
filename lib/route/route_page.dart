import 'package:flutter_getx_base/futures/auth/login/login_binding.dart';
import 'package:flutter_getx_base/futures/auth/login/login_screen.dart';
import 'package:flutter_getx_base/futures/home/home_binding.dart';
import 'package:flutter_getx_base/futures/home/home_screen.dart';
import 'package:flutter_getx_base/route/route_name.dart';
import 'package:get/get.dart';

class RoutePage {
  static final pages = [
    GetPage(
      name: RouteName.login,
      page: () => const LoginScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: RouteName.home,
      page: () => const HomeScreen(),
      binding: HomeBinding(),
    ),
  ];
}
