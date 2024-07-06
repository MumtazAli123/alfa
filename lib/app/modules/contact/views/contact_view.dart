// ignore_for_file: prefer_const_constructors
import 'package:alfa/global/global.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../widgets/mix_widgets.dart';
import '../../../../widgets/responsive.dart';
import '../controllers/contact_controller.dart';

class ContactView extends GetView<ContactController> {
  const ContactView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.1),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.green,
        onPressed: () {
          launch("https://wa.me/+923022538289");
        },
        label: wText('Whatsapp', color: Colors.white),
        icon: Image.asset('assets/images/whatsapp.png', height: 30),
      ),
      // if mobile view show appbar else hide

      body: _buildBody(),
    );
  }

  _buildBody() {
    return ResponsiveWidget(
      mobiView: _buildMobiView(),
      webView: _buildWebView(),
    );
  }

  _buildHeader() {
    return Container(
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.blue,
        image: DecorationImage(
          image: AssetImage('assets/images/contact.jpeg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: ListTile(
          leading: IconButton(
            icon: CircleAvatar(
              backgroundColor: Colors.black.withOpacity(0.5),
              child: Icon(Icons.arrow_back, color: Colors.white),
            ),
            onPressed: () {
              Get.back();
            },
          ),
        ),
      ),
    );
  }

  _buildBodyContent() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ResponsiveWidget(
        mobiView: Column(
          children: [
            _buildContactCard(
              title: 'Email',
              subtitle: "ifa@gmail.com",
              icon: Icons.email,
            ),
            _buildContactCard(
              title: 'Phone',
              subtitle: "+92 302 253 8289",
              icon: Icons.phone,
            ),
            // whatsapp
            _buildContactCard(
              title: 'Address',
              subtitle:
                  "Mezzanine M-1, 6-C Ln. 2, Zamzama Commercial Area Defence V DHA Karachi, Karachi City, Sindh 75600",
              icon: Icons.location_on,
            ),
          ],
        ),
        webView: Wrap(
          alignment: WrapAlignment.center,
          children: [
            SizedBox(height: 60),
            _buildContactCard(
              title: 'Email',
              subtitle: "ifaweb@gmail.com",
              icon: Icons.email,
            ),

            _buildContactCard(
              title: 'Phone',
              subtitle: "+92 302 253 8289",
              icon: Icons.phone,
            ),

            // whatsapp
            _buildContactCard(
              title: 'Address',
              subtitle: "Mezzanine M-1, 6-C Ln. 2, Zamzama Commercial Area Defence V DHA Karachi, Karachi City, Sindh 75600",
              icon: Icons.location_on,
            ),
            _buildContactCard(
              title: 'Welcome to ifa',
              subtitle: 'We are here to help you. Please feel free to contact us for any query or information. We will be happy to assist you. Our team is available 24/7 to help you.',
              icon: Icons.info,
            ),

            _buildContactCard(
              title: 'Our Services',
              subtitle: 'We provide the best services in the consultancy. We have a team of experts who are always ready to help you. We provide services in the following areas\n'
                  ' 1. Education\n'
                  ' 2. Immigration\n'
                  ' 3. Business\n'
                  ' 4. Investment\n'
                  ' 5. Real Estate\n'
                  ' 6. Travel\n'
                ,
              icon: Icons.info,
            ),

            _buildContactCard(
              title: 'Our Mission',
              subtitle: 'Our mission is to provide the best services to our clients. We are committed to providing the best consultancy services to our clients. We have a team of experts who are always ready to help you. We provide services in the following areas\n'
                  ' 1. Education\n'
                  ' 2. Immigration\n'
                  ' 3. Business\n'
                  ' 4. Investment\n'
                  ' 5. Real Estate\n'
                  ' 6. Travel\n'
                ,
              icon: Icons.info,
            ),





          ],
        ),
      ),
    );
  }

  _buildContactCard(
      {required String title,
      required String subtitle,
      required IconData icon}) {
    return GestureDetector(
      onTap: () {
        if (title == 'Email') {
          launch("mailto:kad.dadu@gmail.com");
        } else if (title == 'Phone') {
          launch("tel://+923022538289");
        } else if (title == 'Address') {
          launch("https://maps.app.goo.gl/Pag6B4CT8yAG4Acp9");
        }
      },
      child: SizedBox(
        width: 500,
        child: Card(
          clipBehavior: Clip.antiAlias,

          child: ListTile(
            leading: Icon(icon),
            title: cText(title, size: 22),
            subtitle: aText(subtitle),
          ),
        ),
      ),
    );
  }

  _buildMobiView() {
    return Column(
      children: [
        _buildHeader(),
        _buildBodyContent(),
      ],
    );
  }

  _buildWebView() {
    return NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              leading: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundColor: Colors.black.withOpacity(0.5),
                  child: IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () {
                      Get.back();
                    },
                  ),
                ),
              ),
              iconTheme: IconThemeData(color: Colors.white),
              backgroundColor: Colors.green,
              expandedHeight: 300,
              floating: true,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                title: wText('Contact Us', color: Colors.white),
                background: Image.asset(
                  'assets/images/contact.jpeg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ];
        },
        body: _buildBodyContent()
    );
  }
}
