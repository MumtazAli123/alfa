// ignore_for_file: prefer_const_constructors , prefer_const_literals_to_create_immutables

import 'package:alfa/app/modules/home/views/mob_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  late AnimationController controller;
  late Animation<double> animation;

  var index = 0;
  var pages = [
    HomeView(),
    Container(
      color: Colors.red,
    ),
    Container(
      color: Colors.green,
    ),
    Container(
      color: Colors.blue,
    ),
    // StudyDestinations(),
    // Universities(),
    // AboutUs(),
    // ContactUs(),
  ];

  var pageController = PageController();

  var scrollController = ScrollController();

  var isServiceExpanded = false.obs;

  void changeIndex(int i) {
    index = i;
    update();
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
