import 'dart:io';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rumah_sidoarjo/custom_template.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rumah_sidoarjo/models/list_umkm.dart';
import 'package:rumah_sidoarjo/models/umkm.dart';
import 'package:rumah_sidoarjo/pages/pariwisata/list_ulasan.dart';
import 'package:rumah_sidoarjo/pages/pariwisata/widget/ulasan_dialog.dart';
import 'package:rumah_sidoarjo/pages/umkm/list_ulasan_umkm.dart';
import 'package:rumah_sidoarjo/pages/umkm/umkm.dart' as page;
import 'package:rumah_sidoarjo/pages/umkm/widget/ulasan_dialog_umkm.dart';
import 'package:rumah_sidoarjo/services/api_umkm.dart';
import 'package:rumah_sidoarjo/services/apiurl.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailUmkm_Kerajinan extends StatefulWidget {
  final UmkmData kerajinan;
  DetailUmkm_Kerajinan({required this.kerajinan});

  @override
  _DetailUmkm_KerajinanState createState() => _DetailUmkm_KerajinanState();
}

class _DetailUmkm_KerajinanState extends State<DetailUmkm_Kerajinan> {
  final ApiUmkm api = ApiUmkm();
  final _addFormKey = GlobalKey<FormState>();
  final _ulasanController = TextEditingController();
  List<Ulasan> tampilUlasan = [];
  List<File> listFoto = [];

  File? fotoProfil;
  String profileUrl = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: TextButton(
          child: Icon(
            Icons.arrow_back_ios,
            color: White,
          ),
          onPressed: () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) {
                return page.Umkm();
              },
            ),
          ),
        ),
        title: const Text('Detail Umkm'),
        backgroundColor: darkGreen1,
      ),
      body: Form(
        key: _addFormKey,
        child: SingleChildScrollView(
          child: FutureBuilder<DetailUmkmModel>(
            future: api.getUmkmById(widget.kerajinan.idUmkm),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final detail = snapshot.data;

                final umkm = detail!.umkm;
                final semuaUlasan = detail.ulasan;

                tampilUlasan.clear();

                if (semuaUlasan.length > 2) {
                  for (var i = 0; i < 2; i++) {
                    tampilUlasan.add(semuaUlasan[i]);
                  }
                } else {
                  tampilUlasan.addAll(semuaUlasan);
                }

                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: Container(
                        width: double.infinity,
                        height: 210,
                        child: Image.network(
                            "$fotoUrl/assets/img/${umkm.foto1}",
                            fit: BoxFit.cover),
                      ),
                    ),
                    Column(
                      children: [
                        Text(
                          umkm.nama,
                          style: const TextStyle(
                              fontFamily: 'DMSans',
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            children: [
                              const Align(
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
                                  umkm.alamat,
                                  style: TextStyle(
                                      fontFamily: 'DMSans',
                                      fontSize: 14,
                                      color: darkGreen),
                                ),
                              ),
                              const Divider(
                                color: Colors.grey,
                                height: 25,
                                thickness: 2,
                              ),
                              const Align(
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
                                  umkm.kategori,
                                  style: TextStyle(
                                      fontFamily: 'DMSans',
                                      fontSize: 14,
                                      color: darkGreen),
                                ),
                              ),
                              const Divider(
                                color: Colors.grey,
                                height: 25,
                                thickness: 2,
                              ),
                              const Align(
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
                                  umkm.penanggungJawab,
                                  style: TextStyle(
                                      fontFamily: 'DMSans',
                                      fontSize: 14,
                                      color: darkGreen),
                                ),
                              ),
                              const Divider(
                                color: Colors.grey,
                                height: 25,
                                thickness: 2,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.only(right: 27),
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
                                          umkm.noTelp,
                                          style: TextStyle(
                                              fontFamily: 'DMSans',
                                              fontSize: 14,
                                              color: darkGreen),
                                        ),
                                      ),
                                    ],
                                  ),
                                  InkWell(
                                    onTap: () => launch("tel://${umkm.noTelp}"),
                                    child: Container(
                                        width: 100,
                                        height: 40,
                                        decoration: BoxDecoration(
                                          color: darkGreen1,
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                        child: Center(
                                            child: Text(
                                          'Panggil',
                                          style: GoogleFonts.poppins(
                                              fontSize: 14, color: White),
                                        ))),
                                  ),
                                ],
                              ),
                              const Divider(
                                color: Colors.grey,
                                height: 25,
                                thickness: 2,
                              ),
                              const Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Website',
                                  style: TextStyle(
                                    fontFamily: 'DMSans',
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  umkm.website,
                                  style: TextStyle(
                                      fontFamily: 'DMSans',
                                      fontSize: 14,
                                      color: darkGreen),
                                ),
                              ),
                              const Divider(
                                color: Colors.grey,
                                height: 25,
                                thickness: 2,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Ulasan',
                                      style: GoogleFonts.dmSans(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold)),
                                  TextButton(
                                    onPressed: () => {
                                      Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                          builder: (context) => ListUlasan_Umkm(
                                            kerajinan: umkm,
                                          ),
                                        ),
                                      ),
                                    },
                                    child: Text('Lihat Semua',
                                        style: GoogleFonts.dmSans(
                                            fontSize: 14, color: darkGreen1)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Column(
                          children: tampilUlasan.length > 0
                              ? tampilUlasan
                                  .map(
                                    (ulasan) => Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 2),
                                      child: Container(
                                        height: 130,
                                        child: Card(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    children: [
                                                      SizedBox(
                                                          width: 50,
                                                          height: 50,
                                                          child: Image.network(
                                                              "$fotoUrl/assets/img/${ulasan.fotoProfil}")),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(left: 10),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              ulasan.nama,
                                                              style: const TextStyle(
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                            Text(
                                                              DateFormat(
                                                                      'dd MMMM yyyy')
                                                                  .format(ulasan
                                                                      .tanggalUpload),
                                                              style: const TextStyle(
                                                                  fontSize: 12,
                                                                  fontFamily:
                                                                      "DMSans"),
                                                            ),
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  const SizedBox(height: 10),
                                                  Text(
                                                    ulasan.ulasan,
                                                    maxLines: 2,
                                                    style: const TextStyle(
                                                        fontSize: 14,
                                                        fontFamily: "DMSans"),
                                                  )
                                                ],
                                              ),
                                            )),
                                      ),
                                    ),
                                  )
                                  .toList()
                              : [
                                  const Text("Ulasan Belum Tersedia"),
                                ],
                        ),
                        TextButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) => UlasanDialogUmkm(
                                      kerajinan: umkm,
                                    ));
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: Container(
                              height: 50,
                              padding: const EdgeInsets.all(12.0),
                              width: double.infinity,
                              child: Text(
                                'Tambah Ulasan',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: White,
                                  letterSpacing: 2,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'DMSans',
                                ),
                              ),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    colors: [lightGreen, darkGreen1],
                                    end: Alignment.centerRight,
                                    begin: Alignment.centerLeft),
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                );
              }

              return const Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
    );
  }
}
