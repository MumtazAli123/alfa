// ignore_for_file: prefer_const_constructors , prefer_const_literals_to_create_immutables

import 'package:alfa/app/modules/home/controllers/home_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../global/global.dart';
import '../../../../widgets/mix_widgets.dart';
import '../../../../widgets/my_drawer.dart';

class WebView extends StatefulWidget {
  const WebView({super.key});

  @override
  State<WebView> createState() => _WebViewState();
}

class _WebViewState extends State<WebView> {
  final HomeController homeController = Get.put(HomeController());
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  late AnimationController controller;
  late Animation<double> animation;
  String f(String x) => x;
  String g(num y) => f(y as String);

  String avatarUrl =
      'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: MyDrawer(),
      // bottomNavigationBar: _buildBottomNavigationBar(),

      body: _buildBody(context),
    );
  }

  _buildBody(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(seconds: 2),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/main.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            _buildAppBar(context),
            _buildSlideBanner(context),
          ],
        ),
      ),
    );
  }

  _buildAppBar(BuildContext context) {
    return AppBar(
      centerTitle: false,
      leading: GestureDetector(
        onTap: () {
          _scaffoldKey.currentState?.openDrawer();
        },
        child: Container(
          padding: EdgeInsets.all(8),
          child: Image.asset(
            'assets/icons/meerLogo.png',
            width: 50,
          ),
        ),
      ),
      title: Text("Meer's Consulting"),
      actions: [
        // whatsapp
        IconButton(
          onPressed: () {
            launch('https://wa.me/923022538289');
          },
          icon: Image.asset('assets/icons/whatsapp.png', width: 20),
        ),
        IconButton(
            onPressed: () {
              launch("https://maps.app.goo.gl/Pag6B4CT8yAG4Acp9");
            },
            icon: Icon(Icons.location_on)),
        IconButton(
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
          icon: Icon(Icons.menu),
        ),
      ],
    );
  }

  _buildSlideBanner(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10),
        Container(
          height: 300,
          decoration: BoxDecoration(
            color: Colors.grey[300],
          ),
          child: CarouselSlider(
            options: CarouselOptions(
              height: 300,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              pauseAutoPlayOnTouch: true,
              aspectRatio: 2.0,
              enlargeCenterPage: true,
              enableInfiniteScroll: true,
              viewportFraction: 0.8,
            ),
            items: hotelsImagesList.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      color: Colors.amber,
                    ),
                    child: Image.asset(
                      i,
                      fit: BoxFit.cover,
                    ),
                  );
                },
              );
            }).toList(),
          ),
        ),
        SizedBox(height: 60.0),
        Wrap(
          children: [
            _buildHeading(),
            _buildContent(),
            _buildContactForm(),
            // _buildOurPartners(),
            _buildBottomHeader(),
          ],
        ),
        SizedBox(height: 60.0),
        Container(
          height: 500,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(8),
          child: Stack(
            children: [
              Positioned(
                right: 30,
                top: 30,
                child: Container(
                  padding: EdgeInsets.all(8),
                  height: 500,
                  width: 300,
                  child: GFImageOverlay(
                    height: 200,
                    width: 300,
                    image: AssetImage('assets/images/popular_1.jpg'),
                    colorFilter: new ColorFilter.mode(
                        Colors.black.withOpacity(0.3), BlendMode.darken),
                  ),
                ),
              ),
              SizedBox(width: 10),
              Positioned(
                left: 420,
                top: 30,
                child: Container(
                  padding: EdgeInsets.all(8),
                  height: 400,
                  width: 600,
                  child: GFImageOverlay(
                    height: 200,
                    width: 300,
                    image: AssetImage('assets/images/popular_2.jpg'),
                    colorFilter: new ColorFilter.mode(
                        Colors.black.withOpacity(0.3), BlendMode.darken),
                  ),
                ),
              ),
              SizedBox(width: 10),
              Positioned(
                left: 50,
                top: 30,
                child: Container(
                  padding: EdgeInsets.all(8),
                  height: 600,
                  width: 300,
                  child: GFImageOverlay(
                    height: 200,
                    width: 300,
                    image: AssetImage('assets/images/popular_3.jpg'),
                    colorFilter: new ColorFilter.mode(
                        Colors.black.withOpacity(0.3), BlendMode.darken),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  _buildHeading() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.all(8),
        width: 600,
        height: 400,
        decoration: BoxDecoration(
          color: Colors.grey[50],
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            wText('Student Visa Assistance',
                size: 25, color: Colors.green[800]),
            aText(
                'We provide visa assistance to students who want to study abroad',
                color: Colors.black,
                size: 16),
            Text(
                "Student visa is an validation by the immigration authorities on passport that indicates that you are allowed to enter the country and stay to study."),
            SizedBox(height: 10.0),
            Text(
                "Generally you begin your student visa application once you receive confirmation of enrollment at chosen university. That’s’ why it suggested to apply for admission earliest as possible, so visa application can be initiated soon as possible, as time can vary on outcome."),
            SizedBox(height: 20.0),
            Text(
                'There are some steps to apply for a student visa and how you complete these steps may vary according to intend study destination. HS Consultants will direct and assist you with your visa application forms.'),
          ],
        ),
      ),
    );
  }

  _buildContent() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: Colors.grey[50],
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        width: 600,
        height: 400,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            aText('Students will require evidence of:',
                size: 18, color: Colors.green[800]),
            SizedBox(height: 10.0),
            aText('1. Proof of enrolment'),
            SizedBox(height: 10.0),
            aText(
                '2. Proof of financial capacity to cover the cost of travel, course tuition fees and living costs'),
            SizedBox(height: 5.0),
            aText(
                '3. Financial capacity to pay for tuition fees, living costs and travel for the entire period of stay in the country.'),
            SizedBox(height: 5.0),
            aText('4. English language proficiency.'),
            SizedBox(height: 5.0),
            aText('5. Overseas student health cover.'),
            SizedBox(height: 5.0),
            aText('6. Genuine temporary entrant requirement.'),
            SizedBox(height: 5.0),
            aText('7. Health and character requirements.'),
            SizedBox(height: 5.0),
            aText('8. Valid six months passport beyond period of stay.'),
          ],
        ),
      ),
    );
  }

  _buildContactForm() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 500,
        width: 600,
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Contact Us',
                style: GoogleFonts.aBeeZee(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.green[800],
                ),
              ),
              SizedBox(height: 10.0),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: 'Name',
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              SizedBox(height: 10.0),
              TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: 'Email',
                    prefixIcon: Icon(Icons.email)),
              ),
              SizedBox(height: 10.0),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: 'Phone',
                  prefixIcon: Icon(Icons.phone),
                ),
              ),
              SizedBox(height: 10.0),
              TextField(
                maxLines: 3,
                maxLength: 200,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: 'Message',
                  prefixIcon: Icon(Icons.message),
                ),
              ),
              SizedBox(height: 60.0),
              GFButton(
                onPressed: () {},
                text: 'Submit',
                size: 50,
                color: Colors.green,
                hoverColor: Colors.orange,
                splashColor: Colors.green,
                shape: GFButtonShape.standard,
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buildOurPartners() {
    return Column(
      children: [
        Text(
          'Our Partners',
          style: GoogleFonts.aBeeZee(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.green[800],
          ),
        ),
        SizedBox(height: 10.0),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                'assets/images/0.jpg',
                width: 100,
              ),
              SizedBox(width: 14.0),
              Image.asset(
                'assets/images/1.jpg',
                width: 100,
              ),
              SizedBox(width: 14.0),
              Image.asset(
                'assets/images/2.jpg',
                width: 100,
              ),
              SizedBox(width: 14.0),
              Image.asset(
                'assets/images/3.jpg',
                width: 100,
              ),
            ],
          ),
        ),
      ],
    );
  }

  _buildBottomHeader() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              launch("https://maps.app.goo.gl/Pag6B4CT8yAG4Acp9");
            },
            child: Container(
              padding: EdgeInsets.all(8),
              height: 230,
              width: 600,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/icons/map.png'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                color: Colors.blue[800],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GFButton(
                      onPressed: () {
                        launch("https://maps.app.goo.gl/Pag6B4CT8yAG4Acp9");
                      },
                      icon: Icon(Icons.location_on, color: Colors.white),
                      text: 'Location',
                      size: 50,
                      hoverColor: Colors.green,
                      splashColor: Colors.orange,
                      color: Colors.blueAccent,
                      shape: GFButtonShape.standard),
                  SizedBox(width: 40),
                  GFButton(
                    onPressed: () {
                      launch('https://wa.me/923022538289');
                    },
                    icon: Image.asset('assets/icons/whatsapp.png', width: 20),
                    text: 'Live Chat',
                    splashColor: Colors.orange,
                    color: Colors.green,
                    hoverColor: Colors.orange,
                    size: 50,
                    shape: GFButtonShape.standard,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20.0),
          // Container(
          //     padding: EdgeInsets.all(8),
          //     height: 200,
          //     width: 600,
          //     decoration: BoxDecoration(
          //       borderRadius: BorderRadius.only(topLeft: Radius.circular(20)),
          //       color: Colors.blue[800],
          //     ),
          //     child: Column(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       crossAxisAlignment: CrossAxisAlignment.center,
          //       children: [
          //         //   book an appointment
          //         SizedBox(height: 60.0),
          //         Row(
          //           mainAxisAlignment: MainAxisAlignment.center,
          //           children: [
          //             GFButton(
          //               onPressed: () {
          //                 _buildBookingDialog(context);
          //               },
          //               icon: Icon(Icons.date_range, color: Colors.white),
          //               text: 'Book an Appointment',
          //               size: 50,
          //               hoverColor: Colors.green,
          //               color: Colors.redAccent,
          //               hoverElevation: 10,
          //               shape: GFButtonShape.standard,
          //             ),
          //             SizedBox(width: 40),
          //             GFButton(
          //                 onPressed: () {
          //                   launch("https://maps.app.goo.gl/Pag6B4CT8yAG4Acp9");
          //                 },
          //                 icon: Icon(Icons.location_on, color: Colors.white),
          //                 text: 'Location',
          //                 size: 50,
          //                 hoverColor: Colors.green,
          //                 splashColor: Colors.orange,
          //                 color: Colors.blueAccent,
          //                 shape: GFButtonShape.standard),
          //             SizedBox(width: 40),
          //             GFButton(
          //               onPressed: () {
          //                 launch('https://wa.me/923022538289');
          //               },
          //               icon: Image.asset('assets/icons/whatsapp.png', width: 20),
          //               text: 'Live Chat',
          //               splashColor: Colors.orange,
          //               color: Colors.green,
          //               hoverColor: Colors.orange,
          //               size: 50,
          //               shape: GFButtonShape.standard,
          //             ),
          //           ],
          //         ),
          //       ],
          //     )),
          // SizedBox(height: 20.0),
          Container(
              padding: EdgeInsets.all(8),
              height: 250,
              width: 600,
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(20)),
                color: Colors.blue[800],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //   book an appointment
                  SizedBox(height: 10.0),
                  InkWell(
                    borderRadius: BorderRadius.circular(10),
                    onTap: () {
                      _buildBookingDialog(context);
                    },
                    child: Column(
                      children: [
                        Icon(
                          Icons.date_range,
                          size: 130,
                          color: Colors.white,
                        ),
                        wText('Date', size: 12, color: Colors.white),
                        SizedBox(height: 30.0),
                        wText("Book an appointment",
                            size: 20, color: Colors.white),
                      ],
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }

  void _buildBookingDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Book an Appointment'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: 'Name',
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Email',
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Phone',
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Message',
                ),
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Submit'),
            ),
          ],
        );
      },
    );
  }
}
