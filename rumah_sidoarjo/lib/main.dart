import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rumah_sidoarjo/addregister.dart';
import 'package:rumah_sidoarjo/pages/pariwisata/pariwisata.dart';
import 'package:rumah_sidoarjo/pages/umkm/umkm.dart';
import 'package:rumah_sidoarjo/splash_screen.dart';
import 'package:rumah_sidoarjo/routes.dart';
import 'package:http/http.dart' as http;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(),
      // home: addRegister(),
      // We use routeName so that we dont need to remember the name
      initialRoute: SplashScreen.routeName,
      routes: routes,
    );
  }
}
