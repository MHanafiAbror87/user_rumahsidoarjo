import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rumah_sidoarjo/custom_template.dart';
import 'package:rumah_sidoarjo/home.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rumah_sidoarjo/pages/Tagihan/cek_tagihan.dart';

class Tagihan extends StatefulWidget {
  static String routeName = "/tagihan";
  @override
  _Tagihan createState() => _Tagihan();
}

class _Tagihan extends State<Tagihan> {
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
          ],
        ),
      ),
    );
  }

  Widget _headerPage() {
    return Container(
      height: 158,
      decoration: headerDecoration,
      child: Column(
        children: [
          SizedBox(height: 30),
          Text(
            'Tagihan',
            style: headerTextStyle,
          ),
          Center(
            child: Container(
              width: 330,
              child: Text(
                'Ayo cari tau jumlah Tagihan anda, dan jangan lupa untuk membayar tepat Waktu!',
                textAlign: TextAlign.center,
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
      title: Text('Tagihan'),
      backgroundColor: darkGreen1,
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
            height: 65,
            child: GestureDetector(
              onTap: () => {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return CekTagihan();
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
                    child: Center(
                      child: Row(
                        children: [
                          Container(
                            width: 320,
                            height: 25,
                            child: Column(
                              children: [
                                Text(
                                  kategori[index],
                                  style: textKategori,
                                ),
                              ],
                            ),
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
          ),
        );
      },
    );
  }
}

final List kategori = [
  "PLN",
  "PDAM",
  "PBB",
  "TELKOM",
];

// final List subKategori = [
//   "Pencurian, Pembunuhan, Pemerkosaan, Dll",
//   "Kecelakaan saat berkendara di Jalan",
//   "Kebakaran, Banjir, Longsor, Pohon Tumbang, Dll",
//   "Kebakaran, Banjir, Longsor, Pohon Tumbang, Dll",
// ];
