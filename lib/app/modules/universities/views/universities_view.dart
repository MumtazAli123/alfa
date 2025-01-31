// ignore_for_file: prefer_const_constructors , prefer_const_literals_to_create_immutables

import 'package:alfa/widgets/responsive.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getwidget/components/card/gf_card.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';

import '../../../../widgets/mix_widgets.dart';
import '../controllers/universities_controller.dart';

class UniversitiesView extends GetView<UniversitiesController> {
  const UniversitiesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: cText('Universities'),
        centerTitle: true,
      ),
      body: _buildBody(),
      
    );
  }

  _buildBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildHeader(),
          _buildBodyContent(),
        ],
      ),
    );
  }

  _buildHeader() {
    return Container(
      height: 300,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.blue,
        image: DecorationImage(
          image: AssetImage('assets/images/popular_2.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.5),
            borderRadius: BorderRadius.circular(10),
          ),
          child: wText(
            'Universities',
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  _buildBodyContent() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ResponsiveWidget(
        mobiView: _buildLargeScreen(),
        webView: _buildMediumScreen(),
      ),
    );
  }

  _buildCard({String? text, required String image}) {
    return InkWell(
      onTap: () {
        if (text == 'Study Destinations') {
          Get.toNamed('/study/study-destinations');
        } else if (text == 'Contact Us') {
          Get.toNamed('/contact');
        } else if (text == 'About Us') {
          Get.toNamed('/about');
        }
      },
      child: GFCard(
        showImage: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        image: Image.asset(image),
        title: GFListTile(
          title: Text(text!),
        ),
        content: Text(''),
      ),
    );
  }

  _buildLargeScreen() {
    return GridView.count(
      crossAxisCount: 1,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: [
        _buildCard(
          text: 'Study\nDestinations',
          image: 'assets/images/popular_1.jpg',
        ),
        _buildCard(
          text: 'Contact Us',
          image: 'assets/images/popular_2.jpg',
        ),
        _buildCard(
          text: 'About Us',
          image: 'assets/images/popular_3.jpg',
        ),
      ],
    );
  }

  _buildMediumScreen() {
    return GridView.count(
      crossAxisCount: 3,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: [
        _buildCard(
          text: 'Study Destinations',
          image: 'assets/images/popular_1.jpg',
        ),
        _buildCard(
          text: 'Contact Us',
          image: 'assets/images/popular_2.jpg',
        ),
        _buildCard(
          text: 'About Us',
          image: 'assets/images/popular_3.jpg',
        ),
      ],
    );
  }
}
