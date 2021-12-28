import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:intl/intl.dart';
import 'package:rumah_sidoarjo/akun.dart';
import 'package:rumah_sidoarjo/beritainformasi.dart';
import 'package:rumah_sidoarjo/helper/session_helper.dart';
import 'package:rumah_sidoarjo/layananpublik.dart';
import 'package:rumah_sidoarjo/login.dart';
import 'package:rumah_sidoarjo/lowongankerja.dart';
import 'package:rumah_sidoarjo/models/list_berita.dart';
import 'package:rumah_sidoarjo/pages/Pengaduan/pengaduan.dart';
import 'package:rumah_sidoarjo/pages/berita/detail_berita.dart';
import 'package:rumah_sidoarjo/pages/cctv.dart';
import 'package:rumah_sidoarjo/pages/media_massa.dart';
import 'package:rumah_sidoarjo/pages/panik_menu/panik_menu.dart';
import 'package:rumah_sidoarjo/pages/pariwisata/pariwisata.dart';
import 'package:rumah_sidoarjo/pages/pendidikan/pendidikan.dart';
import 'package:rumah_sidoarjo/pages/umkm/umkm.dart';
import 'package:rumah_sidoarjo/services/api_berita.dart';
import 'package:rumah_sidoarjo/tagihan.dart';
import 'custom_template.dart';
import 'package:google_fonts/google_fonts.dart';
import 'pages/kesehatan/kesehatan.dart';

