import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rumah_sidoarjo/custom_template.dart';

class Pemancingan extends StatefulWidget {
  @override
  _PemancinganState createState() => _PemancinganState();
}

class _PemancinganState extends State<Pemancingan> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.transparent,
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
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Container(
                                  height: 30,
                                  width: 300,
                                  child: Text(
                                    berita[index],
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Container(
                                    height: 30,
                                    width: 300,
                                    child: Text(
                                      berita[index],
                                      style: TextStyle(fontSize: 12),
                                    )),
                              )
                            ],
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
  "Wabup Subandi Meninjau Vaksinasi Massal yang Digelar DPC PKB Sidoarjo",
  "Wabup Subandi Meninjau Vaksinasi Massal yang Digelar DPC PKB Sidoarjo",
  "Wabup Subandi Meninjau Vaksinasi Massal yang Digelar DPC PKB Sidoarjo",
  "Wabup Subandi Meninjau Vaksinasi Massal yang Digelar DPC PKB Sidoarjo",
  "Wabup Subandi Meninjau Vaksinasi Massal yang Digelar DPC PKB Sidoarjo",
  "Wabup Subandi Meninjau Vaksinasi Massal yang Digelar DPC PKB Sidoarjo",
  "Wabup Subandi Meninjau Vaksinasi Massal yang Digelar DPC PKB Sidoarjo",
  "Wabup Subandi Meninjau Vaksinasi Massal yang Digelar DPC PKB Sidoarjo",
  "Wabup Subandi Meninjau Vaksinasi Massal yang Digelar DPC PKB Sidoarjo",
];

final List tglberita = [
  "27 Oktober 2021",
  "27 Oktober 2021",
  "27 Oktober 2021",
  "27 Oktober 2021",
  "27 Oktober 2021",
];

final List gambar = [
  Image.asset('assets/images/Pengaduan.png', width: 50),
  Image.asset('assets/images/Pengaduan.png', width: 50),
  Image.asset('assets/images/Pengaduan.png', width: 50),
  Image.asset('assets/images/Pengaduan.png', width: 50),
  Image.asset('assets/images/Pengaduan.png', width: 50),
  Image.asset('assets/images/Pengaduan.png', width: 50),
  Image.asset('assets/images/Pengaduan.png', width: 50),
  Image.asset('assets/images/Pengaduan.png', width: 50),
  Image.asset('assets/images/Pengaduan.png', width: 50),
  Image.asset('assets/images/Pengaduan.png', width: 50),
];
