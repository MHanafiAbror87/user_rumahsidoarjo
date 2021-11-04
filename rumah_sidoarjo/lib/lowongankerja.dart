import 'package:flutter/material.dart';
import 'package:rumah_sidoarjo/beritainformasi.dart';
import 'package:rumah_sidoarjo/home.dart';
import 'custom_template.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:getwidget/getwidget.dart';

class Lowongankerja extends StatefulWidget {
  @override
  _LowongankerjaState createState() => _LowongankerjaState();
}

class _LowongankerjaState extends State<Lowongankerja> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: appBar(),
        body: Column(
          children: [
            _headerPage(),
            Padding(padding: EdgeInsets.only(top: 10)),
            _listViewJob()
          ],
        ),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      leading: FlatButton(
        child: Icon(
          Icons.arrow_back_ios,
          color: White,
        ),
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
      ),
      title: Text('Lowongan Pekerjaan'),
      backgroundColor: darkGreen1,
    );
  }

  Container _headerPage() {
    return Container(
      height: 158,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [lightGreen, darkGreen1],
              end: Alignment.centerRight,
              begin: Alignment.centerLeft),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30))),
      child: Column(
        children: [
          SizedBox(height: 30),
          Text(
            'Lowongan Pekerjaan',
            style: TextStyle(
                color: White,
                fontSize: 30,
                letterSpacing: 2,
                fontWeight: FontWeight.bold,
                fontFamily: 'DMSans'),
          ),
          Center(
            child: Container(
              width: 330,
              child: Text(
                'Ayo cari lowongan pekerjaan yang tersedia di Kabupaten Sidoarjo',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: White,
                    fontSize: 15,
                    letterSpacing: 2,
                    fontFamily: 'DMSans'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _listViewJob extends StatelessWidget {
  const _listViewJob({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: berita.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
            child: Container(
              height: 100,
              child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        gambar[0],
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Container(
                                height: 20,
                                width: 300,
                                child: Text(
                                  berita[index],
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Container(
                                  height: 20,
                                  width: 300,
                                  child: Text(
                                    job[0],
                                    style: TextStyle(
                                        fontSize: 12, fontFamily: "DMSans"),
                                  )),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10, top: 10),
                              child: Container(
                                  height: 20,
                                  width: 300,
                                  child: Text(
                                    alamat[0],
                                    style: TextStyle(
                                        color: darkGreen,
                                        fontSize: 12,
                                        fontFamily: "DMSans"),
                                  )),
                            )
                          ],
                        )
                      ],
                    ),
                  )),
            ),
          );
        },
      ),
    );
  }
}

class _headerPage extends StatelessWidget {
  const _headerPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 158,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [lightGreen, darkGreen1],
              end: Alignment.centerRight,
              begin: Alignment.centerLeft),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30))),
      child: Column(
        children: [
          SizedBox(height: 30),
          Text(
            'Lowongan Pekerjaan',
            style: TextStyle(
                color: White,
                fontSize: 30,
                letterSpacing: 2,
                fontWeight: FontWeight.bold,
                fontFamily: 'DMSans'),
          ),
          Center(
            child: Container(
              width: 330,
              child: Text(
                'Ayo cari lowongan pekerjaan yang tersedia di Kabupaten Sidoarjo',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: White,
                    fontSize: 15,
                    letterSpacing: 2,
                    fontFamily: 'DMSans'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

final List berita = [
  "Dinas Komunikasi dan Informatika",
  "PT Pilar Sentosa",
  "Rumah Batik Sidoarjo",
  "Benang Raja",
  "Dinas Komunikasi dan Informatika",
  "PT Pilar Sentosa",
  "Rumah Batik Sidoarjo",
  "Benang Raja",
  "Dinas Komunikasi dan Informatika",
  "PT Pilar Sentosa",
  "Rumah Batik Sidoarjo",
  "Benang Raja",
  "Dinas Komunikasi dan Informatika",
  "PT Pilar Sentosa",
  "Rumah Batik Sidoarjo",
  "Benang Raja",
  "Dinas Komunikasi dan Informatika",
  "PT Pilar Sentosa",
  "Rumah Batik Sidoarjo",
  "Benang Raja",
  "Dinas Komunikasi dan Informatika",
  "PT Pilar Sentosa",
  "Rumah Batik Sidoarjo",
  "Benang Raja",
];

final List job = [
  "UI/UX Designer",
  "Administrator IT",
  "UI/UX Designer",
];

final List alamat = [
  "Jl. Diponegoro No. 139. Lemahputro - Sidoarjo",
  "Jl. Imam Bonjol No. 19. Sukodono - Sidoarjo",
  "Jl. Pahlawan No. 139 Sidoarjo",
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
