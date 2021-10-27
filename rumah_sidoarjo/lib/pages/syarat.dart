import 'package:flutter/material.dart';
import 'package:rumah_sidoarjo/custom_template.dart';
import 'package:rumah_sidoarjo/register.dart';
import 'package:flutter/services.dart';
import 'package:rumah_sidoarjo/login.dart';
import 'package:getwidget/getwidget.dart';

class Syarat extends StatefulWidget {
  static String routeName = "/syarat";
  @override
  _SyaratState createState() => _SyaratState();
}

class _SyaratState extends State<Syarat> {
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
                  _sk(),
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
                return Register();
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
    return Container(
      height: 158,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [lightGreen, darkGreen1],
            end: Alignment.centerRight,
            begin: Alignment.centerLeft),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Stack(
        children: <Widget>[
          Center(
            child: Column(
              children: [
                SizedBox(height: 39),
                Text(
                  'Syarat & Ketentuan',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    letterSpacing: 2,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'DMSans',
                  ),
                ),
                Container(
                  width: 330,
                  child: Center(
                    child: Text(
                      'Silahkan membaca syarat & ketentuan secara seksama',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: White,
                        fontFamily: 'DMSans',
                        fontSize: 17,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _sk() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 180,
            horizontal: 20,
          ),
          child: Container(
            child: Text(
              'Data',
              style: TextStyle(fontSize: 18),
            ),
          ),
        ),
      ],
    );
  }
}
