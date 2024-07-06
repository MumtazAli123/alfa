import 'dart:io';


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


SharedPreferences? sharedPreferences;

final FirebaseAuth fAuth = FirebaseAuth.instance;
User? currentUser;
// UserModel? userModelCurrentInfo;
String? dbRef;
String? uid;

// DirectionDetailsInfo? tripDirectionDetailsInfo; // for driversKey info list


Platform platform =
    (Platform.isIOS ? TargetPlatform.iOS : TargetPlatform.android) as Platform;

// locally database platform sharedPreferences, NSUserDefaults key ios and android platform name


final hotelsImagesList = [
  "assets/images/mekkah.webp",
  "assets/images/popular_2.jpg",
  "assets/images/popular_3.jpg",
  "assets/images/popular_4.jpg",
  "assets/images/popular_5.jpg",
  "assets/images/umrah.jpeg",
];

final List<String> hotelsNamesList = [
  "Hotel 0",
  "Hotel 1",
  "Hotel 2",
  "Hotel 3",
  "Hotel 4",
  "Hotel 5",
];

final itemsList = [
  "assets/slider/0.jpg",
  "assets/slider/1.jpg",
  "assets/slider/2.jpg",
  "assets/slider/3.jpg",
  "assets/slider/4.jpg",
  "assets/slider/5.jpg",
  "assets/slider/6.jpg",
  "assets/slider/7.jpg",
  "assets/slider/8.jpg",
  "assets/slider/9.jpg",
  "assets/slider/10.jpg",
  "assets/slider/11.jpg",
  "assets/slider/12.jpg",
  "assets/slider/13.jpg",

];

// CartMethods cartMethods = CartMethods();

double countStarsRating = 0.0;
String titleStarsRating = "";
