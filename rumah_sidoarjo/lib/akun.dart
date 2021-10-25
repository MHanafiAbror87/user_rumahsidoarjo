import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'custom_template.dart';
import 'package:google_fonts/google_fonts.dart';

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
        appBar: _appBar(),
        body: Container(
          child: ListView(
            children: [
              Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 25,
                    ),
                    _akunimage(),
                    _buildInformasiAkun(),
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
      leading: Icon(Icons.arrow_back_ios),
      title: Text('Akun'),
      backgroundColor: darkGreen1,
    );
  }

  Widget _akunimage() {
    return Column(
      children: [
        SizedBox(
          height: 130,
          width: 130,
          child: Stack(
            fit: StackFit.expand,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage("assets/images/no_imageakun.png"),
              ),
            ],
          ),
        ),
        TextButton(
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
        )
      ],
    );
  }

  Widget _buildInformasiAkun() {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Column(
                children: [
                  Text(
                    'Muhammad Hanafi Abror',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'DMSans',
                    ),
                  ),
                  Text(
                    'E4118074@student.polije.ac.id',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontFamily: 'DMSans',
                      fontSize: 16,
                      color: lightGrey,
                    ),
                  )
                ],
              ),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    'Ubah',
                    style: TextStyle(
                      color: darkGreen1,
                      fontSize: 16,
                      fontFamily: 'DMSans',
                    ),
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
