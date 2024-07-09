// ignore_for_file: prefer_const_constructors , prefer_const_literals_to_create_immutables

import 'package:alfa/page/home_page.dart';
import 'package:alfa/widgets/responsive.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:animations/animations.dart';

import 'package:get/get.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/components/button/gf_button_bar.dart';
import 'package:getwidget/components/card/gf_card.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';

import '../../../../widgets/mix_widgets.dart';
import '../controllers/study_controller.dart';

class StudyView extends StatefulWidget {
  const StudyView({super.key});

  @override
  State<StudyView> createState() => _StudyViewState();
}

class _StudyViewState extends State<StudyView> {
  final StudyController controller = Get.put(StudyController());
  bool _slowAnimations = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: HomePage(),
      body: _buildBody(),
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
      child: ResponsiveWidget(
        mobiView: _buildMobScreen(),
        webView: _buildWebScreen(),
      ),
    );
  }


  _buildMobScreen() {
    return Column(
      children: [
        wBuildCard(
          title: 'Popular',
          image: 'assets/images/popular_1.jpg',
          icon: EvaIcons.shake,
          onTap: () {
            Get.toNamed('/popular');
          },
        ),
        wBuildCard(
          title: 'Scholarship',
          icon: Icons.school,
          image: 'assets/images/scholarship.jpg',
          onTap: () {
            Get.toNamed('/scholarship');
          },
        ),
        wBuildCard(
          title: 'Visa',
          icon: EvaIcons.checkmarkCircle2,
          image: 'assets/icons/studentvisa.jpg',
          onTap: () {
            Get.toNamed('/visa');
          },
        ),
        wBuildCard(
          title: 'University',
          icon: EvaIcons.bookOpen,
          image: 'assets/images/popular_4.jpg',
          onTap: () {
            Get.toNamed('/university');
          },
        ),
      ],
    );
  }

  _buildWebScreen() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: wBuildCard(
                title: 'Popular',
                icon: EvaIcons.shake,
                image: 'assets/images/popular_1.jpg',
                onTap: () {
                  Get.toNamed('/popular');
                },
              ),
            ),
            Expanded(
              child: wBuildCard(
                title: 'Scholarship',
                icon: Icons.school,
                image: 'assets/images/scholarship.jpg',
                onTap: () {
                  Get.toNamed('/scholarship');
                },
              ),
            ),
            Expanded(
              child: wBuildCard(
                title: 'Visa',
                icon: EvaIcons.checkmarkCircle2,
                image: 'assets/icons/studentvisa.jpg',
                onTap: () {
                  Get.toNamed('/visa');
                },
              ),
            ),
            Expanded(
              child: wBuildCard(
                title: 'University',
                icon: EvaIcons.bookOpen,
                image: 'assets/images/popular_4.jpg',
                onTap: () {
                  Get.toNamed('/university');
                },
              ),
            ),
          ],
        ),
      //   hedding('Popular'),
        _buildPopular(),
      //   hedding('Scholarship'),
      //   _buildScholarship(),
      ],
    );
  }

  _buildPopular() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          cText('Popular', size: 30),
          SizedBox(height: 10),
          SizedBox(
            height: 200,
            child: ListView(
              itemExtent: 250,
              scrollDirection: Axis.horizontal,
              children: [
                _buildPopularCard(
                  title: 'USA',
                  image: 'assets/images/popular_1.jpg',
                  onTap: () {
                    Get.toNamed('/usa');
                  },
                ),
                _buildPopularCard(
                  title: 'UK',
                  image: 'assets/images/popular_2.jpg',
                  onTap: () {
                    Get.toNamed('/uk');
                  },
                ),
                _buildPopularCard(
                  title: 'Canada',
                  image: 'assets/images/popular_3.jpg',
                  onTap: () {
                    Get.toNamed('/canada');
                  },
                ),
                _buildPopularCard(
                  title: 'Australia',
                  image: 'assets/images/popular_4.jpg',
                  onTap: () {
                    Get.toNamed('/australia');
                  },
                ),
              //   europe's all country,
                _buildPopularCard(
                  title: "Spain",
                  image: 'assets/images/popular_5.jpg',
                  onTap: () {
                    Get.toNamed('/spain');
                  },
                ),
                _buildPopularCard(
                  title: 'Germany',
                  image: 'assets/images/popular_6.jpg',
                  onTap: () {
                    Get.toNamed('/germany');
                  },
                ),
                _buildPopularCard(
                  title: 'France',
                  image: 'assets/images/popular_4.jpg',
                  onTap: () {
                    Get.toNamed('/france');
                  },
                ),
                _buildPopularCard(
                  title: 'Italy',
                  image: 'assets/images/popular_3.jpg',
                  onTap: () {
                    Get.toNamed('/italy');
                  },
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }

  _buildPopularCard({required String title, required String image, required Null Function() onTap}) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width: 250,
        child: Card(
          child: Column(
            children: [
              Container(
                height: 130,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: wText(title, size: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
