import 'package:flutter/material.dart';
import 'package:rumah_sidoarjo/pages/Pengaduan/pengaduan.dart';
import 'package:rumah_sidoarjo/pages/panik_menu/panik_menu.dart';
import 'package:rumah_sidoarjo/pages/syarat.dart';
import 'addregister.dart';
import 'login.dart';
import 'lupapassword.dart';
import 'splash_screen.dart';
import 'akun.dart';
import 'pages/syarat.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  AddRegister.routeName: (context) => const AddRegister(),
  LoginPage.routeName: (context) => const LoginPage(),
  LupaPassword.routeName: (context) => LupaPassword(),
  Akun.routeName: (context) => const Akun(),
  Syarat.routeName: (context) => Syarat(),
  PanikMenu.routeName: (context) => PanikMenu(),
  Pengaduan.routeName: (context) => Pengaduan(),
};
