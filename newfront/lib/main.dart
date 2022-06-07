import 'package:newfront/Pages/HomePage.dart';
import 'package:newfront/Pages/SignIn.dart';
import 'package:newfront/Profile/MainProfile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Pages/LoadingPage.dart';
import 'Pages/WelcomePage.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: SignInPage());
  }
}
