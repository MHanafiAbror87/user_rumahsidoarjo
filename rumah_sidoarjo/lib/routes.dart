import 'package:flutter/material.dart';
import 'register.dart';
import 'login.dart';
import 'lupapassword.dart';
import 'splash_screen.dart';
import 'akun.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  Register.routeName: (context) => Register(),
  LoginPage.routeName: (context) => LoginPage(),
  LupaPassword.routeName: (context) => LupaPassword(),
  Akun.routeName: (context) => Akun(),
};
