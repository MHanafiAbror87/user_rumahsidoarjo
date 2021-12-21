import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:rumah_sidoarjo/custom_template.dart';
import 'package:http/http.dart';
import 'package:rumah_sidoarjo/home.dart';
import 'package:rumah_sidoarjo/models/kesehatan.dart';
import 'package:rumah_sidoarjo/models/umkm.dart';
import 'package:rumah_sidoarjo/pages/detail_umkm.dart';
import 'package:rumah_sidoarjo/pages/kesehatan/detail_kesehatan.dart';
import 'package:rumah_sidoarjo/pages/umkm/detail_umkm.dart';
import 'package:rumah_sidoarjo/services/api_kesehatan.dart';
import 'package:rumah_sidoarjo/services/api_pariwisata.dart';
import 'package:rumah_sidoarjo/models/pariwisata.dart';
import 'package:rumah_sidoarjo/services/api_umkm.dart';
import 'package:rumah_sidoarjo/services/apiurl.dart';

class Pkmu extends StatelessWidget {
  final ApiKesehatan api = ApiKesehatan();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<List<KesehatanData>>(
            future: api.getKesehatan(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                List<KesehatanData> pkmu = snapshot.data;
                return ListView(
                  children: pkmu
                      .map(
                        (pkmu) => GestureDetector(
                          onTap: () => Navigator.of(context)
                              .pushReplacement(MaterialPageRoute(
                                  builder: (context) => DetailPkmu(
                                        pkmu: pkmu,
                                      ))),
                          child: SingleChildScrollView(
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 100,
                                      width: 50,
                                      child: Image.network(
                                        "$fotoUrl/assets/img/${pkmu.foto}",
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 10.0),
                                      child: Column(
                                        children: [
                                          Container(
                                            height: 30,
                                            width: 300,
                                            child: Text(
                                              pkmu.nama,
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
                                                ('${pkmu.alamat}, ${pkmu.kecamatan}'),
                                                style: TextStyle(fontSize: 12),
                                              ))
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }));
  }
}
