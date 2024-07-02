import 'package:alfa/app/modules/home/views/web_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:alfa/app/modules/home/bindings/home_binding.dart';
import 'package:alfa/app/modules/home/views/mob_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => LayoutBuilder(
      builder:  (context, constraints) {
        if (constraints.maxWidth < 950) {
          return  HomeView();
        } else {
          return WebView();
        }
      }
  ),
      binding: HomeBinding(),
    ),
  ];
}
