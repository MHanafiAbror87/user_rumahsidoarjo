import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'custom_template.dart';
import 'package:google_fonts/google_fonts.dart';

class Tagihan extends StatefulWidget {
  static String routeName = "/tagihan";
  @override
  _TagihanState createState() => _TagihanState();
}

class _TagihanState extends State<Tagihan> {
  bool _syarat = (false);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: appBar(),
        body: Container(
          child: ListView(
            children: [
              Center(
                child: Column(
                  children: [
                    _headerPage(),
                    _buildPLN(),
                    _buildPDAM(),
                    _buildPBB(),
                    _buildTELKOM(),
                  ],
                ),
              )
            ],
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
        onPressed: () => {},
      ),
      title: Text('Tagihan'),
      backgroundColor: darkGreen1,
    );
  }

  Container _headerPage() {
    return Container(
      height: 158,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [lightGreen, darkGreen1],
              end: Alignment.centerRight,
              begin: Alignment.centerLeft),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30))),
      child: Column(
        children: [
          SizedBox(height: 30),
          Text(
            'Tagihan',
            style: TextStyle(
                color: White,
                fontSize: 30,
                letterSpacing: 2,
                fontWeight: FontWeight.bold,
                fontFamily: 'DMSans'),
          ),
          Center(
            child: Container(
              width: 330,
              child: Text(
                'Ayo cari tahu jumlah tagihan anda dan jangan lupa untuk membayar tepat waktu',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: White,
                    fontSize: 15,
                    letterSpacing: 2,
                    fontFamily: 'DMSans'),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPLN() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 4.0,
        onPressed: () => {},
        padding: EdgeInsets.all(10.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              Text(
                'PLN',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.black,
                  letterSpacing: 2,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'DMSans',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 259),
                child: Icon(Icons.play_arrow),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPDAM() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 4.0,
        onPressed: () => {},
        padding: EdgeInsets.all(10.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              Text(
                'PDAM',
                style: TextStyle(
                  color: Colors.black,
                  letterSpacing: 2,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'DMSans',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 242),
                child: Icon(Icons.play_arrow),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPBB() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 4.0,
        onPressed: () => {},
        padding: EdgeInsets.all(10.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              Text(
                'PBB',
                style: TextStyle(
                  color: Colors.black,
                  letterSpacing: 2,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'DMSans',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 260),
                child: Icon(Icons.play_arrow),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTELKOM() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 4.0,
        onPressed: () => {},
        padding: EdgeInsets.all(10.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              Text(
                'TELKOM',
                style: TextStyle(
                  color: Colors.black,
                  letterSpacing: 2,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'DMSans',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 222),
                child: Icon(Icons.play_arrow),
              )
            ],
          ),
        ),
      ),
    );
  }
}
