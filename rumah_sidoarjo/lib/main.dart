import 'package:flutter/material.dart';
import 'package:rumah_sidoarjo/detail_lowongankerja.dart';
import 'package:rumah_sidoarjo/home.dart';
import 'package:rumah_sidoarjo/lowongankerja.dart';
import 'package:rumah_sidoarjo/pages/Syarat.dart';
import 'package:rumah_sidoarjo/akun.dart';
import 'package:rumah_sidoarjo/beritainformasi.dart';
import 'package:rumah_sidoarjo/login.dart';
import 'package:rumah_sidoarjo/lupapassword.dart';
import 'package:rumah_sidoarjo/pages/pariwisata/pusatinformasi.dart';
import 'package:rumah_sidoarjo/pages/syarat.dart';
import 'package:rumah_sidoarjo/pariwisata.dart';
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
      home: PusatInformasi(),
      // We use routeName so that we dont need to remember the name
      // initialRoute: SplashScreen.routeName,
      routes: routes,
    );
  }
}
