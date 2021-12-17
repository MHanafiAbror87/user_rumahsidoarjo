import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rumah_sidoarjo/custom_template.dart';
import 'package:rumah_sidoarjo/home.dart';
import 'package:rumah_sidoarjo/pages/umkm/kerajinan.dart';
import 'package:rumah_sidoarjo/pages/umkm/makanan.dart';
import 'package:rumah_sidoarjo/pages/umkm/pertanian.dart';

class Umkm extends StatefulWidget {
  Umkm({Key? key}) : super(key: key);

  @override
  _UmkmState createState() => _UmkmState();
}

class _UmkmState extends State<Umkm> {
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
      title: Text('UMKM'),
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
            'UMKM',
            style: headerTextStyle,
          ),
          SizedBox(height: 10),
          Center(
            child: Container(
              width: 330,
              child: Text(
                '(Usaha Mikro Kecil Menengah)\n di Kabupaten Sidoarjo',
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
                    Tab(child: Text('KERAJINAN')),
                    Tab(child: Text('MAKANAN')),
                    Tab(child: Text('PERTANIAN')),
                  ]),
              SizedBox(height: 10),
              Container(
                height: 595,
                width: double.infinity,
                child: TabBarView(
                  children: [
                    Kerajinan(),
                    Makanan(),
                    Pertanian(),
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
