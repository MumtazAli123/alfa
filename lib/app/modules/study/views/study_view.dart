// ignore_for_file: prefer_const_constructors , prefer_const_literals_to_create_immutables

import 'package:alfa/widgets/responsive.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/components/button/gf_button_bar.dart';

import '../../../../widgets/mix_widgets.dart';
import '../controllers/study_controller.dart';

class StudyView extends StatefulWidget {
  const StudyView({super.key});

  @override
  State<StudyView> createState() => _StudyViewState();
}

class _StudyViewState extends State<StudyView> {
  final StudyController controller = Get.put(StudyController());

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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(padding: const EdgeInsets.only(left: 18.0),
          child: cText('Mission', size: 30),
        ),
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
      //   heading('Popular'),
        _buildPopular(),
      SizedBox(height: 60),
      //   heading('Scholarship'),
        _buildScholarship(),
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
                  image: 'assets/images/usa.jpg',
                  onTap: () {
                    _buildAboutStudyInCountryDialog(
                      'USA',
                      ' The United States of America (USA), commonly known as the United States (U.S. or US) or America, is a country primarily located in North America. It consists of 50 states, a federal district, five major unincorporated territories, 326 Indian reservations, and some minor possessions.',
                      'assets/images/usa.jpg',

                      () {
                        Get.toNamed('/usa');
                      },
                    );
                    // Get.toNamed('/usa');
                  },
                ),
                _buildPopularCard(
                  title: 'UK',
                  image: 'assets/images/uk.jpg',
                  onTap: () {
                    _buildAboutStudyInCountryDialog(
                        'UK',
                        'The United Kingdom of Great Britain and Northern Ireland, commonly known as the United Kingdom (UK) or Britain, is a sovereign country in north-western Europe, off the north-­western coast of the European mainland.',
                        'assets/images/uk.jpg',
                        () {
                          Get.toNamed('/uk');
                        },
                    );
                    // Get.toNamed('/uk');
                  },
                ),
                _buildPopularCard(
                  title: 'Canada',
                  image: 'assets/images/canada.jpeg',
                  onTap: () {
                    _buildAboutStudyInCountryDialog(
                        'Canada',
                        'Canada is a country in North America. Its ten provinces and three territories extend from the Atlantic to the Pacific and northward into the Arctic Ocean, covering 9.98 million square kilometres, making it the world\'s second-largest country by total area.',
                        'assets/images/canada.jpeg',
                        () {
                          Get.toNamed('/canada');
                        },
                    );
                    // Get.toNamed('/canada');
                  },
                ),
                _buildPopularCard(
                  title: 'Australia',
                  image: 'assets/images/popular_4.jpg',
                  onTap: () {
                    _buildAboutStudyInCountryDialog(
                        'Australia',
                        'Australia, officially the Commonwealth of Australia, is a sovereign country comprising the mainland of the Australian continent, the island of Tasmania, and numerous smaller islands.',
                        'assets/images/popular_4.jpg',
                        () {
                          Get.toNamed('/australia');
                        },
                    );
                    // Get.toNamed('/australia');
                  },
                ),
              //   europe's all country,
                _buildPopularCard(
                  title: "Spain",
                  image: 'assets/images/popular_5.jpg',
                  onTap: () {
                    _buildAboutStudyInCountryDialog(
                        'Spain',
                        'Spain, officially the Kingdom of Spain, is a country in Southwestern Europe with some pockets of territory across the Strait of Gibraltar and the Atlantic Ocean. Its continental European territory is situated on the Iberian Peninsula.',
                        'assets/images/popular_5.jpg',
                        () {
                          Get.toNamed('/spain');
                        },

                    );
                  },
                ),
                _buildPopularCard(
                  title: 'Germany',
                  image: 'assets/images/popular_6.jpg',
                  onTap: () {
                    _buildAboutStudyInCountryDialog(
                        'Germany',
                        'Germany, officially the Federal Republic of Germany, is a country in Central Europe. It is the second-most populous country in Europe after Russia, and the most populous member state of the European Union.',
                        'assets/images/popular_6.jpg',
                        () {
                          Get.toNamed('/germany');
                        },
                    );
                  },
                ),
                _buildPopularCard(
                  title: 'France',
                  image: 'assets/images/popular_4.jpg',
                  onTap: () {
                    _buildAboutStudyInCountryDialog(
                        'France',
                        'France, officially the French Republic, is a country primarily located in Western Europe, consisting of metropolitan France and several overseas regions and territories.',
                        'assets/images/popular_4.jpg',
                        () {
                          Get.toNamed('/france');
                        },
                    );
                  },
                ),
                _buildPopularCard(
                  title: 'Italy',
                  image: 'assets/images/popular_3.jpg',
                  onTap: () {
                    _buildAboutStudyInCountryDialog(
                        'Italy',
                        'Italy, officially the Italian Republic, is a country consisting of a peninsula delimited by the Alps and several islands surrounding it, whose territory largely coincides with the homonymous geographical region.',
                        'assets/images/popular_3.jpg',
                        () {
                          Get.toNamed('/italy');
                        },
                    );
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

  void _buildAboutStudyInCountryDialog(String title,String subTitle, String image, Null Function() onTap,) {
    Get.dialog(
      Dialog(
        child: Container(
          width: 400,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 200,
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
                child: Column(
                  children: [
                    wText(title, size: 30),
                    SizedBox(height: 10),
                    aText(subTitle),
                    SizedBox(height: 10),
                    GFButtonBar(
                      children: [
                        GFButton(
                          onPressed: onTap,
                          text: 'Learn More',
                        ),
                        GFButton(
                          onPressed: () {
                            Get.back();
                          },
                          text: 'Close',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buildScholarship() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(padding: const EdgeInsets.only(left: 18.0),
          child: cText('Scholarship for Student', size: 30),
        ),
        SizedBox(height: 10),
        Row(
          children: [
          //   usa, uk, canada, australia, spain, germany, france, italy
            Expanded(
              child: wBuildScholarshipCard(
                title: 'USA',
                image: 'assets/images/usa.jpg',
                onTap: () {
                  Get.toNamed('/usa');
                },
              ),
            ),
            Expanded(
              child: wBuildScholarshipCard(
                title: 'UK',
                image: 'assets/images/uk.jpg',
                onTap: () {
                  Get.toNamed('/uk');
                },
              ),
            ),
            Expanded(
              child: wBuildScholarshipCard(
                title: 'Canada',
                image: 'assets/images/canada.jpeg',
                onTap: () {
                  Get.toNamed('/canada');
                },
              ),
            ),

          ],
        ),
      ],
    );

  }
}
