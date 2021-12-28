import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rumah_sidoarjo/custom_template.dart';
import 'package:rumah_sidoarjo/home.dart';
import 'package:rumah_sidoarjo/pages/kesehatan/pkmp.dart';
import 'package:rumah_sidoarjo/pages/kesehatan/pkmu.dart';
import 'package:rumah_sidoarjo/pages/kesehatan/rsu.dart';
import 'package:rumah_sidoarjo/pages/pariwisata/pemancingan.dart';

class Kesehatan extends StatefulWidget {
  Kesehatan({Key? key}) : super(key: key);

  @override
  _KesehatanState createState() => _KesehatanState();
}

class _KesehatanState extends State<Kesehatan> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey.shade300,
        appBar: appBar(),
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: SingleChildScrollView(
            child: Stack(
              children: <Widget>[
                _headerPage(),
                tabCon(),
              ],
            ),
          ),
        ),
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
      title: Text('Kesehatan'),
      backgroundColor: darkGreen1,
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
            'Layanan Kesehatan',
            style: headerTextStyle,
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: Container(
              width: 330,
              child: Text(
                'Ayo Cari Layanan Kesehatan Terdekat',
                textAlign: TextAlign.center,
                style: headerSubTextStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class tabCon extends StatelessWidget {
  const tabCon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 170.0, left: 10, right: 10),
        child: DefaultTabController(
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
                      borderRadius: BorderRadius.circular(30)),
                  labelColor: White,
                  labelStyle:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  unselectedLabelColor: darkGrey,
                  unselectedLabelStyle: TextStyle(fontSize: 14),
                  tabs: [
                    Tab(child: Text('PKM Utama')),
                    Tab(
                        child: Text(
                      'PKM Pembantu',
                      textAlign: TextAlign.center,
                    )),
                    Tab(child: Text('Rumah Sakit')),
                  ]),
              SizedBox(height: 10),
              Container(
                height: 595,
                width: double.infinity,
                child: TabBarView(
                  children: [
                    Pkmu(),
                    Pkmp(),
                    Rsu(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
