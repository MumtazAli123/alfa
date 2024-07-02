// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables, avoid_print

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';


bool isLoading = false;
wText(String text, { Color? color, double size = 16}) {
  return Text(
    textAlign: TextAlign.center,
    text,
    style: GoogleFonts.gabriela(
      fontSize: size,
      fontWeight: FontWeight.bold,
      color: color,
    ),
  );
}
eText(String s, {required Color color}) {
  return Text(
    s,
    style: TextStyle(color: color),
  );
}

aText(String text, { Color? color, double size = 16}) {
  return Text(
    textAlign: TextAlign.start,
    text,
    style: GoogleFonts.aBeeZee(
      fontSize: size,
      fontWeight: FontWeight.w400,
      color: color,
    ),
  );
}

wTitleMedium({required String title, required String subtitle}) {
  return Column(
    children: [
      Text(
        title,
        style:  GoogleFonts.daiBannaSil(
            fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
      ),
      const SizedBox(
        height: 10,
      ),
      Text(
        subtitle,
        style: const TextStyle(
          fontSize: 14,
          color: Colors.white,
        ),
      ),
    ],
  );
}

wCustomButton({required int width, required String text, required IconData icon, required Null Function() onPressed}) {
  return Container(
    width: width.toDouble(),
    padding: const EdgeInsets.all(10),
    child: ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.white, size: 20),
          const SizedBox(
            width: 10,
          ),
          wText(text, color: Colors.white),
        ],
      ),
    ),
  );
}

wAppLoading(BuildContext context) {
  return const SimpleDialog(
    children: [
      Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(
              width: 10,
            ),
            Text("Uploading..."),
          ],
        ),
      ),
    ],
  );
}

wLinearProgressBar(BuildContext context) {
  return const LinearProgressIndicator(
    backgroundColor: Colors.red,
  );
}

cText(String text, { Color? color, double size = 16}) {
  return Text(
    textAlign: TextAlign.start,
    text,
    style: GoogleFonts.paprika(
      fontSize: size,
      fontWeight: FontWeight.bold,
      color: color,
    ),
  );
}

wButton(String text, {Color? color, double size = 16, Function()? onPressed}) {
  return GestureDetector(
    onTap: onPressed,
    child: isLoading
        ? const CircularProgressIndicator()
        : Container(
      alignment: Alignment.center,
           width: 250,
            height: 50,
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(10),
            ),
            child: wText(
              text,
              color: Colors.white,
              size: 20,
            ),
          ),
  );
}

urlLauncher(String imgPath, String url) {
  return Container(
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
    child: GestureDetector(
      onTap: () async {
        if (await canLaunch(url)) {
          await launch(url);
        } else {
          print('Could not launch $url');
        }
      },
      child: Column(
        children: [
          Image.asset(
            imgPath,
            width: 30,
            height: 30,
          ),
        ],
      ),
    ),
  );
}