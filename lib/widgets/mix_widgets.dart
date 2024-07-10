// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables, avoid_print

import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/components/button/gf_button_bar.dart';
import 'package:getwidget/components/card/gf_card.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';
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
    style: GoogleFonts.sail(
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
  image: AssetImage('assets/images/whatsapp.png'),
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

wBuildCard({required String title, IconData? icon, required String image, required Null Function() onTap}) {
  return FlipCard(front: GFCard(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    semanticContainer: true,
    clipBehavior: Clip.antiAliasWithSaveLayer,
    showImage: true,
    colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.darken),

    title: GFListTile(
        title: Text(title),
        subTitle: Text('Explore $title'),
        icon: Icon(icon, color: Colors.red,)
    ),
    image: Image.asset(image, fit: BoxFit.cover, height: 200, width: double.infinity,),
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
  ),
      back: GFCard(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        showImage: true,
        colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.darken),

        title: GFListTile(
            title: Text(title),
            subTitle: Text('Explore $title'),
            icon: Icon(icon, color: Colors.red,)
        ),
        image: Image.asset(image, fit: BoxFit.cover, height: 200, width: double.infinity,),
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
      )
  );
}

wBuildScholarshipCard({required String title, required String image, required Null Function() onTap}) {
  return FlipCard(
      front: GFCard(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        showImage: true,
        colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.darken),

        title: GFListTile(
            title: Text(title),
            subTitle: Text('Scholarship $title'),
            icon: Icon(Icons.school, color: Colors.red,)
        ),
        image: Image.asset(image, fit: BoxFit.cover, height: 200, width: double.infinity,),
        content: Text('Scholarship $title'),
        buttonBar: GFButtonBar(
          children: [
            GFButton(
              onPressed: onTap,
              text: 'Scholarship',
              color: Colors.green,
            ),
          ],
        ),
      ),
      back: GFCard(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        showImage: true,
        colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.darken),

        title: GFListTile(
            title: Text(title),
            subTitle: Text('Scholarship $title'),
            icon: Icon(Icons.school, color: Colors.red,)
        ),
        image: Image.asset(image, fit: BoxFit.cover, height: 200, width: double.infinity,),
        content: Text('Scholarship $title'),
        buttonBar: GFButtonBar(
          children: [
            GFButton(
              onPressed: onTap,
              text: 'Scholarship',
              color: Colors.green,
            ),
          ],
        ),
      )
  );
}

