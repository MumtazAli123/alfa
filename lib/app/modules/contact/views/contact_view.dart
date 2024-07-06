// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../widgets/mix_widgets.dart';
import '../controllers/contact_controller.dart';

class ContactView extends GetView<ContactController> {
  const ContactView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.green,
        onPressed: () {
          launch("https://wa.me/+923022538289");
        },
        label: wText('Whatsapp', color: Colors.white),
        icon: Image.asset('assets/images/whatsapp.png', height: 30),
      ),
      appBar: AppBar(
        title: Text('Contact Us'),
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
      height: 200,
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
          child: Text(
            'Contact Us',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
            ),
          ),
        ),
      ),
    );
  }

  _buildBodyContent() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
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
            subtitle: "Mezzanine M-1, 6-C Ln. 2, Zamzama Commercial Area Defence V DHA Karachi, Karachi City, Sindh 75600",
            icon: Icons.location_on,
          ),
        ],
      ),
    );
  }

  _buildContactCard({required String title, required String subtitle, required IconData icon}) {
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
      child: Card(
        child: ListTile(
          leading: Icon(icon),
          title: Text(title),
          subtitle: Text(subtitle),
        ),
      ),
    );
  }
}
