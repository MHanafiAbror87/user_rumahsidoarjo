import 'package:flutter/material.dart';
import 'package:rumah_sidoarjo/custom_template.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rumah_sidoarjo/home.dart';

class Cctv extends StatefulWidget {
  @override
  _cctvState createState() => _cctvState();
}

class _cctvState extends State<Cctv> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          leading: FlatButton(
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
            child: Icon(
              Icons.arrow_back_ios,
              color: White,
            ),
          ),
          title: Text('Cctv Sidoarjo', style: TextStyle(color: White)),
          backgroundColor: darkGreen1,
        ),
        body: ListView.builder(
          itemCount: berita.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
              child: Container(
                height: 100,
                child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          gambar[index],
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Text(
                              berita[index],
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    )),
              ),
            );
          },
        ),
      ),
    );
  }
}

final List berita = [
  "Cctv 2 Pendopo Sidoarjo",
  "Cctv 2 Pendopo Sidoarjo",
  "Cctv 2 Pendopo Sidoarjo",
  "Cctv 2 Pendopo Sidoarjo",
  "Cctv 2 Pendopo Sidoarjo",
  "Cctv 2 Pendopo Sidoarjo",
  "Cctv 2 Pendopo Sidoarjo",
  "Cctv 2 Pendopo Sidoarjo",
  "Cctv 2 Pendopo Sidoarjo",
];

final List gambar = [
  Image.asset('assets/images/cctv2.png', width: 50),
  Image.asset('assets/images/cctv2.png', width: 50),
  Image.asset('assets/images/cctv2.png', width: 50),
  Image.asset('assets/images/cctv2.png', width: 50),
  Image.asset('assets/images/cctv2.png', width: 50),
  Image.asset('assets/images/cctv2.png', width: 50),
  Image.asset('assets/images/cctv2.png', width: 50),
  Image.asset('assets/images/cctv2.png', width: 50),
  Image.asset('assets/images/cctv2.png', width: 50),
  Image.asset('assets/images/cctv2.png', width: 50),
];
