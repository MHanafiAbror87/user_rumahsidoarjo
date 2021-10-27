import 'package:flutter/material.dart';
import 'package:rumah_sidoarjo/pages/syarat.dart';
import 'register.dart';
import 'login.dart';
import 'lupapassword.dart';
import 'splash_screen.dart';
import 'akun.dart';
import 'pages/syarat.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  Register.routeName: (context) => Register(),
  LoginPage.routeName: (context) => LoginPage(),
  LupaPassword.routeName: (context) => LupaPassword(),
  Akun.routeName: (context) => Akun(),
  Syarat.routeName: (context) => Syarat(),
};
