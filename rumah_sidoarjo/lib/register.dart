import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'custom_template.dart';
import 'package:google_fonts/google_fonts.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool _syarat = (false);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.arrow_back_ios),
          title: Text('Form Pendaftaran'),
          backgroundColor: darkGreen1,
        ),
        body: Container(
          child: ListView(
            children: [
              Center(
                child: Column(
                  children: [
                    _headerPage(),
                    _buildNIK(),
                    _buildNamaLengkap(),
                    _buildPasswordTF(),
                    _buildNoTelp(),
                    _buildEmail(),
                    SizedBox(height: 10),
                    _buildSKCheckbox(),
                    SizedBox(
                      height: 10,
                    ),
                    _buildDaftarBtn(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
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
          // SizedBox(height: 19),
          Center(
            child: Column(
              children: [
                SizedBox(height: 39),
                Text(
                  'Daftar Akun Baru',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'DMSans',
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: 85,
                      ),
                    ),
                    Text(
                      'Sudah memiliki akun?',
                      style: TextStyle(
                        color: White,
                        fontFamily: 'DMSans',
                        fontSize: 17,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 5),
                    ),
                    Text(
                      "Log In",
                      style: TextStyle(
                          color: White,
                          fontFamily: 'DMSans',
                          fontWeight: FontWeight.bold,
                          fontSize: 17),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNIK() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 20.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 45.0,
          width: 390,
          child: TextField(
            style: TextStyle(
              color: darkGrey,
              letterSpacing: 2,
              fontFamily: 'DMSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(left: 15),
              hintText: 'NIK',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildNamaLengkap() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 15.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 45.0,
          width: 390,
          child: TextField(
            style: TextStyle(
              color: darkGrey,
              letterSpacing: 2,
              fontFamily: 'DMSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(left: 15),
              hintText: 'Nama Lengkap',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 15.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 45,
          width: 390,
          child: TextField(
            obscureText: true,
            style: TextStyle(
              color: darkGrey,
              letterSpacing: 2,
              fontFamily: 'DMSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(left: 15, top: 9),
              hintText: 'Password',
              hintStyle: kHintTextStyle,
              suffixIcon: Icon(
                Icons.visibility_off_outlined,
                color: darkGrey,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildNoTelp() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 15.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 45.0,
          width: 390,
          child: TextField(
            style: TextStyle(
              color: darkGrey,
              letterSpacing: 2,
              fontFamily: 'DMSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(left: 15),
              hintText: 'No. Telp',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildEmail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 15.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 45.0,
          width: 390,
          child: TextField(
            style: TextStyle(
              color: darkGrey,
              letterSpacing: 2,
              fontFamily: 'DMSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(left: 15),
              hintText: 'Email',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSKCheckbox() {
    return Container(
      height: 20.0,
      child: Row(
        children: <Widget>[
          Theme(
            data: ThemeData(unselectedWidgetColor: lightGrey),
            child: Checkbox(
              value: _syarat,
              checkColor: darkGreen,
              activeColor: White,
              onChanged: (value) {
                setState(() {
                  _syarat = true;
                });
              },
            ),
          ),
          Row(
            children: [
              Text(
                'Setujui',
                style: TextStyle(
                  color: Color(0xffA6A6A6),
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                  fontFamily: 'DMSans',
                ),
              ),
              TextButton(
                onPressed: () => print('SK Button Pressed'),
                // padding: EdgeInsets.only(left: 95, right: 0.0),
                child: Text(
                  'Syarat & Ketentuan',
                  style: TextStyle(
                    fontSize: 13,
                    color: darkGreen,
                    fontFamily: 'DMSans',
                  ),
                ),
              ),
              // Text(
              //   'Syarat & Ketentuan',
              //   style: TextStyle(
              //     color: darkGreen,
              //     fontFamily: 'DMSans',
              //     fontSize: 12,
              //     fontWeight: FontWeight.bold,
              //   ),
              // )
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDaftarBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.0),
      width: 390,
      child: RaisedButton(
        elevation: 4.0,
        onPressed: () => print('Daftar Button Pressed'),
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: lightGreen,
        child: Text(
          'Daftar',
          style: TextStyle(
            color: White,
            letterSpacing: 2,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'DMSans',
          ),
        ),
      ),
    );
  }
}
