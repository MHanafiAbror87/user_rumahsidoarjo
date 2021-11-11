import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rumah_sidoarjo/custom_template.dart';
import 'package:rumah_sidoarjo/home.dart';
import 'package:google_fonts/google_fonts.dart';

class PanikMenu extends StatefulWidget {
  static String routeName = "/panik";
  @override
  _PanikState createState() => _PanikState();
}

class _PanikState extends State<PanikMenu> {
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
            Expanded(
                child: ListView.builder(
                    itemCount: kategori.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 2),
                        child: Container(
                          height: 85,
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                children: [
                                  Column(
                                    children: [
                                      Container(
                                        width: 300,
                                        height: 55,
                                        child: Center(
                                          child: Column(
                                            children: [
                                              Text(
                                                kategori[index],
                                                style: textKategori,
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
                                    padding: const EdgeInsets.only(left: 10),
                                    child: IconButton(
                                        onPressed: () {
                                          Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) {
                                                return Home();
                                              },
                                            ),
                                          );
                                        },
                                        icon: Icon(
                                          Icons.arrow_forward_ios,
                                          size: 25,
                                        )),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }))
          ],
        ),
      ),
    );
  }

  Container _headerPage() {
    return Container(
      height: 158,
      decoration: headerDecoration,
      child: Column(
        children: [
          SizedBox(height: 10),
          Text(
            'Panik Menu',
            style: headerTextStyle,
          ),
          Center(
            child: Container(
              width: 330,
              child: Text(
                'Jangan Takut untuk Lapor!',
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
      title: Text('Syarat & Ketentuan'),
      backgroundColor: darkGreen1,
    );
  }
}

final List kategori = [
  "Kriminal",
  "Kecelakaan",
  "Bencana Alam/Lingkungan",
];

final List subKategori = [
  "Pencurian, Pembunuhan, Pemerkosaan, Dll",
  "Kecelakaan saat berkendara di Jalan",
  "Kebakaran, Banjir, Longsor, Pohon Tumbang, Dll",
];
