import 'package:flutter/cupertino.dart';

import 'package:get/get.dart';

import 'package:alfa/app/modules/about/bindings/about_binding.dart';
import 'package:alfa/app/modules/about/views/about_view.dart';
import 'package:alfa/app/modules/contact/bindings/contact_binding.dart';
import 'package:alfa/app/modules/contact/views/contact_view.dart';
import 'package:alfa/app/modules/home/bindings/home_binding.dart';
import 'package:alfa/app/modules/home/views/mob_view.dart';
import 'package:alfa/app/modules/home/views/web_view.dart';
import 'package:alfa/app/modules/study/bindings/study_binding.dart';
import 'package:alfa/app/modules/study/views/study_view.dart';
import 'package:alfa/app/modules/universities/bindings/universities_binding.dart';
import 'package:alfa/app/modules/universities/views/universities_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => LayoutBuilder(builder: (context, constraints) {
        if (constraints.maxWidth < 950) {
          return HomeView();
        } else {
          return WebView(
          );
        }
      }),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.CONTACT,
      page: () => ContactView(),
      binding: ContactBinding(),
    ),
    GetPage(
      name: _Paths.ABOUT,
      page: () => AboutView(),
      binding: AboutBinding(),
    ),
    GetPage(
      name: _Paths.UNIVERSITIES,
      page: () => UniversitiesView(),
      binding: UniversitiesBinding(),
    ),
    GetPage(
      name: _Paths.STUDY,
      page: () => StudyView(
      ),
      binding: StudyBinding(),
    ),
  ];
}
