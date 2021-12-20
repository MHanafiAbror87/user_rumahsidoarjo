import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rumah_sidoarjo/custom_template.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rumah_sidoarjo/models/pariwisata.dart';
import 'package:rumah_sidoarjo/models/list_pariwisata.dart';
import 'package:rumah_sidoarjo/pages/pariwisata/list_ulasan.dart';
import 'package:rumah_sidoarjo/pages/pariwisata/pariwisata.dart'
    as tabPariwisata;
import 'package:rumah_sidoarjo/pages/pariwisata/pusatinformasi.dart';
import 'package:rumah_sidoarjo/pages/pariwisata/widget/ulasan_dialog.dart';
import 'package:rumah_sidoarjo/services/api_pariwisata.dart';
import 'package:rumah_sidoarjo/services/apiurl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:path/path.dart' as pt;

class Detail_pariwisata extends StatefulWidget {
  final PariwisataData wisata;
  Detail_pariwisata({required this.wisata});

  @override
  _Detail_pariwisataState createState() => _Detail_pariwisataState();
}

class _Detail_pariwisataState extends State<Detail_pariwisata> {
  final ApiPariwisata api = ApiPariwisata();
  final _addFormKey = GlobalKey<FormState>();
  final _ulasanController = TextEditingController();
  List<Ulasan> tampilUlasan = [];
  List<File> listFoto = [];

  File? fotoProfil;
  String profileUrl = '';

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   init();
  //   super.initState();
  // }

  // void init() async {
  //   profileUrl = await SessionHelper.getFotoProfil();

  //   setState(() {
  //     profileUrl = profileUrl;
  //   });

  //   print('profile: $profileUrl');
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: FlatButton(
          child: Icon(
            Icons.arrow_back_ios,
            color: White,
          ),
          onPressed: () => Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
            return tabPariwisata.Pariwisata();
          })),
        ),
        title: Text('Detail Wisata'),
        backgroundColor: darkGreen1,
      ),
      body: Form(
        key: _addFormKey,
        child: SingleChildScrollView(
          child: FutureBuilder<DetailPariwisataModel>(
              future: api.getPariwisataById(widget.wisata.idWisata),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final detail = snapshot.data;

                  final pariwisata = detail!.pariwisata;
                  final tarif = detail.tarif;
                  final menu = detail.menu;
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
                              "$fotoUrl/assets/img/${pariwisata.foto1}",
                              fit: BoxFit.cover),
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            pariwisata.namaWisata,
                            style: TextStyle(
                                fontFamily: 'DMSans',
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
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
                                    pariwisata.alamat,
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
                                    pariwisata.kategori,
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
                                    pariwisata.pengelola,
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
                                          padding:
                                              const EdgeInsets.only(right: 27),
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
                                            pariwisata.noTelepon,
                                            style: TextStyle(
                                                fontFamily: 'DMSans',
                                                fontSize: 14,
                                                color: darkGreen),
                                          ),
                                        ),
                                      ],
                                    ),
                                    InkWell(
                                      onTap: () => launch(
                                          "tel://${pariwisata.noTelepon}"),
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
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Padding(
                                      padding: const EdgeInsets.only(right: 27),
                                      child: Align(
                                        alignment: Alignment.bottomLeft,
                                        child: Text(
                                          'Jam Operasional',
                                          style: TextStyle(
                                            fontFamily: 'DMSans',
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          pariwisata.jamBuka,
                                          style: TextStyle(
                                              fontFamily: 'DMSans',
                                              fontSize: 14,
                                              color: darkGreen),
                                        ),
                                        Text(
                                          ' - ',
                                          style: TextStyle(
                                              fontFamily: 'DMSans',
                                              fontSize: 14,
                                              color: darkGreen),
                                        ),
                                        Text(
                                          pariwisata.jamTutup,
                                          style: TextStyle(
                                              fontFamily: 'DMSans',
                                              fontSize: 14,
                                              color: darkGreen),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const Divider(
                                  color: Colors.grey,
                                  height: 25,
                                  thickness: 2,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: const Text(
                                        'Harga Tiket Masuk',
                                        style: TextStyle(
                                          fontFamily: 'DMSans',
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: tarif.length > 0
                                          ? tarif
                                              .map(
                                                (tarif) => Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          tarif.namaTiket,
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'DMSans',
                                                              fontSize: 14,
                                                              color: darkGreen),
                                                        ),
                                                        Text(
                                                          'Rp ${tarif.tarif}',
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'DMSans',
                                                              fontSize: 14,
                                                              color: darkGreen),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              )
                                              .toList()
                                          : [
                                              Text(
                                                "Tiket Gratis",
                                                style: TextStyle(
                                                    fontFamily: 'DMSans',
                                                    fontSize: 14,
                                                    color: darkGreen),
                                              ),
                                            ],
                                    ),
                                  ],
                                ),
                                const Divider(
                                  color: Colors.grey,
                                  height: 25,
                                  thickness: 2,
                                ),
                                Column(
                                  children: menu.length > 0
                                      ? menu
                                          .map((menu) => Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    const Text(
                                                      'MENU MAKANAN',
                                                      style: TextStyle(
                                                        fontFamily: 'DMSans',
                                                        fontSize: 16,
                                                      ),
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          menu.nama,
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'DMSans',
                                                              fontSize: 14,
                                                              color: darkGreen),
                                                        ),
                                                        Text(
                                                          'Rp ${menu.harga}',
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'DMSans',
                                                              fontSize: 14,
                                                              color: darkGreen),
                                                        ),
                                                      ],
                                                    ),
                                                    const Divider(
                                                      color: Colors.grey,
                                                      height: 25,
                                                      thickness: 2,
                                                    ),
                                                  ]))
                                          .toList()
                                      : [],
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
                                            builder: (context) => ListUlasan(
                                              pariwisata: pariwisata,
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
                                                      BorderRadius.circular(
                                                          20)),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(10.0),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Container(
                                                            width: 50,
                                                            height: 50,
                                                            child: Image.network(
                                                                "$fotoUrl/assets/img/${ulasan.fotoProfil}")),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 10),
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                ulasan.nama,
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        14,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              ),
                                                              Text(
                                                                DateFormat(
                                                                        'dd MMMM yyyy')
                                                                    .format(ulasan
                                                                        .tanggalUpload),
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        12,
                                                                    fontFamily:
                                                                        "DMSans"),
                                                              ),
                                                            ],
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                    SizedBox(height: 10),
                                                    Text(
                                                      ulasan.ulasan,
                                                      maxLines: 2,
                                                      style: TextStyle(
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
                                    Text("Ulasan Belum Tersedia"),
                                  ],
                          ),
                          FlatButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) => UlasanDialog(
                                        pariwisata: pariwisata,
                                      ));
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              child: Container(
                                height: 50,
                                padding: EdgeInsets.all(12.0),
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

                return Center(child: CircularProgressIndicator());
              }),
        ),
      ),
    );
  }
}
