import 'package:flutter/material.dart';
import 'package:rumah_sidoarjo/custom_template.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rumah_sidoarjo/home.dart';
import 'package:rumah_sidoarjo/pages/panik_menu/panik_menu.dart';
import 'package:rumah_sidoarjo/pariwisata.dart';

class PusatInformasi extends StatefulWidget {
  @override
  _PusatInformasiState createState() => _PusatInformasiState();
}

class _PusatInformasiState extends State<PusatInformasi> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey.shade300,
        appBar: AppBar(
          leading: FlatButton(
            child: Icon(
              Icons.arrow_back_ios,
              color: White,
            ),
            onPressed: () => Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) {
              return Pariwisata();
            })),
          ),
          title: Text('Pusat Informasi Pariwisata Sidoarjo',
              style: TextStyle(fontSize: 18)),
          backgroundColor: darkGreen1,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Container(
                    width: double.infinity,
                    height: 250,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage('assets/images/IU.jpg')))),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  width: double.infinity,
                  height: 270,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20), color: White),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Tourist Information Center (TIC)',
                            style: GoogleFonts.dmSans(
                                fontSize: 14, fontWeight: FontWeight.bold)),
                        Text('Pusat Informasi Pariwisata Sidoarjo',
                            style: GoogleFonts.dmSans(fontSize: 12)),
                        SizedBox(height: 10),
                        Text('Alamat', style: GoogleFonts.dmSans(fontSize: 16)),
                        Text('Jl. Sultan Agung No. 34, Sidoarjo',
                            style: GoogleFonts.dmSans(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: darkGreen)),
                        Divider(
                          color: Colors.black,
                          height: 25,
                          thickness: 2,
                        ),
                        Text('Pengelola',
                            style: GoogleFonts.dmSans(fontSize: 16)),
                        Text(
                            'Dinas Kepemudaan Olahraga dan Pariwisata Sidoarjo',
                            style: GoogleFonts.dmSans(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: darkGreen)),
                        Divider(
                          color: Colors.black,
                          height: 25,
                          thickness: 2,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Telepon',
                                    style: GoogleFonts.dmSans(fontSize: 16)),
                                Text('031-8941104',
                                    style: GoogleFonts.dmSans(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: darkGreen)),
                              ],
                            ),
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
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Container(
                  height: 300,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20), color: White),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Lokasi TIC',
                            style: GoogleFonts.dmSans(
                                fontSize: 16, fontWeight: FontWeight.bold))
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Ulasan',
                        style: GoogleFonts.dmSans(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    Text('Lihat Semua',
                        style: GoogleFonts.dmSans(
                            fontSize: 14, color: darkGreen1)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Container(
                  height: 270,
                  child: ListView.builder(
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 2),
                        child: Container(
                          height: 130,
                          child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                            width: 50,
                                            height: 50,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                image: DecorationImage(
                                                    image:
                                                        AssetImage(gambar[0]),
                                                    fit: BoxFit.fill))),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                nama[index],
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(
                                                tanggal[index],
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontFamily: "DMSans"),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      ulasan[index],
                                      maxLines: 2,
                                      style: TextStyle(
                                          fontSize: 14, fontFamily: "DMSans"),
                                    )
                                  ],
                                ),
                              )),
                        ),
                      );
                    },
                  ),
                ),
              ),
              FlatButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      content: Column(
                        children: [
                          Row(
                            children: [
                              Image(
                                image:
                                    AssetImage('assets/images/Pengaduan.png'),
                                width: 70,
                                height: 70,
                                fit: BoxFit.fill,
                              ),
                            ],
                          ),
                          Text('Ulasan Layanan')
                        ],
                      ),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () => {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return Home();
                                },
                              ),
                            ),
                          },
                          child: const Text('Log In'),
                        ),
                      ],
                    ),
                  );
                },
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
          ),
        ),
      ),
    );
  }
}

final List nama = [
  "Harisman Sihombing",
  "Nafis Hibatullah Lestamanta",
  "Ajeng Ayu Pangesti",
  "Muhammad Hanafi Abror",
];

final List tanggal = [
  "15 september 2021",
  "15 oktober 2021",
];

final List ulasan = [
  "Aplikasi bagus, sangat menarik Aplikasi bagus, sangat menarik Aplikasi bagus, sangat menarik Aplikasi bagus, sangat menarik",
  "Aplikasi nya terbaik",
];

final List gambar = ["assets/images/Pengaduan.png", "assets/images/Topeng.png"];
