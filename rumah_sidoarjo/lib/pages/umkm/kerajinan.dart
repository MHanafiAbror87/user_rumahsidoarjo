import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:rumah_sidoarjo/custom_template.dart';
import 'package:http/http.dart';
import 'package:rumah_sidoarjo/home.dart';
import 'package:rumah_sidoarjo/models/umkm.dart';
import 'package:rumah_sidoarjo/pages/detail_umkm.dart';
import 'package:rumah_sidoarjo/pages/pariwisata/detailpariwisata.dart';
import 'package:rumah_sidoarjo/pages/umkm/DetailUmkm.dart';
import 'package:rumah_sidoarjo/services/api_pariwisata.dart';
import 'package:rumah_sidoarjo/models/pariwisata.dart';
import 'package:rumah_sidoarjo/services/Umkm.dart';

class Kerajinan extends StatelessWidget {
  final ApiUmkm api = ApiUmkm();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Colors.transparent,
          body: FutureBuilder(
              future: api.getUmkm(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  List<Umkm> umkm = snapshot.data;
                  return ListView(
                    children: umkm
                        .map(
                          (Umkm kerajinan) => GestureDetector(
                            onTap: () =>
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => DetailUmkm(
                                          kerajinan: kerajinan,
                                        ))),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  children: [
                                    // Image.asset(
                                    //   kerajinan.foto1,
                                    //   width: 50,
                                    //   height: 50,
                                    // ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 10.0),
                                      child: Column(
                                        children: [
                                          Container(
                                            height: 30,
                                            width: 300,
                                            child: Text(
                                              kerajinan.nama,
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
                                                kerajinan.alamat,
                                                style: TextStyle(fontSize: 12),
                                              ))
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              // child: ListTile(
                              //   title: Text(kerajinan.nama),
                              //   subtitle: Text(kerajinan.alamat),
                              //   onTap: () =>
                              //       Navigator.of(context).push(MaterialPageRoute(
                              //           builder: (context) => DetailUmkm(
                              //                 kerajinan: kerajinan,
                              //               ))),
                              // ),
                            ),
                          ),
                        )
                        .toList(),
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              })),
    );
  }
}
