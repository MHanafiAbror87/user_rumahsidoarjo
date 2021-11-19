import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rumah_sidoarjo/custom_template.dart';
import 'package:rumah_sidoarjo/home.dart';
import 'package:rumah_sidoarjo/pages/Pengaduan/detailpengaduan.dart';

class Pengaduan extends StatefulWidget {
  static String routeName = "/pengaduan";
  @override
  _PengaduanState createState() => _PengaduanState();
}

class _PengaduanState extends State<Pengaduan> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey.shade300,
        appBar: appBar(),
        body: Column(
          children: [
            _headerPage(),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: listKategori(),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 30.0, bottom: 40),
              child:
                  Align(alignment: Alignment.centerRight, child: _historyBtn()),
            ),
          ],
        ),
      ),
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
          SizedBox(height: 10),
          Text(
            'Pengaduan',
            style: headerTextStyle,
          ),
          Center(
            child: Container(
              width: 330,
              child: Text(
                'Ayo adukan kerusakan fasilitas publik di lingkungan Anda agar segera mendapatkan penanganan dari dinas terkait',
                textAlign: TextAlign.justify,
                style: headerSubTextStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      elevation: 0,
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
      title: Text('Pengaduan'),
      backgroundColor: darkGreen1,
    );
  }

  Widget _historyBtn() {
    return Ink(
      decoration: ShapeDecoration(
        shape: CircleBorder(),
        color: White,
      ),
      child: IconButton(
        onPressed: () {},
        icon: Image.asset('assets/images/history.png'),
        iconSize: 50,
      ),
    );
  }
}

class listKategori extends StatelessWidget {
  const listKategori({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: kategori.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
          child: Container(
            height: 100,
            child: GestureDetector(
              onTap: () => {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return DetailPengaduan();
                    },
                  ),
                ),
              },
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Container(
                              width: 320,
                              height: 70,
                              child: Center(
                                child: Column(
                                  children: [
                                    Text(
                                      kategori[index],
                                      style: textKategori,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      subKategori[index],
                                      textAlign: TextAlign.center,
                                      style: textSubKategori,
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Image.asset(
                            'assets/images/arrow_forward.png',
                            width: 20,
                            height: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

final List kategori = [
  "Pelayanan",
  "Fasilitas Publik",
  "Kesehatan",
];

final List subKategori = [
  "Kependudukan, Perizinan, Pajak Daerah, PDAM, dll",
  "Infrastruktur, Pasar, Rusunawa, Penerangan Jalan, CCTV, dll",
  "Gizi Buruk/Stunting, Fasilitas Kesehatan, Mal Praktik Kesehatan, dll",
];
