import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rumah_sidoarjo/custom_template.dart';
import 'package:rumah_sidoarjo/home.dart';
import 'package:rumah_sidoarjo/pages/pendidikan/sd.dart';
import 'package:rumah_sidoarjo/pages/pendidikan/slb.dart';
import 'package:rumah_sidoarjo/pages/pendidikan/smp.dart';

class Pendidikan extends StatefulWidget {
  const Pendidikan({Key? key}) : super(key: key);

  @override
  _PendidikanState createState() => _PendidikanState();
}

class _PendidikanState extends State<Pendidikan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: appBar(),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Stack(
          children: <Widget>[
            const SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(
                horizontal: 40.0,
                // vertical: 120.0,
              ),
            ),
            _headerPage(),
            const TabCon(),
          ],
        ),
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
      title: const Text('Pendidikan'),
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
            'Data Sekolah',
            style: headerTextStyle,
          ),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: SizedBox(
              width: 330,
              child: Text(
                'Informasi Sekolah di Seluruh Kabupaten Sidoarjo',
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
                  unselectedLabelStyle: const TextStyle(fontSize: 14),
                  tabs: const [
                    Tab(child: Text('SD')),
                    Tab(child: Text('SLB')),
                    Tab(child: Text('SMP')),
                  ]),
              const SizedBox(height: 10),
              SizedBox(
                height: 570,
                width: double.infinity,
                child: TabBarView(
                  children: [
                    SD(),
                    SLB(),
                    SMP(),
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
