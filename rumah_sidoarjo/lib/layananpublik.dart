import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rumah_sidoarjo/custom_template.dart';
import 'package:rumah_sidoarjo/home.dart';

class LayananPublik extends StatefulWidget {
  static String routeName = "/layanan";
  @override
  _LayananPublik createState() => _LayananPublik();
}

class _LayananPublik extends State<LayananPublik> {
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
            'Layanan Publik',
            style: headerTextStyle,
          ),
          Center(
            child: Container(
              width: 330,
              child: Text(
                'Ayo cari tau syarat pembuatan dokumen kependudukan',
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
      title: Text('Layanan Publik'),
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
              onTap: () {},
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        Image.asset(
                          'assets/images/arrow_forward.png',
                          width: 20,
                          height: 20,
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
  "Pelatihan Untuk Masyarakat",
  "Beasiswa Pendidikan",
  "KTP",
  "SIM",
  "SKCK",
  "Kartu Keluarga",
  "Akta Kelahiran",
  "Akta Kematian",
  "Kartu Pencari Kerja",
  "Pembuatan KTP Baru",
  "KTP Hilang Atau Rusak",
  "KTP Perubahan Data",
];

// final List subKategori = [
//   "Pencurian, Pembunuhan, Pemerkosaan, Dll",
//   "Kecelakaan saat berkendara di Jalan",
//   "Kebakaran, Banjir, Longsor, Pohon Tumbang, Dll",
//   "Kebakaran, Banjir, Longsor, Pohon Tumbang, Dll",
// ];
