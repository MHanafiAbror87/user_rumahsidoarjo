import 'package:flutter/material.dart';
import 'package:rumah_sidoarjo/akun.dart';
import 'package:rumah_sidoarjo/login.dart';
import 'package:rumah_sidoarjo/lupapassword.dart';
import 'package:rumah_sidoarjo/register.dart';
import 'package:rumah_sidoarjo/splash_screen.dart';
import 'package:rumah_sidoarjo/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(),
      // home: SplashScreen(),
      // We use routeName so that we dont need to remember the name
      initialRoute: SplashScreen.routeName,
      routes: routes,
    );
  }
}
