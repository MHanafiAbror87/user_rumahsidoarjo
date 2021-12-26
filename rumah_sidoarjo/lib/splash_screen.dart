import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rumah_sidoarjo/helper/session_helper.dart';
import 'package:rumah_sidoarjo/home.dart';
import 'package:rumah_sidoarjo/login.dart';
import 'custom_template.dart';

class SplashScreen extends StatefulWidget {
  static String routeName = "/splash";
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 2000), () async {
      // final isLogin = await SessionHelper.checkisLogin();

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Home(),
        ),
      );
      // if (isLogin) {
      // } else {
      //   Navigator.pushReplacement(
      //     context,
      //     MaterialPageRoute(
      //       builder: (context) => LoginPage(),
      //     ),
      //   );
      // }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: White,
      body: Center(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.all(100.0)),
            Image.asset(
              'assets/images/logo_sidoarjo.png',
              width: 146,
              height: 136,
            ),
            Padding(padding: EdgeInsets.only(top: 43.0)),
            Text(
              'RUMAH SIDOARJO',
              style: GoogleFonts.bebasNeue(
                color: darkGreen,
                fontSize: 36.0,
                // letterSpacing: 2,
              ),
            ),
            Text(
              'Informasi Seputar Kabupaten Sidoarjo',
              style: GoogleFonts.aBeeZee(
                color: Color(0xff8F8E8E),
                fontSize: 18.0,
              ),
            ),
            Spacer(),
            // Padding(
            //   padding: EdgeInsets.only(
            //     bottom: 0.0,
            //   ),
            // ),
            SafeArea(
              top: true,
              bottom: true,
              left: true,
              right: true,
              child: Image.asset(
                'assets/images/bg_splash.png',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
