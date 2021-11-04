import 'dart:math';

import 'package:flutter/material.dart';
import 'package:rumah_sidoarjo/home.dart';
import 'package:rumah_sidoarjo/lupapassword.dart';
import 'package:rumah_sidoarjo/register.dart';
import 'custom_template.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';
import 'package:getwidget/getwidget.dart';

class LoginPage extends StatefulWidget {
  static String routeName = "/login";
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _rememberMe = (false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: White,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
              ),
              Container(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 120.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      _icLogin(),
                      SizedBox(height: 33.0),
                      _buildUsername(),
                      _buildPasswordTF(),
                      Row(
                        children: [
                          _buildRememberMeCheckbox(),
                          _buildLupaPasswordBtn(),
                        ],
                      ),
                      _buildLoginBtn(),
                      SizedBox(
                        height: 50.0,
                      ),
                      _buildtextdaftar(),
                      SizedBox(
                        height: 10,
                      ),
                      _buildDaftarBtn(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _icLogin() {
    return Column(
      children: <Widget>[
        Image.asset(
          'assets/images/logo_sidoarjo.png',
          width: 104,
          height: 97,
        ),
        Text(
          'RUMAH SIDOARJO',
          style: GoogleFonts.bebasNeue(
            fontSize: 24,
            color: darkGreen,
            letterSpacing: 3,
          ),
        ),
        Text(
          'Informasi Seputar Kabupaten Sidoarjo',
          style: GoogleFonts.aBeeZee(
            fontSize: 12,
            color: Color(0xff8F8E8E),
          ),
        ),
      ],
    );
  }

  Widget _buildUsername() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 50.0,
          child: TextField(
            style: TextStyle(
              color: darkGrey,
              fontFamily: 'DMSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.all(10),
              hintText: 'Username',
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
        SizedBox(height: 20.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 50.0,
          child: TextField(
            obscureText: true,
            style: TextStyle(
              color: darkGrey,
              fontFamily: 'DMSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.all(10),
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

  Widget _buildLupaPasswordBtn() {
    return Container(
      alignment: Alignment.centerRight,
      child: FlatButton(
        onPressed: () => {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) {
                return LupaPassword();
              },
            ),
          ),
        },
        padding: EdgeInsets.only(left: 95, right: 0.0),
        child: Text(
          'Lupa Password?',
          style: TextStyle(
            color: darkOrange,
            fontFamily: 'DMSans',
          ),
        ),
      ),
    );
  }

  Widget _buildRememberMeCheckbox() {
    return Container(
      height: 20.0,
      child: Row(
        children: <Widget>[
          Theme(
            data: ThemeData(unselectedWidgetColor: lightGrey),
            child: Checkbox(
              value: _rememberMe,
              checkColor: darkGreen,
              activeColor: White,
              onChanged: (value) {
                setState(() {
                  _rememberMe = true;
                });
              },
            ),
          ),
          Text(
            'Ingat Saya',
            style: TextStyle(
              color: Color(0xffA6A6A6),
              fontWeight: FontWeight.bold,
              fontFamily: 'DMSans',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoginBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 4.0,
        onPressed: () => {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
            return Home();
          }))
        },
        padding: EdgeInsets.all(10.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: lightGreen,
        child: Text(
          'LOGIN',
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

  Widget _buildDaftarBtn() {
    return Container(
      width: double.infinity,
      child: RaisedButton(
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
        padding: EdgeInsets.all(10.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            30.0,
          ),
        ),
        color: White,
        child: Text(
          'Daftar',
          style: TextStyle(
            color: lightGreen,
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'DMSans',
          ),
        ),
      ),
    );
  }

  Widget _buildtextdaftar() {
    return GestureDetector(
      onTap: () => print('Sign Up Button Pressed'),
      child: Padding(
        padding: const EdgeInsets.only(
          top: 40.0,
        ),
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Belum punya akun? ',
                style: TextStyle(
                  color: Color(0xffA6A6A6),
                  fontSize: 18.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
