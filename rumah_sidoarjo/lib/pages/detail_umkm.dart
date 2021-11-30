import 'package:flutter/material.dart';
import 'package:rumah_sidoarjo/custom_template.dart';
import 'package:rumah_sidoarjo/home.dart';
import 'package:google_fonts/google_fonts.dart';

class Detail_Umkm extends StatefulWidget {
  @override
  _Detail_UmkmState createState() => _Detail_UmkmState();
}

class _Detail_UmkmState extends State<Detail_Umkm> {
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
          title: Text('Detail UMKM'),
          backgroundColor: darkGreen1,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 10),
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
              'Disini Tempat nama UMKM',
              style: TextStyle(
                  fontFamily: 'DMSans',
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
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
                      'Kerajinan',
                      style: TextStyle(
                          fontFamily: 'DMSans', fontSize: 14, color: darkGreen),
                    ),
                  ),
                  Divider(
                    color: Colors.black,
                    height: 25,
                    thickness: 2,
                  ),
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
                      'Disini Alamat UMKM',
                      style: TextStyle(
                          fontFamily: 'DMSans', fontSize: 14, color: darkGreen),
                    ),
                  ),
                  Divider(
                    color: Colors.black,
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
                            style:
                                GoogleFonts.poppins(fontSize: 14, color: White),
                          ))),
                    ],
                  ),
                  Divider(
                    color: Colors.black,
                    height: 25,
                    thickness: 2,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Website/Media Sosial',
                      style: TextStyle(
                        fontFamily: 'DMSans',
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Disini bisa link webiste bisa link Media Sosial',
                      style: TextStyle(
                          fontFamily: 'DMSans', fontSize: 14, color: darkGreen),
                    ),
                  ),
                  Divider(
                    color: Colors.black,
                    height: 25,
                    thickness: 2,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Deskripsi',
                      style: TextStyle(
                        fontFamily: 'DMSans',
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Disini berisi detail dari umkm.',
                      style: TextStyle(
                          fontFamily: 'DMSans', fontSize: 14, color: darkGreen),
                    ),
                  ),
                  Divider(
                    color: Colors.black,
                    height: 25,
                    thickness: 2,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Rute Toko',
                      style: TextStyle(
                        fontFamily: 'DMSans',
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Link Mengarah ke google Maps',
                      style: TextStyle(
                          fontFamily: 'DMSans', fontSize: 14, color: darkGreen),
                    ),
                  ),
                  Divider(
                    color: Colors.black,
                    height: 25,
                    thickness: 2,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
