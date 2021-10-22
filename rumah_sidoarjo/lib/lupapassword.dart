import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'custom_template.dart';
import 'package:google_fonts/google_fonts.dart';

class LupaPassword extends StatefulWidget {
  @override
  _LupaPasswordState createState() => _LupaPasswordState();
}

class _LupaPasswordState extends State<LupaPassword> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.arrow_back_ios),
          title: Text('Lupa Password'),
          backgroundColor: darkGreen1,
        ),
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 50.0),
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

  Widget _buildKirimBtn(BuildContext context) {
    return TextButton(
        onPressed: () => showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                title: const Text('Sukses'),
                content: const Text('Silahkan cek email Anda'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'OK'),
                    child: const Text('OK'),
                  ),
                ],
              ),
            ),
        child: Container(
          height: 50,
          padding: EdgeInsets.all(12.0),
          width: double.infinity,
          child: Text(
            'Kirim',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, color: White),
          ),
          decoration: BoxDecoration(
              color: lightGreen, borderRadius: BorderRadius.circular(30.0)),
        )
        // const Text(
        //   'Kirim',
        //   style: TextStyle(fontSize: 20),
        // ),

        );
  }
}
