import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rumah_sidoarjo/custom_template.dart';
import 'package:rumah_sidoarjo/home.dart';

class PanikMenu extends StatefulWidget {
  static String routeName = "/panik";
  @override
  _PanikState createState() => _PanikState();
}

class _PanikState extends State<PanikMenu> {
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
        decoration: headerDecoration,
        child: Stack(
          children: <Widget>[
            Center(
              child: Column(
                children: [
                  SizedBox(height: 39),
                  Text(
                    'Panik Menu',
                    style: headerTextStyle,
                  ),
                  Container(
                    width: 330,
                    child: Center(
                      child: Text(
                        'Jangan takut untuk lapor!',
                        textAlign: TextAlign.center,
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
