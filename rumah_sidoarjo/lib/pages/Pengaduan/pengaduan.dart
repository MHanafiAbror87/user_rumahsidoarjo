import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rumah_sidoarjo/custom_template.dart';
import 'package:rumah_sidoarjo/home.dart';

class Pengaduan extends StatefulWidget {
  static String routeName = "/pengaduan";
  @override
  _PengaduanState createState() => _PengaduanState();
}

class _PengaduanState extends State<Pengaduan> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: appBar(),
        body: Scaffold(
          backgroundColor: White,
          body: AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle.light,
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Stack(
                children: <Widget>[
                  SingleChildScrollView(
                    physics: AlwaysScrollableScrollPhysics(),
                    padding: EdgeInsets.symmetric(
                      horizontal: 40.0,
                      vertical: 120.0,
                    ),
                  ),
                  _headerPage(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      elevation: 0,
      leading: FlatButton(
        child: Icon(
          Icons.arrow_back_ios,
          color: White,
        ),
        onPressed: () => {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) {
                return Home();
              },
            ),
          ),
        },
      ),
      title: Text('Syarat & Ketentuan'),
      backgroundColor: darkGreen1,
    );
  }

  Widget _headerPage() {
    return Expanded(
      child: Container(
        height: 158,
        width: double.infinity,
        decoration: headerDecoration,
        child: Stack(
          children: <Widget>[
            Center(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                  ),
                  Text(
                    'Pengaduan',
                    style: headerTextStyle,
                  ),
                  Container(
                    width: 350,
                    child: Center(
                      child: Text(
                        'Ayo adukan kerusakan fasilitas publik di lingkungan Anda agar segera mendapatkan penanganan dari dinas terkait',
                        textAlign: TextAlign.justify,
                        style: headerSubTextStyle,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
