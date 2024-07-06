// ignore_for_file: prefer_const_constructors , prefer_const_literals_to_create_immutables

import 'package:alfa/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickalert/quickalert.dart';
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
      // backgroundColor: Colors.black,
      key: _scaffoldKey,
      drawer: MyDrawer(),
      // bottomNavigationBar: _buildBottomNavigationBar(),

      body: _buildBody(context),
    );
  }

  _buildBody(BuildContext context) {
    return SafeArea(
      child: AnimatedContainer(
        duration: Duration(seconds: 2),
        decoration: BoxDecoration(
          // image: DecorationImage(
          //   image: AssetImage('assets/images/main.jpg'),
          //   fit: BoxFit.cover,
          // ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildAppBar(context),
              _buildSlideBanner(context),
            ],
          ),
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
      title: wText("IFA's Consultancy"),
      actions: [
        // university
        TextButton(
          onPressed: () {
            QuickAlert.show(
              context: context,
              type: QuickAlertType.info,
              title: 'Universities',
              text:
                  'We provide information about universities and colleges in different countries',
              width: 500,
            );
          },
          child: wText('Universities'),
        ),
        // about
        TextButton(
          onPressed: () {
            QuickAlert.show(
              context: context,
              type: QuickAlertType.info,
              title: 'About Us',
              text:
                  'We are a consulting firm that provides visa assistance to students who want to study abroad',
              width: 500,
            );
          },
          child: wText('About Us'),
        ),
        // whatsapp
        TextButton(onPressed: (){
          launch('https://wa.me/923022538289');
        }, child: wText('Contact Us')),
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
        Stack(
          children: [
            Container(
              height: 300,
              decoration: BoxDecoration(
                // color: Colors.grey[300],
              ),
              child: GFCarousel(
                // width: double.infinity,
                height: 300,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                aspectRatio: 2.0,
                enableInfiniteScroll: true,
                items: hotelsImagesList.map(
                  (url) {
                    return Container(
                      margin: EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AssetImage(url),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ).toList(),
                // paginationType: GFCarouselPaginationType.DOTS,
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
       Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
         children: [
           Column(
             children: [
               _buildHeading(),
               _buildContent(),
             ],
           ),
            Column(
              children: [
                Container(
                  width: 600,
                  height: 400,
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    image: DecorationImage(
                      image: AssetImage('assets/images/mekkah.webp'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  width: 600,
                  height: 390,
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    image: DecorationImage(
                      image: AssetImage('assets/images/dubai.jpeg'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ],
            ),

         ],
       ),
        SizedBox(height: 60.0),
        _buildUniversity(),
        SizedBox(height: 60.0),
        _buildOurService(),
        SizedBox(height: 60.0),
        _buildOurPartners(),
        SizedBox(height: 60.0),
        _buildBottomHeader(),

        SizedBox(height: 60.0),

      //   location
        Container(
          // height: 500,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/icons/map.png'),
              fit: BoxFit.cover,
            ),
          ),
          padding: EdgeInsets.all(8),
          child: GFCard(
            elevation: 10,
            gradient: LinearGradient(
              colors: [Colors.green[100]!, Colors.grey[50]!],
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                wText('Location',
                    size: 25, color: Colors.green[800]),
                aText(
                    'Mezzanine M-1, 6-C Ln. 2, Zamzama Commercial Area Defence V DHA, Karachi City, Sindh 75600',
                    color: Colors.black,
                    size: 16),
                SizedBox(height: 10.0),
                GFButton(
                  onPressed: () {
                    launch("https://maps.app.goo.gl/Pag6B4CT8yAG4Acp9");
                  },
                  text: 'Get Directions',
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
        SizedBox(height: 60.0),
      //   bottom header
        _buildBottomHeading()

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
        child: GFCard(
          elevation: 10,
          gradient: LinearGradient(
            colors: [Colors.green[100]!, Colors.grey[50]!],
          ),

          content: Column(
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
      ),
    );
  }

  _buildContent() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      // child: Container(
      //   padding: EdgeInsets.all(18),
      //   decoration: BoxDecoration(
      //     color: Colors.grey[50],
      //     borderRadius: BorderRadius.only(
      //       bottomLeft: Radius.circular(20),
      //       bottomRight: Radius.circular(20),
      //     ),
      //   ),
      //   width: 600,
      //   height: 400,
      //   child: Column(
      //     mainAxisSize: MainAxisSize.min,
      //     mainAxisAlignment: MainAxisAlignment.start,
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: [
      //       aText('Students will require evidence of:',
      //           size: 18, color: Colors.green[800]),
      //       SizedBox(height: 10.0),
      //       aText('1. Proof of enrolment'),
      //       SizedBox(height: 10.0),
      //       aText(
      //           '2. Proof of financial capacity to cover the cost of travel, course tuition fees and living costs'),
      //       SizedBox(height: 5.0),
      //       aText(
      //           '3. Financial capacity to pay for tuition fees, living costs and travel for the entire period of stay in the country.'),
      //       SizedBox(height: 5.0),
      //       aText('4. English language proficiency.'),
      //       SizedBox(height: 5.0),
      //       aText('5. Overseas student health cover.'),
      //       SizedBox(height: 5.0),
      //       aText('6. Genuine temporary entrant requirement.'),
      //       SizedBox(height: 5.0),
      //       aText('7. Health and character requirements.'),
      //       SizedBox(height: 5.0),
      //       aText('8. Valid six months passport beyond period of stay.'),
      //     ],
      //   ),
      // ),
      child: SizedBox(
        width: 600,
        child: GFCard(
          elevation: 10,
          gradient: LinearGradient(
            colors: [Colors.orange[100]!, Colors.grey[50]!],
          ),
          padding: EdgeInsets.all(18),
          // color: Colors.grey[50],
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
          title: GFListTile(
            title: Text(
              'Students will require evidence of:',
              style: GoogleFonts.aBeeZee(
                fontSize: 18,
                color: Colors.green[800],
              ),
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              aText('1. Proof of enrolment'),
              aText(
                  '2. Proof of financial capacity to cover the cost of travel, course tuition fees and living costs'),
              aText(
                  '3. Financial capacity to pay for tuition fees, living costs and travel for the entire period of stay in the country.'),
              aText('4. English language proficiency.'),
              aText('5. Overseas student health cover.'),
              aText('6. Genuine temporary entrant requirement.'),
              aText('7. Health and character requirements.'),
              aText('8. Valid six months passport beyond period of stay.'),
            ],
          ),
        ),
      )
    );
  }

  _buildContactForm() {
    return Container(
      width: 600,
      padding: EdgeInsets.all(8),
      child: GFAccordion(
        title: 'Contact Us',
        contentBorderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        contentChild: Column(
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
    );
  }

  _buildOurPartners() {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey[100],
          ),
          child: Text(
            'Our Partners',
            style: GoogleFonts.aBeeZee(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.green[800],
            ),
          ),
        ),
        SizedBox(height: 10.0),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GFImageOverlay(
                alignment: Alignment.center,
                height: 200,
                width: 300,
                image: AssetImage('assets/Icons/airplane.jpg'),
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.3), BlendMode.darken),
                child: wText(
                  'Qatar Airways',
                  color: Colors.white,
                ),
              ),
              SizedBox(width: 10.0),
              GFImageOverlay(
                alignment: Alignment.center,
                height: 200,
                width: 300,
                image: AssetImage('assets/Icons/emirates.jpg'),
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.3), BlendMode.darken),
                child: wText(
                  'Emirates Airlines',
                  color: Colors.white,
                ),
              ),
              SizedBox(width: 10.0),
              GFImageOverlay(
                alignment: Alignment.center,
                height: 200,
                width: 300,
                image: AssetImage('assets/Icons/etihad.webp'),
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.3), BlendMode.darken),
                child: wText(
                  'Etihad Airways',
                  color: Colors.white,
                ),
              ),
              // Image.asset(
              //   'assets/Icons/airplane.jpg',
              //   width: 200,
              // ),
              // SizedBox(width: 14.0),
              // Image.asset(
              //   'assets/icons/studentvisa.jpg',
              //   width: 200,
              // ),
              // SizedBox(width: 14.0),
              // Image.asset(
              //   'assets/images/mekkah.webp',
              //   width: 200,
              // ),
              // SizedBox(width: 14.0),
              // Image.asset(
              //   'assets/images/dubai.jpeg',
              //   width: 200,
              // ),
            ],
          ),
        ),
      ],
    );
  }

  _buildBottomHeader() {
    return GFCard(
      elevation: 10,
      gradient: LinearGradient(
        colors: [Colors.blueAccent[100]!, Colors.grey[50]!],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          wText('Book an Appointment',
              size: 25, color: Colors.green[800]),
          aText(
              'Book an appointment with us to get free consultation and guidance',
              color: Colors.black,
              size: 16),
          SizedBox(height: 10.0),
          Container(
            width: 990,
            height: 400,
            decoration: BoxDecoration(
              color: Colors.grey[100],
              image: DecorationImage(
                image: AssetImage('assets/images/booking.png'),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          SizedBox(height: 10.0),
          GFButton(
            onPressed: () {
              _buildBookingDialog(context);
            },
            text: 'Book Now',
            size: 50,
            color: Colors.green,
            hoverColor: Colors.orange,
            splashColor: Colors.green,
            shape: GFButtonShape.standard,
          ),
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

  _buildOurService() {
    return GFCard(
      elevation: 10,
      gradient: LinearGradient(
        colors: [Colors.green[100]!, Colors.grey[50]!],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          wText('Our Services', size: 25, color: Colors.green[800]),
          aText(
              'We provide the following services to our clients for their convenience',
              color: Colors.black,
              size: 16),
          SizedBox(height: 10.0),
          SingleChildScrollView(
            // scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    _buildServiceDialog(context);
                  },
                  child: GFImageOverlay(

                    alignment: Alignment.center,
                    height: 200,
                    width: 300,
                    image: AssetImage('assets/icons/studentvisa.jpg'),
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.3), BlendMode.darken),
                    child: wText(
                      'Student Visa Assistance',
                      color: Colors.white,
                    ),

                  ),
                ),
            // airline Ticket
                GestureDetector(
                  onTap: () {
                    _buildAirlineTicketDialog(context);
                  },
                  child: GFImageOverlay(
                    alignment: Alignment.center,
                    height: 200,
                    width: 300,
                    image: AssetImage('assets/icons/airplane.jpg'),
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.3), BlendMode.darken),
                    child: wText(
                      'Airline Ticket',
                      color: Colors.white,
                    ),
                  ),
                ),
                // Accomodation
                GestureDetector(
                  onTap: () {
                    _buildAccomodationDialog(context);
                  },
                  child: GFImageOverlay(
                    alignment: Alignment.center,
                    height: 200,
                    width: 300,
                    image: AssetImage('assets/icons/accomodation.jpg'),
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.3), BlendMode.darken),
                    child: wText(
                      'Accomodation',
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10.0),
          GFButton(
            onPressed: () {
              _buildServiceDialog(context);
            },
            text: 'View Services',
            size: 50,
            color: Colors.green,
            hoverColor: Colors.orange,
            splashColor: Colors.green,
            shape: GFButtonShape.standard,
          ),
        ],
      ),
    );
  }

  void _buildServiceDialog(BuildContext context) {
    QuickAlert.show(
        context: context,
        type: QuickAlertType.success,
        title: 'Our Services',
        text: 'We provide the following services to our clients for their convenience',
      width: 500,
      widget: Column(
        children: [
          Divider(),
          ListTile(
            title: Text('Student Visa Assistance'),
            subtitle: Text(
                'We provide visa assistance to students who want to study abroad'),
          ),
          ListTile(
            title: wText(""),
            subtitle: Text(
                'Student visa is an validation '
    )
    )
        ],
      )
    );
  }

  void _buildAirlineTicketDialog(BuildContext context) {
    QuickAlert.show(
        context: context,
        type: QuickAlertType.success,
        title: 'Airline Ticket',
        text: 'We provide airline ticket booking services to our clients',
        width: 500,
        widget: Column(
          children: [
            Divider(),
            ListTile(
              title: Text('Airline Ticket'),
              subtitle: Text(
                  'We provide airline ticket booking services to our clients'),
            ),
          ],
        ));
  }

  void _buildAccomodationDialog(BuildContext context) {
    QuickAlert.show(
        context: context,
        type: QuickAlertType.success,
        title: 'Accomodation',
        text: 'We provide accomodation services to our clients',
        width: 500,
        widget: Column(
          children: [
            Divider(),
            ListTile(
              title: Text('Accomodation'),
              subtitle: Text('We provide accomodation services to our clients'),
            ),
          ],
        ));
  }

  _buildUniversity() {
    return GFCard(
      elevation: 10,
      gradient: LinearGradient(
        colors: [Colors.redAccent[100]!, Colors.grey[50]!],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          wText('Universities', size: 25, color: Colors.green[800]),
          aText(
              'We provide information about universities and colleges in different countries',
              color: Colors.black,
              size: 16),

          Container(
            height: 500,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
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
                SizedBox(width: 10),
                Container(
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
                SizedBox(width: 10),
                Container(
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
              ],
            ),
          ),
          GFButton(
            onPressed: () {
              QuickAlert.show(
                context: context,
                type: QuickAlertType.info,
                title: 'Universities',
                text:
                    'We provide information about universities and colleges in different countries',
                width: 500,
              );
            },
            text: 'View Universities',
            size: 50,
            color: Colors.green,
            hoverColor: Colors.orange,
            splashColor: Colors.green,
            shape: GFButtonShape.standard,
          ),
        ],
      ),
    );
  }

  _buildBottomHeading() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.black,
      ),
      child: Column(
        children: [
          wText('Contact Us', size: 25, color: Colors.green[800]),
          _buildContactForm(),
          aText(
              'Contact us for free consultation and guidance about studying abroad',
              color: Colors.white,
              size: 16),
          SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
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
                icon: Icon(Icons.location_on, color: Colors.red),
              ),
              IconButton(
                onPressed: () {
                  launch(
                      'https://www.facebook.com/IFAs-Consultancy-100102002370073' '/');

                },
                icon: Icon(Icons.facebook, color: Colors.blue),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
