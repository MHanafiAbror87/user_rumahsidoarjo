import 'package:flutter/material.dart';
import 'package:rumah_sidoarjo/custom_template.dart';
import 'package:rumah_sidoarjo/home.dart';
import 'package:google_fonts/google_fonts.dart';

class Detail_lowongankerja extends StatefulWidget {
  @override
  _Detail_lowongankerjaState createState() => _Detail_lowongankerjaState();
}

class _Detail_lowongankerjaState extends State<Detail_lowongankerja> {
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
          title: Text('Detail Lowongan Pekerjaan'),
          backgroundColor: darkGreen1,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Container(
                width: double.infinity,
                height: 250,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('assets/images/IU.jpg')),
                ),
              ),
            ),
            Text(
              'Dinas Komunikasi Dan Informatika',
              style: TextStyle(
                  fontFamily: 'DMSans',
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
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
                      'Website',
                      style: TextStyle(
                        fontFamily: 'DMSans',
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'https://diskominfo.sidoarjokab.go.id',
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
                      'Detail',
                      style: TextStyle(
                        fontFamily: 'DMSans',
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Detail lowongan pekerjaan dapat dimasukkan disini sebagai informasi tambahan bagi para pencari kerja.',
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
                      'Persyaratan',
                      style: TextStyle(
                        fontFamily: 'DMSans',
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                        width: 200,
                        height: 37,
                        decoration: BoxDecoration(
                          color: darkGreen1,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                              child: Text(
                            'Unduh Persyaratan Berkas',
                            style: GoogleFonts.poppins(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: White),
                          )),
                        )),
                  ),
                  Divider(
                    color: Colors.black,
                    height: 25,
                    thickness: 2,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Lokasi Perusahaan',
                      style: TextStyle(
                        fontFamily: 'DMSans',
                        fontSize: 16,
                      ),
                    ),
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