class Home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<Home> {
  final ApiBerita api = ApiBerita();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: appBar(),
        body: ListView(
          children: [
            _selamatDatang(),
            SizedBox(
              height: 20,
            ),
            _menu(),
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
              padding: EdgeInsets.only(top: 15, left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () => {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return Beritainformasi();
                            },
                          ),
                        ),
                      },
                      child: Text(
                        'Lihat Semua',
                        // textAlign: TextAlign.right,
                        style: GoogleFonts.openSans(
                            fontSize: 12, color: darkGreen),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            _ListViewBerita(),
            Padding(
              padding: EdgeInsets.only(top: 15, left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  Align(
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
                ],
              ),
            ),
            _ListViewWisata(),
            Padding(
              padding: EdgeInsets.only(top: 15, left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  Align(
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
      padding: EdgeInsets.only(top: 15),
      width: double.infinity,
      height: 180,
      color: White,
      child: ListView(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            FlatButton(
              onPressed: () => {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return PanikMenu();
                    },
                  ),
                ),
              },
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/panik_menu.png',
                    width: 45,
                    height: 45,
                  ),
                  SizedBox(height: 5),
                  Text('PANIC MENU', style: iconText)
                ],
              ),
            ),
            FlatButton(
              onPressed: () => {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return Pengaduan();
                    },
                  ),
                ),
              },
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/Pengaduan.png',
                    width: 45,
                    height: 45,
                  ),
                  SizedBox(height: 5),
                  Text('PENGADUAN', style: iconText)
                ],
              ),
            ),
            FlatButton(
              onPressed: () => {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return Kesehatan();
                    },
                  ),
                ),
              },
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/Kesehatan.png',
                    width: 45,
                    height: 45,
                  ),
                  SizedBox(height: 5),
                  Text('KESEHATAN', style: iconText)
                ],
              ),
            ),
          ]),
          Padding(padding: EdgeInsets.only(top: 15)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FlatButton(
                onPressed: () => {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return Pendidikan();
                      },
                    ),
                  ),
                },
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/Pendidikan.png',
                      width: 45,
                      height: 45,
                    ),
                    SizedBox(height: 5),
                    Text('PENDIDIKAN', style: iconText)
                  ],
                ),
              ),
              Column(
                children: [
                  FlatButton(
                    onPressed: () => {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return Pariwisata();
                          },
                        ),
                      ),
                    },
                    child: Image.asset(
                      'assets/images/Pariwisata.png',
                      width: 45,
                      height: 45,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'PARIWISATA',
                    style: iconText,
                  )
                ],
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
                    SizedBox(height: 5),
                    Text('Lainnya', style: iconText)
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
                          style: GoogleFonts.poppins(
                              fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      FlatButton(
                        onPressed: () => {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return Cctv();
                              },
                            ),
                          ),
                        },
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/images/cctv.png',
                              width: 45,
                              height: 45,
                            ),
                            SizedBox(height: 5),
                            Text('CCTV', style: iconText)
                          ],
                        ),
                      ),
                      FlatButton(
                        onPressed: () => {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return LayananPublik();
                              },
                            ),
                          ),
                        },
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/images/layanan_publik.png',
                              width: 45,
                              height: 45,
                            ),
                            SizedBox(height: 5),
                            Text('LAYANAN PUBLIK', style: iconText)
                          ],
                        ),
                      ),
                      FlatButton(
                        onPressed: () => {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return Tagihan();
                              },
                            ),
                          ),
                        },
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/images/Tagihan.png',
                              width: 45,
                              height: 45,
                            ),
                            SizedBox(height: 5),
                            Text('TAGIHAN', style: iconText)
                          ],
                        ),
                      ),
                    ]),
                Padding(padding: EdgeInsets.only(top: 20)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    FlatButton(
                      onPressed: () => {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return MediaMassa();
                            },
                          ),
                        ),
                      },
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/images/media_massa.png',
                            width: 45,
                            height: 45,
                          ),
                          SizedBox(height: 5),
                          Text('MEDIA MASSA', style: iconText)
                        ],
                      ),
                    ),
                    FlatButton(
                      onPressed: () => {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return Umkm();
                            },
                          ),
                        ),
                      },
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/images/umkm.png',
                            width: 45,
                            height: 45,
                          ),
                          SizedBox(height: 5),
                          Text('UMKM', style: iconText)
                        ],
                      ),
                    ),
                    FlatButton(
                      onPressed: () => {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return Lowongankerja();
                            },
                          ),
                        ),
                      },
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/images/job.png',
                            width: 45,
                            height: 45,
                          ),
                          SizedBox(height: 5),
                          Text('PEKERJAAN', style: iconText)
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
                                  maxLines: 2,
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
      padding: const EdgeInsets.symmetric(horizontal: 15),
      height: 100,
      child: FutureBuilder<List<ListBeritaModel>>(
          future: api.getBerita(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final berita = snapshot.data![index];

                  return GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return DetailBerita(berita: berita);
                        },
                      ),
                    ),
                    child: Container(
                      width: 260,
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            child: Row(
                              children: [
                                Image.network(
                                  "https://www.sidoarjokab.go.id/${berita.thumb}",
                                  width: 100,
                                  fit: BoxFit.cover,
                                ),
                                Expanded(
                                  child: Column(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.only(left: 10),
                                        height: 30,
                                        width: 180,
                                        child: Text(
                                          berita.judul,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                          style: const TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        height: 30,
                                        width: 180,
                                        child: Text(
                                          DateFormat('dd MMMM')
                                              .format(berita.tgl),
                                          maxLines: 2,
                                          style: const TextStyle(
                                            fontSize: 10,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
                itemCount: 5,
              );
            }

            return Center(child: CircularProgressIndicator());
          }),
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
                                        maxLines: 2,
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
    Image.asset('assets/images/no_image.png', width: 50),
    Image.asset('assets/images/no_image.png', width: 50),
    Image.asset('assets/images/no_image.png', width: 50),
    Image.asset('assets/images/no_image.png', width: 50),
    Image.asset('assets/images/no_image.png', width: 50),
  ];

  FlatButton _TrophyMasks() {
    return FlatButton(
      onPressed: () => {},
      child: Container(
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [lightGreen, darkGreen1],
                end: Alignment.centerRight,
                begin: Alignment.centerLeft),
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Padding(
          padding: const EdgeInsets.only(right: 30, left: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  width: 200,
                  child: Text('Ayo cari tau agenda yang akan dilaksanakan',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.roboto(
                          fontSize: 14,
                          color: White,
                          fontWeight: FontWeight.bold))),
              Image.asset(
                'assets/images/TrophyMasks.png',
                width: 90,
                height: 90,
              )
            ],
          ),
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
        FutureBuilder<bool>(
          future: SessionHelper.checkisLogin(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data!) {
                return IconButton(
                    onPressed: () => {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return Akun();
                          }))
                        },
                    icon: Icon(
                      Icons.account_circle,
                      size: 30,
                    ));
              }

              return TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return LoginPage();
                  }));
                },
                child:
                    const Text('Login', style: TextStyle(color: Colors.white)),
              );
            }

            return const SizedBox();
          },
        ),
      ],
    );
  }

  Widget _selamatDatang() {
    return FutureBuilder<bool>(
        future: SessionHelper.checkisLogin(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data! == false) {
              return const SizedBox();
            }
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                width: double.infinity,
                height: 45.0,
                decoration: BoxDecoration(
                    color: White,
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(20))),
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
                    FutureBuilder<String>(
                        future: SessionHelper.getNama(),
                        builder: (context, snapshot) {
                          String nama = '---';

                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            nama = '---';
                          }

                          if (snapshot.hasData) {
                            if (snapshot.data!.isEmpty) {
                              nama = 'Pengunjung';
                            } else {
                              nama = snapshot.data!;
                            }
                          } else {
                            nama = '---';
                          }

                          return Text(nama,
                              style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold));
                        })
                  ],
                ),
              ),
            );
          }

          return const SizedBox();
        });
  }
}





// void _showDialog() {
//   showModalBottomSheet(context: context, builder: (context) {

//   });
// }

 