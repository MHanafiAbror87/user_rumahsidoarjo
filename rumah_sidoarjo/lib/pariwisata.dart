import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rumah_sidoarjo/custom_template.dart';
import 'package:rumah_sidoarjo/home.dart';
import 'package:rumah_sidoarjo/pages/pariwisata/pemancingan.dart';
import 'package:rumah_sidoarjo/pages/pariwisata/pusatinformasi.dart';
import 'package:rumah_sidoarjo/pages/pariwisata/sejarah.dart';

class Pariwisata extends StatefulWidget {
  @override
  _PariwisataState createState() => _PariwisataState();
}

class _PariwisataState extends State<Pariwisata> {
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: GestureDetector(
                onTap: () => {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return PusatInformasi();
                  }))
                },
                child: Container(
                  width: double.infinity,
                  height: 110,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20), color: White),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                          width: 90,
                          height: 90,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [lightGreen, darkGreen1],
                                  end: Alignment.centerRight,
                                  begin: Alignment.centerLeft),
                              borderRadius: BorderRadius.circular(10),
                              color: darkGreen),
                          child: Icon(
                            Icons.home_outlined,
                            color: White,
                            size: 70,
                          )),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 25),
                          Text('Pusat Informasi Wisata',
                              style: GoogleFonts.dmSans(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: darkGreen)),
                          Container(
                            width: 200,
                            height: 40,
                            child: Text(
                                'Dinas Kepemudaan Olahraga & Pariwisata Sidoarjo',
                                style: GoogleFonts.dmSans(
                                    fontSize: 12, color: darkGrey)),
                          ),
                        ],
                      ),
                      Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [lightGreen, darkGreen1],
                                  end: Alignment.centerRight,
                                  begin: Alignment.centerLeft),
                              borderRadius: BorderRadius.circular(10),
                              color: darkGreen),
                          child: Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: White,
                            size: 25,
                          )),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text('Pilihan Wisata',
                    style: GoogleFonts.dmSans(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Black)),
              ),
            ),
            DefaultTabController(
                length: 3,
                child: Column(
                  children: [
                    TabBar(
                        indicatorSize: TabBarIndicatorSize.tab,
                        indicatorColor: darkGreen1,
                        indicator: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [lightGreen, darkGreen1],
                                end: Alignment.centerRight,
                                begin: Alignment.centerLeft),
                            borderRadius: BorderRadius.circular(20)),
                        labelColor: White,
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14),
                        unselectedLabelColor: darkGrey,
                        unselectedLabelStyle: TextStyle(fontSize: 14),
                        tabs: [
                          Tab(child: Text('Pemancingan')),
                          Tab(child: Text('Sejarah')),
                          Tab(child: Text('Kuliner')),
                        ]),
                    SizedBox(height: 10),
                    Container(
                        height: 450,
                        width: double.infinity,
                        child: TabBarView(
                          children: [
                            Pemancingan(),
                            Pemancingan(),
                            Pemancingan(),
                          ],
                        ))
                  ],
                ))
          ],
        ),
      ),
    );
  }

  Container _headerPage() {
    return Container(
      height: 120,
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
          SizedBox(height: 20),
          Text(
            'Wisata Populer',
            style: headerTextStyle,
          ),
          Center(
            child: Container(
              width: 330,
              child: Text(
                'Di Kabupaten Sidoarjo',
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
      title: Text('Pariwisata'),
      backgroundColor: darkGreen1,
    );
  }
}
