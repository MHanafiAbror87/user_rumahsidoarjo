import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rumah_sidoarjo/custom_template.dart';
import 'package:rumah_sidoarjo/home.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../beritainformasi.dart';

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

  Widget _headerPage() {
    return Container(
      height: 158,
      decoration: headerDecoration,
      child: Column(
        children: [
          SizedBox(height: 30),
          Text(
            'Panik Menu',
            style: headerTextStyle,
          ),
          Center(
            child: Container(
              width: 330,
              child: Text(
                'Jangan Takut untuk Lapor!',
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
      title: Text('Panik Menu'),
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
            child: GestureDetector(
              onTap: () {},
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Container(
                              width: 320,
                              height: 55,
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
  "Kriminal",
  "Kecelakaan",
  "Bencana Alam/Lingkungan",
];

final List subKategori = [
  "Pencurian, Pembunuhan, Pemerkosaan, Dll",
  "Kecelakaan saat berkendara di Jalan",
  "Kebakaran, Banjir, Longsor, Pohon Tumbang, Dll",
];
