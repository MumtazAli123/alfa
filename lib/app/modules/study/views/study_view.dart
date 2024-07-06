// ignore_for_file: prefer_const_constructors , prefer_const_literals_to_create_immutables

import 'package:alfa/page/home_page.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/components/button/gf_button_bar.dart';
import 'package:getwidget/components/card/gf_card.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';

import '../../../../widgets/mix_widgets.dart';
import '../controllers/study_controller.dart';

class StudyView extends GetView<StudyController> {
  const StudyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomePage(),
    );
  }

  _buildBody() {
    return NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              backgroundColor: Colors.green[800],
              expandedHeight: 200,
              iconTheme: IconThemeData(color: Colors.white),
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                // if scrolling up, show title
                title: Obx(() {
                  if (controller.isTitle.value) {
                    return Container(
                      padding: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: wText(
                        'Study Abroad',
                        color: Colors.white,
                      ),
                    );
                  } else {
                    return Container(
                      padding: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: wText(
                        '',
                        color: Colors.white,
                      ),
                    );
                  }

                }),
                background: _buildHeader(),
              ),
            ),
          ];
        },
        body: SingleChildScrollView(
          child: Column(
            children: [
              _buildBodyContent(),
            ],
          ),
        ),
    );
  }

  _buildHeader() {
    return Container(
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.blue,
        image: DecorationImage(
          image: AssetImage('assets/images/popular_2.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  _buildBodyContent() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Wrap(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            width: 400,
            child: _buildCard(
              title: 'Universities',
              image: 'assets/images/popular_1.jpg',
              onTap: () {
                Get.toNamed('/study/universities');
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            width: 400,
            child: _buildCard(
              title: 'Study Destinations',
              image: 'assets/images/popular_2.jpg',
              onTap: () {
              },
            ),
          ),
        ],
      ),
    );
  }

  _buildCard({required String title, required String image, required Null Function() onTap}) {
    return GFCard(
      showImage: true,
      colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.darken),

      title: GFListTile(
        title: Text(title),
      ),
      image: Image.asset(image, fit: BoxFit.cover),
      content: Text('Explore $title'),
      buttonBar: GFButtonBar(
        children: [
          GFButton(
            onPressed: onTap,
            text: 'Explore',
            color: Colors.green,
          ),
        ],
      ),
    );
  }
}
