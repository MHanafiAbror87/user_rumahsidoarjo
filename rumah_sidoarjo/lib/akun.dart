import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rumah_sidoarjo/home.dart';
import 'package:rumah_sidoarjo/login.dart';
import 'custom_template.dart';

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
        body: ListView(
          children: [
            _akunimage(),
            SizedBox(height: 50),
            _buildInformasiAkun(),
            SizedBox(height: 50),
            _buildLogoutBtn(),
          ],
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
      title: Text('Informsi Akun'),
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
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      namaAkun(),
                      tbUbah(),
                    ],
                  ),
                ),
                _space(),
                SizedBox(height: 15),
                email(),
                _space(),
                SizedBox(height: 15),
                tanggalLahir(),
                _space(),
                SizedBox(height: 15),
                noTelp(),
                _space(),
                SizedBox(height: 15),
                nik(),
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
}
