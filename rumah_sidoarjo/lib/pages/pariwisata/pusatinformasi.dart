import 'package:flutter/material.dart';
import 'package:rumah_sidoarjo/custom_template.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rumah_sidoarjo/pariwisata.dart';

class PusatInformasi extends StatefulWidget {
  @override
  _PusatInformasiState createState() => _PusatInformasiState();
}

class _PusatInformasiState extends State<PusatInformasi> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: FlatButton(
            child: Icon(
              Icons.arrow_back_ios,
              color: White,
            ),
            onPressed: () => Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) {
              return Pariwisata();
            })),
          ),
          title: Text('Pusat Informasi Pariwisata Sidoarjo'),
          backgroundColor: darkGreen1,
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
              child: Container(
                  width: double.infinity,
                  height: 250,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage('assets/images/IU.jpg')))),
            )
          ],
        ),
      ),
    );
  }
}
