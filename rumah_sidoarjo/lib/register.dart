import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rumah_sidoarjo/login.dart';
import 'package:rumah_sidoarjo/pages/syarat.dart';
import 'custom_template.dart';
import 'package:google_fonts/google_fonts.dart';

class Register extends StatefulWidget {
  static String routeName = "/register";
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
        appBar: appBar(),
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
                      height: 20,
                    ),
                    _buildDaftarBtn(context),
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
        onPressed: () => {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) {
                return LoginPage();
              },
            ),
          ),
        },
      ),
      title: Center(
        child: Text('Form Pendaftaran'),
      ),
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
                    TextButton(
                      onPressed: () => {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return LoginPage();
                            },
                          ),
                        ),
                      },
                      // padding: EdgeInsets.only(left: 95, right: 0.0),
                      child: Text(
                        'Log In',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: White,
                          fontFamily: 'DMSans',
                        ),
                      ),
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
      height: 40.0,
      child: Row(
        children: <Widget>[
          Theme(
            data: ThemeData(unselectedWidgetColor: lightGrey),
            child: Checkbox(
              value: _syarat,
              checkColor: White,
              activeColor: darkGreen,
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
                onPressed: () => {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return Syarat();
                      },
                    ),
                  ),
                },
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
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDaftarBtn(BuildContext context) {
    return TextButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Sukses'),
          content: const Text('Silahkan Log In'),
          actions: <Widget>[
            TextButton(
              onPressed: () => {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginPage();
                    },
                  ),
                ),
              },
              child: const Text('Log In'),
            ),
          ],
        ),
      ),
      child: Container(
        height: 50,
        padding: EdgeInsets.all(12.0),
        width: double.infinity,
        child: Text(
          'Daftar',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: White,
            letterSpacing: 2,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'DMSans',
          ),
        ),
        decoration: BoxDecoration(
          color: lightGreen,
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
    );
  }
}
