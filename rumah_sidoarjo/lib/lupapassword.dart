import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:rumah_sidoarjo/login.dart';
import 'custom_template.dart';

class LupaPassword extends StatefulWidget {
  static String routeName = "/lupapassword";
  @override
  _LupaPasswordState createState() => _LupaPasswordState();
}

class _LupaPasswordState extends State<LupaPassword> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: _appBar(),
        body: Container(
          child: ListView(
            children: [
              Center(
                child: Column(
                  children: [
                    _headerPage(),
                    _buildEmail(),
                    SizedBox(
                      height: 30,
                    ),
                    _buildKirimBtn(context),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  AppBar _appBar() {
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
      title: Text('Lupa Password'),
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
          Column(
            children: [
              SizedBox(height: 30),
              Align(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Text(
                        'Lupa Password?',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'DMSans',
                        ),
                      ),
                      Text(
                        'Silahkan masukkan email Anda untuk mendapatkan tautan atur ulang password',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: White,
                          fontFamily: 'DMSans',
                          fontSize: 17,
                        ),
                      ),
                    ],
                  )),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildEmail() {
    return Column(
      children: <Widget>[
        SizedBox(height: 50.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            decoration: kBoxDecorationStyle,
            width: double.infinity,
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
        ),
      ],
    );
  }

  Widget _buildKirimBtn(BuildContext context) {
    return TextButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Sukses'),
          content: const Text('Silahkan cek email Anda'),
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
              child: const Text('OK'),
            ),
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Container(
          // height: 50,
          padding: EdgeInsets.all(10.0),
          width: double.infinity,
          child: Text(
            'Kirim',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, color: White),
          ),
          decoration: BoxDecoration(
              color: lightGreen, borderRadius: BorderRadius.circular(30.0)),
        ),
      ),
      // const Text(
      //   'Kirim',
      //   style: TextStyle(fontSize: 20),
      // ),
    );
  }
}
