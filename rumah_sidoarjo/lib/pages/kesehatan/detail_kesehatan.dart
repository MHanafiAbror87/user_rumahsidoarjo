import 'package:flutter/material.dart';
import 'package:rumah_sidoarjo/custom_template.dart';
import 'package:rumah_sidoarjo/home.dart';
import 'package:rumah_sidoarjo/models/kesehatan.dart';
import 'package:rumah_sidoarjo/models/umkm.dart';
import 'package:rumah_sidoarjo/pages/kesehatan/kesehatan.dart';
import 'package:rumah_sidoarjo/pages/umkm/umkm.dart' as UmkmPage;
import 'package:rumah_sidoarjo/services/api_pariwisata.dart';
import 'package:rumah_sidoarjo/models/pariwisata.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rumah_sidoarjo/services/apiurl.dart';

class DetailPkmu extends StatelessWidget {
  final KesehatanData pkmu;
  DetailPkmu({required this.pkmu});

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: FlatButton(
            child: Icon(
              Icons.arrow_back_ios,
              color: White,
            ),
            onPressed: () => Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) {
              return Kesehatan();
            })),
          ),
          title: Text('Detail PKM Utama'),
          backgroundColor: darkGreen1,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                child: Container(
                  width: double.infinity,
                  height: 200,
                  child: Image.network("$fotoUrl/assets/img/${pkmu.foto}",
                      fit: BoxFit.cover),
                ),
              ),
              Text(
                pkmu.nama,
                style: TextStyle(
                    fontFamily: 'DMSans',
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Alamat',
                          style: TextStyle(
                            fontFamily: 'DMSans',
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          pkmu.alamat,
                          style: TextStyle(
                              fontFamily: 'DMSans',
                              fontSize: 14,
                              color: darkGreen),
                        ),
                      ),
                      Divider(
                        color: Colors.grey,
                        height: 25,
                        thickness: 2,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Kategori',
                          style: TextStyle(
                            fontFamily: 'DMSans',
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          pkmu.kategori,
                          style: TextStyle(
                              fontFamily: 'DMSans',
                              fontSize: 14,
                              color: darkGreen),
                        ),
                      ),
                      Divider(
                        color: Colors.grey,
                        height: 25,
                        thickness: 2,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Pengelola',
                          style: TextStyle(
                            fontFamily: 'DMSans',
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          pkmu.penanggungJawab,
                          style: TextStyle(
                              fontFamily: 'DMSans',
                              fontSize: 14,
                              color: darkGreen),
                        ),
                      ),
                      Divider(
                        color: Colors.grey,
                        height: 25,
                        thickness: 2,
                      ),
                      Row(
                        children: [
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 27),
                                child: Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Text(
                                    'Telepon',
                                    style: TextStyle(
                                      fontFamily: 'DMSans',
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  pkmu.noTelepon,
                                  style: TextStyle(
                                      fontFamily: 'DMSans',
                                      fontSize: 14,
                                      color: darkGreen),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 180),
                          Container(
                              width: 100,
                              height: 40,
                              decoration: BoxDecoration(
                                color: darkGreen1,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Center(
                                  child: Text(
                                'Panggil',
                                style: GoogleFonts.poppins(
                                    fontSize: 14, color: White),
                              ))),
                        ],
                      ),
                      Divider(
                        color: Colors.grey,
                        height: 25,
                        thickness: 2,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Deskripsi',
                          style: TextStyle(
                            fontFamily: 'DMSans',
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          pkmu.penanggungJawab,
                          style: TextStyle(
                              fontFamily: 'DMSans',
                              fontSize: 14,
                              color: darkGreen),
                        ),
                      ),
                      Divider(
                        color: Colors.grey,
                        height: 25,
                        thickness: 2,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Media Sosial',
                          style: TextStyle(
                            fontFamily: 'DMSans',
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          pkmu.website,
                          style: TextStyle(
                              fontFamily: 'DMSans',
                              fontSize: 14,
                              color: darkGreen),
                        ),
                      ),
                      Divider(
                        color: Colors.grey,
                        height: 25,
                        thickness: 2,
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
