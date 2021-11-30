import 'package:flutter/material.dart';
import 'package:rumah_sidoarjo/custom_template.dart';
import 'package:rumah_sidoarjo/home.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:getwidget/getwidget.dart';

class Detail_pariwisata extends StatefulWidget {
  @override
  _Detail_pariwisataState createState() => _Detail_pariwisataState();
}

class _Detail_pariwisataState extends State<Detail_pariwisata> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                child: Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage('assets/images/no_image.png')),
                  ),
                ),
              ),
              Text(
                'Nama tempat Wisata',
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
                          'Jl. Diponegoro No. 139 Sidoarjo',
                          style: TextStyle(
                              fontFamily: 'DMSans',
                              fontSize: 14,
                              color: darkGreen),
                        ),
                      ),
                      Divider(
                        color: Colors.grey,
                        height: 25,
                        thickness: 2,
                      ),
                      Align(
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
                          'Pemancingan',
                          style: TextStyle(
                              fontFamily: 'DMSans',
                              fontSize: 14,
                              color: darkGreen),
                        ),
                      ),
                      Divider(
                        color: Colors.grey,
                        height: 25,
                        thickness: 2,
                      ),
                      Align(
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
                          'Harisman Sihombing',
                          style: TextStyle(
                              fontFamily: 'DMSans',
                              fontSize: 14,
                              color: darkGreen),
                        ),
                      ),
                      Divider(
                        color: Colors.grey,
                        height: 25,
                        thickness: 2,
                      ),
                      Row(
                        children: [
                          Column(
                            children: [
                              Padding(
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
                                  '031-8941104',
                                  style: TextStyle(
                                      fontFamily: 'DMSans',
                                      fontSize: 14,
                                      color: darkGreen),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 200),
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
                      ),
                      Divider(
                        color: Colors.grey,
                        height: 25,
                        thickness: 2,
                      ),
                      Row(
                        children: [
                          Column(
                            children: [
                              Padding(
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
                                  'Buka : 09:00 Wib',
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
                              Padding(
                                padding: const EdgeInsets.only(right: 27),
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
                                  'Tutup : 20:00 WIb',
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
                      Divider(
                        color: Colors.grey,
                        height: 25,
                        thickness: 2,
                      ),
                      SizedBox(height: 20),
                      Column(
                        children: [
                          Text(
                            'TARIF TIKET',
                            style: TextStyle(
                              fontFamily: 'DMSans',
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 10),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 35.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Anak-anak',
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
                            padding:
                                const EdgeInsets.symmetric(horizontal: 35.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Dewasa',
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
                            padding:
                                const EdgeInsets.symmetric(horizontal: 35.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Akhir Pekan',
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
                            padding:
                                const EdgeInsets.symmetric(horizontal: 25.0),
                            child: Divider(
                              color: Colors.grey,
                              height: 25,
                              thickness: 2,
                            ),
                          ),
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
                            padding:
                                const EdgeInsets.symmetric(horizontal: 35.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            padding:
                                const EdgeInsets.symmetric(horizontal: 35.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            padding:
                                const EdgeInsets.symmetric(horizontal: 35.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
