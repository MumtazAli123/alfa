// ignore_for_file: prefer_const_constructors , prefer_const_literals_to_create_immutables

import 'package:alfa/widgets/mix_widgets.dart';
import 'package:alfa/widgets/my_drawer.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../global/global.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final _email = "kad.dadu@gmail.com";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: MyDrawer(),
      bottomNavigationBar: _buildBottomNavigationBar(),
      body: _buildBody(),
    );
  }

  _buildBody() {
    return SingleChildScrollView(
      controller: controller.scrollController,
      child: SafeArea(
          child: Column(
        children: [
          AppBar(
            centerTitle: false,
            automaticallyImplyLeading: false,
            title: Text(
              "Meer's Consulting",
              style: GoogleFonts.fahkwang(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            actions: [
              // whatsapp
              InkWell(
                onTap: (){
                  launch('https://wa.me/923022538289');
                },
                child: Container(
                  padding: EdgeInsets.all(8),
                  width: 30.0,
                  height: 30.0,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    image: DecorationImage(
                      image: AssetImage('assets/whatsapp.png'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  launch("https://maps.app.goo.gl/Pag6B4CT8yAG4Acp9");
                },
                icon: Icon(Icons.location_on),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.search),
              ),
            ],
          ),
          Container(
            height: 70,
            decoration: BoxDecoration(
              color: Colors.grey[900],
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(
                            'Study Destinations',
                            style: GoogleFonts.daiBannaSil(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Spacer(),
                          Text(
                            'More',
                            style: GoogleFonts.daiBannaSil(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          IconButton(
                              onPressed: () {
                                _scaffoldKey.currentState?.openDrawer();
                              },
                              icon: Icon(
                                Icons.menu,
                                size: 30,
                              ),
                              color: Colors.white),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          //   slide banner here

          _buildSlideBanner(),
          SizedBox(height: 20.0),
          _buildHeading(),
          SizedBox(height: 20.0),
          _buildContent(),
          SizedBox(height: 20.0),
          _buildContactForm(),
          SizedBox(height: 20.0),
          _buildOurPartners(),
          SizedBox(height: 20.0),
        //   bottom header bar here
          _buildBottomHeader()
        ],
      )),
    );
  }

  _buildHeading() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          wText('Student Visa Assistance', size: 25, color: Colors.green[800]),
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
    );
  }

  _buildContent() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
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
    );
  }

  _buildContactForm() {
    return Container(
      // height: 200,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
        padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                'Interested in studying abroad with HS?\n'
                    "Enter your details below and we'll call you back when it suits you.",
                style: GoogleFonts.aBeeZee(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 10.0),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Color(0xffdccdf0),
                  ),
                ),
                hintText: 'Name',
              ),
            ),
            SizedBox(height: 10.0),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Color(0xffdccdf0),
                  ),
                ),
                hintText: 'Email',
              ),
            ),
            SizedBox(height: 10.0),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Color(0xffdccdf0),
                  ),
                ),
                hintText: 'Phone',
              ),
            ),
            SizedBox(height: 10.0),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Color(0xffdccdf0),
                  ),
                ),
                hintText: 'Message',
              ),
            ),
            SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: () {},
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }

  _buildBottomNavigationBar() {
    return Row(
      children: [
        Expanded(
          child: InkWell(
            onTap: () {
              launch('https://wa.me/923022538289');
            },
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.green,
                    Colors.lightGreen,
                    Colors.green,
                  ],
                ),
              ),
              child: Center(
                child: Text(
                  'Live Chat',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: InkWell(
            onTap: () {
            //   call
              launch('tel:+923022538289');
            },
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.orange,
                    Colors.red,
                    Color(0xffdc143c),
                  ],
                ),
              ),
              child: Center(
                  child: wText(
                'ENQUIRE',
                size: 25,
                color: Colors.white,
              )),
            ),
          ),
        ),
      ],
    );
  }

  _buildSlideBanner() {
    return Container(
      // hotelsImagesList.length > 0
      height: 200,
      decoration: BoxDecoration(
        color: Colors.grey[300],
      ),
      child: CarouselSlider(
        options: CarouselOptions(
          height: 200,
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
    return GestureDetector(
      onTap: () {
        _buildBookingDialog(Get.context!);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: EdgeInsets.all(8),
          height: 300,
          width: double.infinity,

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.blue[800],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            //   book an appointment
              Container(
                height: 50,
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  'Book an Appointment',
                  style: GoogleFonts.aBeeZee(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            //   icon Date
              SizedBox(height: 10.0),
              InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: () {
                  _buildBookingDialog(Get.context!);
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
                    wText("Book an appointment", size: 20, color: Colors.white),

                  ],
                ),
              ),

            ],
          )
        ),
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
