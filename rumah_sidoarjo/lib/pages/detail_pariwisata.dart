import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rumah_sidoarjo/custom_template.dart';
import 'package:rumah_sidoarjo/home.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:getwidget/getwidget.dart';
import 'package:rumah_sidoarjo/models/pariwisata.dart';
import 'package:rumah_sidoarjo/pages/pariwisata/list_pariwisata.dart';
import 'package:rumah_sidoarjo/services/api_pariwisata.dart';
import 'package:rumah_sidoarjo/services/apiurl.dart';
import 'package:url_launcher/url_launcher.dart';

class Detail_pariwisata extends StatefulWidget {
  final PariwisataData wisata;
  Detail_pariwisata({required this.wisata});

  @override
  _Detail_pariwisataState createState() => _Detail_pariwisataState();
}

class _Detail_pariwisataState extends State<Detail_pariwisata> {
  final ApiPariwisata api = ApiPariwisata();
  List<Ulasan> tampilUlasan = [];

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
            return Home();
          })),
        ),
        title: Text('Detail Wisata'),
        backgroundColor: darkGreen1,
      ),
      body: SingleChildScrollView(
        child: FutureBuilder<DetailPariwisataModel>(
            future: api.getPariwisataById(widget.wisata.idWisata),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final detail = snapshot.data;

                final pariwisata = detail!.pariwisata;
                final tarif = detail.tarif;
                final semuaUlasan = detail.ulasan;

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
                          horizontal: 20, vertical: 15),
                      child: Container(
                        width: double.infinity,
                        height: 200,
                        child: Image.network(
                            "$fotoUrl/assets/img/${pariwisata.foto1}",
                            fit: BoxFit.cover),
                      ),
                    ),
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
                              children: [
                                Column(
                                  children: [
                                    const Padding(
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
                                        pariwisata.noTelepon,
                                        style: TextStyle(
                                            fontFamily: 'DMSans',
                                            fontSize: 14,
                                            color: darkGreen),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(width: 200),
                                InkWell(
                                  onTap: () =>
                                      launch("tel://${pariwisata.noTelepon}"),
                                  child: Container(
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
                                ),
                              ],
                            ),
                            const Divider(
                              color: Colors.grey,
                              height: 25,
                              thickness: 2,
                            ),
                            Row(
                              children: [
                                Column(
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
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        pariwisata.jamBuka,
                                        style: TextStyle(
                                            fontFamily: 'DMSans',
                                            fontSize: 14,
                                            color: darkGreen),
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(right: 27),
                                      child: Align(
                                        alignment: Alignment.bottomLeft,
                                        child: Text(
                                          '',
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
                                        pariwisata.jamTutup,
                                        style: TextStyle(
                                            fontFamily: 'DMSans',
                                            fontSize: 14,
                                            color: darkGreen),
                                      ),
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
                            const SizedBox(height: 20),
                            const Text(
                              'TARIF TIKET',
                              style: TextStyle(
                                fontFamily: 'DMSans',
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Column(
                              children: tarif.length > 0
                                  ? tarif
                                      .map(
                                        (tarif) => Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 35.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                tarif.namaTiket,
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                    fontFamily: 'DMSans',
                                                    fontSize: 14),
                                              ),
                                              Text(
                                                tarif.tarif,
                                                style: TextStyle(
                                                    fontFamily: 'DMSans',
                                                    fontSize: 14,
                                                    color: darkGreen),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                      .toList()
                                  : [
                                      Text("Tarif Tidak Tersedia"),
                                    ],
                            ),
                            SizedBox(height: 20),
                            Column(
                              children: [
                                Text(
                                  'MENU MAKANAN',
                                  style: TextStyle(
                                    fontFamily: 'DMSans',
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 35.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Ayam Geprek',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            fontFamily: 'DMSans', fontSize: 14),
                                      ),
                                      Text(
                                        'Rp:4000.00',
                                        style: TextStyle(
                                            fontFamily: 'DMSans',
                                            fontSize: 14,
                                            color: darkGreen),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 35.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Soto Lamongan',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            fontFamily: 'DMSans', fontSize: 14),
                                      ),
                                      Text(
                                        'Rp:4000.00',
                                        style: TextStyle(
                                            fontFamily: 'DMSans',
                                            fontSize: 14,
                                            color: darkGreen),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 35.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Pecel Pincuk',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            fontFamily: 'DMSans', fontSize: 14),
                                      ),
                                      Text(
                                        'Rp:4000.00',
                                        style: TextStyle(
                                            fontFamily: 'DMSans',
                                            fontSize: 14,
                                            color: darkGreen),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 50),
                              ],
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
                                                  padding: const EdgeInsets.all(
                                                      10.0),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
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
                                                            fontFamily:
                                                                "DMSans"),
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
                          ],
                        ),
                      ),
                    )
                  ],
                );
              }

              return Center(child: CircularProgressIndicator());
            }),
      ),
    );
  }
}
