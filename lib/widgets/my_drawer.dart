// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../app/modules/home/controllers/home_controller.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.black,
            ),
            child: Column(
              children: [
                Flexible(
                  child: CircleAvatar(
                    radius: 50,
                    // image.asset('assets/icons/meerLogo.jpg'),
                    backgroundImage: Image.asset('assets/icons/meerLogo.png').image,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Qaiser Rasheed ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.home,
              color: Colors.black,
            ),
            title: Text(
              'Home',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            onTap: () {
              // setState(() {
              //   index = 0;
              // });
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.location_on,
              color: Colors.black,
            ),
            title: Text(
              'Study Destinations',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            onTap: () {
              Get.toNamed('/study');
            },
          ),
          ListTile(
            leading: Icon(
              Icons.school,
              color: Colors.black,
            ),
            title: Text(
              'Universities',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            onTap: () {
              Get.toNamed('/universities');
            },
          ),
          ListTile(
            leading: Icon(
              Icons.info,
              color: Colors.black,
            ),
            title: Text(
              'About Us',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            onTap: () {
              Get.toNamed('/about');
            },
          ),
          ListTile(
            leading: Icon(
              Icons.contact_mail,
              color: Colors.black,
            ),
            title: Text(
              'Contact Us',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            onTap: () {
              Get.toNamed('/contact');

            },
          ),
        ],
      ),
    );
  }
}
