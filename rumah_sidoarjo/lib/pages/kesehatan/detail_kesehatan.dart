import 'package:flutter/material.dart';
import 'package:rumah_sidoarjo/custom_template.dart';
import 'package:rumah_sidoarjo/home.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:getwidget/getwidget.dart';

class Detail_Kesehatan extends StatefulWidget {
  @override
  _Detail_KesehatanState createState() => _Detail_KesehatanState();
}

class _Detail_KesehatanState extends State<Detail_Kesehatan> {
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
          title: Text('Detail Layanan Kesehatan'),
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
                'PUSKESMAS SIDOARJO',
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
                        color: Colors.black12,
                        height: 5,
                        thickness: 2,
                      ),
                      SizedBox(height: 10),
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
                          'Puskesmas Pembanatu',
                          style: TextStyle(
                              fontFamily: 'DMSans',
                              fontSize: 14,
                              color: darkGreen),
                        ),
                      ),
                      Divider(
                        color: Colors.black12,
                        height: 5,
                        thickness: 2,
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Kepemilikan',
                          style: TextStyle(
                            fontFamily: 'DMSans',
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Pemerintah',
                          style: TextStyle(
                              fontFamily: 'DMSans',
                              fontSize: 14,
                              color: darkGreen),
                        ),
                      ),
                      Divider(
                        color: Colors.black12,
                        height: 5,
                        thickness: 2,
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Penanggung Jawab',
                          style: TextStyle(
                            fontFamily: 'DMSans',
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Bpk Sandikan Galih',
                          style: TextStyle(
                              fontFamily: 'DMSans',
                              fontSize: 14,
                              color: darkGreen),
                        ),
                      ),
                      Divider(
                        color: Colors.black12,
                        height: 5,
                        thickness: 2,
                      ),
                      SizedBox(height: 10),
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
                        color: Colors.black12,
                        height: 5,
                        thickness: 2,
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 60),
                                child: Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Text(
                                    'Fax',
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
                                  '031-3153262',
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
                        color: Colors.black12,
                        height: 5,
                        thickness: 2,
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Email',
                          style: TextStyle(
                            fontFamily: 'DMSans',
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'puskesmasSidoarjo21@gmail.com',
                          style: TextStyle(
                              fontFamily: 'DMSans',
                              fontSize: 14,
                              color: darkGreen),
                        ),
                      ),
                      Divider(
                        color: Colors.black12,
                        height: 5,
                        thickness: 2,
                      ),
                      SizedBox(height: 20),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Webiste',
                          style: TextStyle(
                            fontFamily: 'DMSans',
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'www.sdBukitTujuh.com',
                          style: TextStyle(
                              fontFamily: 'DMSans',
                              fontSize: 14,
                              color: darkGreen),
                        ),
                      ),
                      Divider(
                        color: Colors.black12,
                        height: 5,
                        thickness: 2,
                      ),
                      SizedBox(height: 20),
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
