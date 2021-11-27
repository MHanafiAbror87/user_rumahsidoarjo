import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rumah_sidoarjo/custom_template.dart';
import 'package:http/http.dart' as http;

class Pemancingan extends StatefulWidget {
  @override
  _PemancinganState createState() => _PemancinganState();
}

class _PemancinganState extends State<Pemancingan> {
  Future<List<dynamic>> _fecthDataUsers() async {
    var result = await http.get(Uri.parse(
        "http://10.212.164.37/RumahSidoarjoAdmin/rest_ci/index.php/Pariwisata"));
    return json.decode(result.body);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.transparent,
        body: FutureBuilder<List<dynamic>>(
          future: _fecthDataUsers(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
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
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 30,
                                        width: 300,
                                        child: Text(
                                          snapshot.data[index]['nama_wisata'],
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                          height: 30,
                                          width: 300,
                                          child: Text(
                                            snapshot.data[index]['alamat'],
                                            style: TextStyle(fontSize: 12),
                                          ))
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )),
                    ),
                  );
                },
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
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
