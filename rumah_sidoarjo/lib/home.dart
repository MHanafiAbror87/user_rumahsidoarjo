import 'package:flutter/material.dart';
import 'package:rumah_sidoarjo/akun.dart';
import 'package:rumah_sidoarjo/beritainformasi.dart';
import 'package:rumah_sidoarjo/lowongankerja.dart';
import 'custom_template.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:getwidget/getwidget.dart';

class Home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: appBar(),
        body: Column(
          children: [
            Center(
              child: Column(
                children: [
                  _selamatDatang(),
                  SizedBox(
                    height: 20,
                  ),
                  _menu(),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text('Agenda & Komunitas',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.openSans(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
              ),
            ),
            _TrophyMasks(),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              child: Row(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Berita Terbaru',
                        textAlign: TextAlign.left,
                        style: GoogleFonts.openSans(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 197),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () => {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) {
                            return Beritainformasi();
                          }))
                        },
                        child: Text('Lihat Semua',
                            textAlign: TextAlign.right,
                            style: GoogleFonts.openSans(
                                fontSize: 12, color: darkGreen)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            _ListViewBerita(),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              child: Row(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Wisata Populer',
                        textAlign: TextAlign.left,
                        style: GoogleFonts.openSans(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 194),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () => {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) {
                            return Beritainformasi();
                          }))
                        },
                        child: Text('Lihat Semua',
                            textAlign: TextAlign.right,
                            style: GoogleFonts.openSans(
                                fontSize: 12, color: darkGreen)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            _ListViewWisata(),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              child: Row(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text('UMKM (Usaha Mikro Kecil Menengah)',
                        textAlign: TextAlign.left,
                        style: GoogleFonts.openSans(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 47),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () => {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) {
                            return Beritainformasi();
                          }))
                        },
                        child: Text('Lihat Semua',
                            textAlign: TextAlign.right,
                            style: GoogleFonts.openSans(
                                fontSize: 12, color: darkGreen)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            _ListViewUMKM(),
          ],
        ),
      ),
    );
  }

  Widget _menu() {
    return Container(
      padding: EdgeInsets.all(10),
      width: double.infinity,
      height: 180,
      color: White,
      child: ListView(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            FlatButton(
              onPressed: () {},
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/panik_menu.png',
                    width: 45,
                    height: 45,
                  ),
                  Text(
                    'PANIC MENU',
                    style: GoogleFonts.bebasNeue(fontSize: 12, color: darkGrey),
                  )
                ],
              ),
            ),
            FlatButton(
              onPressed: () {},
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/Pengaduan.png',
                    width: 45,
                    height: 45,
                  ),
                  Text(
                    'PENGADUAN',
                    style: GoogleFonts.bebasNeue(fontSize: 12, color: darkGrey),
                  )
                ],
              ),
            ),
            FlatButton(
              onPressed: () {},
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/Kesehatan.png',
                    width: 45,
                    height: 45,
                  ),
                  Text(
                    'KESEHATAN',
                    style: GoogleFonts.bebasNeue(fontSize: 12, color: darkGrey),
                  )
                ],
              ),
            ),
          ]),
          Padding(padding: EdgeInsets.only(top: 20)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FlatButton(
                onPressed: () {},
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/Pendidikan.png',
                      width: 45,
                      height: 45,
                    ),
                    Text(
                      'PENDIDIKAN',
                      style:
                          GoogleFonts.bebasNeue(fontSize: 12, color: darkGrey),
                    )
                  ],
                ),
              ),
              FlatButton(
                onPressed: () {},
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/Pariwisata.png',
                      width: 45,
                      height: 45,
                    ),
                    Text(
                      'PARIWISATA',
                      style:
                          GoogleFonts.bebasNeue(fontSize: 12, color: darkGrey),
                    )
                  ],
                ),
              ),
              FlatButton(
                onPressed: _showDialog,
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/Lainnya.png',
                      width: 45,
                      height: 45,
                    ),
                    Text(
                      'Lainnya',
                      style:
                          GoogleFonts.bebasNeue(fontSize: 12, color: darkGrey),
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  void _showDialog() {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        context: this.context,
        builder: (context) {
          return Container(
            child: ListView(
              children: [
                Padding(padding: EdgeInsets.only(top: 20)),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20, bottom: 20),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Fitur Lainnya',
                          style: GoogleFonts.poppins(fontSize: 12),
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      FlatButton(
                        onPressed: () {},
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/images/cctv.png',
                              width: 45,
                              height: 45,
                            ),
                            Text(
                              'CCTV',
                              style: GoogleFonts.bebasNeue(
                                  fontSize: 12, color: darkGrey),
                            )
                          ],
                        ),
                      ),
                      FlatButton(
                        onPressed: () {},
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/images/layanan_publik.png',
                              width: 45,
                              height: 45,
                            ),
                            Text(
                              'LAYANAN PUBLIK',
                              style: GoogleFonts.bebasNeue(
                                  fontSize: 12, color: darkGrey),
                            )
                          ],
                        ),
                      ),
                      FlatButton(
                        onPressed: () {},
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/images/Tagihan.png',
                              width: 45,
                              height: 45,
                            ),
                            Text(
                              'TAGIHAN',
                              style: GoogleFonts.bebasNeue(
                                  fontSize: 12, color: darkGrey),
                            )
                          ],
                        ),
                      ),
                    ]),
                Padding(padding: EdgeInsets.only(top: 20)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    FlatButton(
                      onPressed: () {},
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/images/media_massa.png',
                            width: 45,
                            height: 45,
                          ),
                          Text(
                            'MEDIA MASSA',
                            style: GoogleFonts.bebasNeue(
                                fontSize: 12, color: darkGrey),
                          )
                        ],
                      ),
                    ),
                    FlatButton(
                      onPressed: () {},
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/images/umkm.png',
                            width: 45,
                            height: 45,
                          ),
                          Text(
                            'UMKM',
                            style: GoogleFonts.bebasNeue(
                                fontSize: 12, color: darkGrey),
                          )
                        ],
                      ),
                    ),
                    FlatButton(
                      onPressed: () => {
                        Navigator.pushReplacement(context, MaterialPageRoute(
                          builder: (context) {
                            return Lowongankerja();
                          },
                        ))
                      },
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/images/job.png',
                            width: 45,
                            height: 45,
                          ),
                          Text(
                            'PEKERJAAN',
                            style: GoogleFonts.bebasNeue(
                                fontSize: 12, color: darkGrey),
                          )
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        });
  }

  Container _ListViewUMKM() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            width: 260,
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  child: Row(
                    children: [
                      gambar[index],
                      Column(
                        children: [
                          Container(
                              padding: EdgeInsets.only(left: 10),
                              height: 30,
                              width: 180,
                              child: Text(berita[index],
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold))),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                              padding: EdgeInsets.only(left: 10),
                              height: 30,
                              width: 180,
                              child: Text(berita[index],
                                  style: TextStyle(
                                    fontSize: 10,
                                  )))
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
        itemCount: berita.length,
      ),
    );
  }

  Container _ListViewWisata() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            width: 260,
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  child: Row(
                    children: [
                      gambar[index],
                      Column(
                        children: [
                          Container(
                              padding: EdgeInsets.only(left: 10),
                              height: 30,
                              width: 180,
                              child: Text(berita[index],
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold))),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                              padding: EdgeInsets.only(left: 10),
                              height: 30,
                              width: 180,
                              child: Text(berita[index],
                                  style: TextStyle(
                                    fontSize: 10,
                                  )))
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
        itemCount: berita.length,
      ),
    );
  }

  Container _ListViewBerita() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            width: 260,
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: GestureDetector(
                  onTap: () => {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) {
                      return Beritainformasi();
                    }))
                  },
                  child: Container(
                    child: Row(
                      children: [
                        Row(
                          children: [
                            gambar[index],
                            Column(
                              children: [
                                Container(
                                    padding: EdgeInsets.only(left: 10),
                                    height: 30,
                                    width: 180,
                                    child: Text(berita[index],
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold))),
                                SizedBox(
                                  height: 5,
                                ),
                                Container(
                                    padding: EdgeInsets.only(left: 10),
                                    height: 30,
                                    width: 180,
                                    child: Text(berita[index],
                                        style: TextStyle(
                                          fontSize: 10,
                                        )))
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
        itemCount: berita.length,
      ),
    );
  }

  final List berita = [
    "Wabup Subandi Meninjau Vaksinasi Massal yang Digelar DPC PKB Sidoarjo",
    "Wabup Subandi Meninjau Vaksinasi Massal yang Digelar DPC PKB Sidoarjo",
    "Wabup Subandi Meninjau Vaksinasi Massal yang Digelar DPC PKB Sidoarjo",
    "Wabup Subandi Meninjau Vaksinasi Massal yang Digelar DPC PKB Sidoarjo",
    "Wabup Subandi Meninjau Vaksinasi Massal yang Digelar DPC PKB Sidoarjo",
  ];

  final List gambar = [
    Image.asset('assets/images/Pengaduan.png', width: 50),
    Image.asset('assets/images/Pengaduan.png', width: 50),
    Image.asset('assets/images/Pengaduan.png', width: 50),
    Image.asset('assets/images/Pengaduan.png', width: 50),
    Image.asset('assets/images/Pengaduan.png', width: 50),
  ];

  FlatButton _TrophyMasks() {
    return FlatButton(
      onPressed: () {},
      child: Container(
        width: 380,
        height: 100,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [lightGreen, darkGreen1],
                end: Alignment.centerRight,
                begin: Alignment.centerLeft),
            color: darkGreen,
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Container(
                  width: 200,
                  child: Text('Ayo cari tau agenda yang akan dilaksanakan',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.roboto(
                          fontSize: 14,
                          color: White,
                          fontWeight: FontWeight.bold))),
            ),
            SizedBox(
              width: 40,
            ),
            Image.asset(
              'assets/images/TrophyMasks.png',
              width: 90,
              height: 90,
            )
          ],
        ),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: Text(
        'Rumah Sidoarjo',
        style: TextStyle(fontFamily: 'DMSans', color: Colors.white),
      ),
      backgroundColor: darkGreen1,
      leading: Padding(
        padding: EdgeInsets.only(left: 10.0),
        child: Image.asset(
          'assets/images/logo_sidoarjo.png',
          width: 10.0,
          height: 10.0,
        ),
      ),
      actions: [
        IconButton(
            onPressed: () => {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return Akun();
                  }))
                },
            icon: Icon(
              Icons.account_circle,
              size: 30,
            )),
      ],
    );
  }

  Widget _selamatDatang() {
    return Container(
      width: 380,
      height: 45.0,
      decoration: BoxDecoration(
          color: White,
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 5),
            child: Text('Selamat Datang',
                style: GoogleFonts.poppins(
                  fontSize: 10,
                  color: Colors.black,
                )),
          ),
          Text('Muhammad Hanafi Abror',
              style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.bold))
        ],
      ),
    );
  }
}





// void _showDialog() {
//   showModalBottomSheet(context: context, builder: (context) {

//   });
// }

 