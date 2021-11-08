import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rumah_sidoarjo/home.dart';
import 'custom_template.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:getwidget/getwidget.dart';

class Akun extends StatefulWidget {
  static String routeName = '/akun';
  @override
  _AkunState createState() => _AkunState();
}

class _AkunState extends State<Akun> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: White,
        appBar: _appBar(),
        body: Container(
          child: Center(
            child: Column(
              children: [
                _akunimage(),
                _buildInformasiAkun(),
                // _logoutbtn(),
                _buildLogoutBtn(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      leading: FlatButton(
          onPressed: () => {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return Home();
                }))
              },
          child: Icon(
            Icons.arrow_back_ios,
            color: White,
          )),
      title: Text('Akun'),
      backgroundColor: darkGreen1,
    );
  }

  Widget _akunimage() {
    return Container(
      color: White,
      width: double.infinity,
      child: Column(
        children: [
          SizedBox(
            height: 130,
            width: 130,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: CircleAvatar(
                    backgroundImage:
                        AssetImage("assets/images/no_imageakun.png"),
                  ),
                ),
              ],
            ),
          ),
          _tbGantiFoto()
        ],
      ),
    );
  }

  TextButton _tbGantiFoto() {
    return TextButton(
      onPressed: () {},
      child: Text(
        'Ganti Foto',
        style: TextStyle(
          color: darkGreen1,
          fontSize: 16,
          fontFamily: 'DMSans',
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildInformasiAkun() {
    return Container(
      color: White,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    namaAkun(),
                    Padding(
                      padding: const EdgeInsets.only(left: 170, right: 0),
                      child: tbUbah(),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                _space(),
                SizedBox(height: 10),
                email(),
                SizedBox(height: 8),
                _space(),
                SizedBox(height: 10),
                tanggalLahir(),
                SizedBox(height: 8),
                _space(),
                SizedBox(height: 10),
                noTelp(),
                SizedBox(height: 8),
                _space(),
                SizedBox(height: 10),
                nik(),
                SizedBox(height: 8),
                _space(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Column nik() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'NIK',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: "DMSans",
            fontSize: 16,
          ),
        ),
        Text(
          '351510000000000001',
          style: TextStyle(
            fontFamily: "DMSans",
            color: lightGrey,
            fontSize: 16,
          ),
        ),
      ],
    );
  }

  Column noTelp() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'No. Telp',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: "DMSans",
            fontSize: 16,
          ),
        ),
        Text(
          '081234567891',
          style: TextStyle(
            fontFamily: "DMSans",
            color: lightGrey,
            fontSize: 16,
          ),
        ),
      ],
    );
  }

  Column tanggalLahir() {
    return Column(
      children: [
        Text(
          'Tanggal Lahir',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: "DMSans",
            fontSize: 16,
          ),
        ),
        Text(
          '30 04 2000',
          style: TextStyle(
            fontFamily: "DMSans",
            color: lightGrey,
            fontSize: 16,
          ),
        ),
      ],
    );
  }

  TextButton tbUbah() {
    return TextButton(
      onPressed: () {},
      child: Text(
        'Ubah',
        style: TextStyle(
          color: darkGreen1,
          fontSize: 16,
          fontFamily: 'DMSans',
        ),
      ),
    );
  }

  Padding namaAkun() {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Nama Akun',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: "DMSans",
              fontSize: 16,
            ),
          ),
          Text(
            'Muhammad Hanafi',
            style: TextStyle(
              fontFamily: "DMSans",
              color: lightGrey,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Column email() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Email',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: "DMSans",
            fontSize: 16,
          ),
        ),
        Text(
          'E41180749@student.polije.ac.id',
          style: TextStyle(
            fontFamily: "DMSans",
            color: lightGrey,
            fontSize: 16,
          ),
        ),
      ],
    );
  }

  Widget _space() {
    return Container(
      height: 2,
      width: double.infinity,
      color: Color(0xffeeeeee),
    );
  }

  Widget _buildLogoutBtn() {
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Container(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: RaisedButton(
            elevation: 4.0,
            onPressed: () => print('Login Button Pressed'),
            padding: EdgeInsets.all(10.0),
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 3, color: White),
              borderRadius: BorderRadius.circular(30.0),
            ),
            color: Colors.red.shade600,
            child: Text(
              'LOG OUT',
              style: TextStyle(
                color: White,
                letterSpacing: 2,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'DMSans',
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Widget _logoutbtn() {
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(horizontal: 10),
  //     child: GFButton(
  //       onPressed: () {},
  //       text: "Logout",
  //       textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
  //       fullWidthButton: true,
  //       size: GFSize.LARGE,
  //       color: Colors.red.shade600,
  //       shape: GFButtonShape.pills,
  //       borderSide: BorderSide(width: 3, color: White),
  //     ),
  //   );
  // }
}
