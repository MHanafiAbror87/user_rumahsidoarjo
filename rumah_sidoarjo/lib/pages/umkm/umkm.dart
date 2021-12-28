import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
    return Scaffold(
      backgroundColor: bgColor,
      appBar: appBar(),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              _headerPage(),
              const TabCon(),
            ],
          ),
        ),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      leading: TextButton(
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
      title: const Text('UMKM'),
      backgroundColor: darkGreen1,
    );
  }

  Widget _headerPage() {
    return Container(
      height: 158,
      decoration: headerDecoration,
      child: Column(
        children: [
          Text(
            'UMKM',
            style: headerTextStyle,
          ),
          Expanded(
            child: Center(
              child: Text(
                '(Usaha Mikro Kecil Menengah) \n di Kabupaten Sidoarjo',
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

class TabCon extends StatelessWidget {
  const TabCon({
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
                  labelStyle: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 14),
                  unselectedLabelColor: darkGrey,
                  unselectedLabelStyle: TextStyle(fontSize: 14),
                  tabs: const [
                    Tab(child: Text('KERAJINAN')),
                    Tab(child: Text('MAKANAN')),
                    Tab(child: Text('PERTANIAN')),
                  ]),
              SizedBox(height: 10),
              SizedBox(
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
