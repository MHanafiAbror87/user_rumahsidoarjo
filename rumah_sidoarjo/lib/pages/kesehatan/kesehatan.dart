import 'package:flutter/material.dart';
import 'package:rumah_sidoarjo/custom_template.dart';
import 'package:rumah_sidoarjo/home.dart';
import 'package:rumah_sidoarjo/pages/kesehatan/pkmp.dart';
import 'package:rumah_sidoarjo/pages/kesehatan/pkmu.dart';
import 'package:rumah_sidoarjo/pages/kesehatan/rsu.dart';

class Kesehatan extends StatefulWidget {
  const Kesehatan({Key? key}) : super(key: key);

  @override
  _KesehatanState createState() => _KesehatanState();
}

class _KesehatanState extends State<Kesehatan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: appBar(),
      body: Column(
        children: <Widget>[
          _headerPage(),
          const TapCon(),
        ],
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      leading: InkWell(
        child: Icon(
          Icons.arrow_back_ios,
          color: White,
        ),
        onTap: () => {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const Home();
              },
            ),
          ),
        },
      ),
      title: const Text('Kesehatan'),
      backgroundColor: darkGreen1,
    );
  }

  Widget _headerPage() {
    return Container(
      height: 158,
      decoration: headerDecoration,
      child: Column(
        children: [
          const SizedBox(height: 30),
          Text(
            'Layanan Kesehatan',
            style: headerTextStyle,
          ),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: SizedBox(
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

class TapCon extends StatelessWidget {
  const TapCon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
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
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                unselectedLabelColor: darkGrey,
                unselectedLabelStyle: const TextStyle(fontSize: 14),
                tabs: const [
                  Tab(child: Text('PKM Utama')),
                  Tab(
                      child: Text(
                    'PKM Pembantu',
                    textAlign: TextAlign.center,
                  )),
                  Tab(child: Text('Rumah Sakit')),
                ]),
            const SizedBox(height: 10),
            SizedBox(
              height: 540,
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
    );
  }
}
