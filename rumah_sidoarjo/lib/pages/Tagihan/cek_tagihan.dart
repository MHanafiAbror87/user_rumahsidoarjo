import 'package:flutter/material.dart';
import 'package:rumah_sidoarjo/custom_template.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rumah_sidoarjo/home.dart';
import 'package:rumah_sidoarjo/tagihan.dart';

class CekTagihan extends StatefulWidget {
  @override
  _cekState createState() => _cekState();
}

class _cekState extends State<CekTagihan> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey.shade300,
        appBar: appBar(),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: Column(
              children: [
                _buildIdPelanggan(),
                SizedBox(
                  height: 20,
                ),
                _buildBtn(),
              ],
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
      title: Text('Cek Tagihan'),
      backgroundColor: darkGreen1,
    );
  }

  Widget _buildIdPelanggan() {
    return Column(
      children: <Widget>[
        SizedBox(height: 10.0),
        Container(
          decoration: kBoxDecorationStyle,
          height: 50.0,
          child: TextField(
            textAlign: TextAlign.center,
            style: TextStyle(
              color: darkGrey,
              fontFamily: 'DMSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.all(10),
              hintText: 'ID Pelanggan',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      width: 330,
      child: RaisedButton(
        elevation: 4.0,
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
        padding: EdgeInsets.all(10.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: lightGreen,
        child: Text(
          'Cek Tagihan',
          style: TextStyle(
            color: White,
            letterSpacing: 2,
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'DMSans',
          ),
        ),
      ),
    );
  }
}
