// © Vishwas Kumar

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'intro_screen/intro.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

int? isviewed;
Future <void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  isviewed = prefs.getInt('Introduction');
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360,690),
      builder:()=> MaterialApp(
        debugShowCheckedModeBanner: false,
        home: isviewed != 0 ? Introduction() : LoginScreen(),
      ),
    );
  }
}

