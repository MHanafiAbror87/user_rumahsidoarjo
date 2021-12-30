import 'package:flutter/material.dart';
import 'package:rumah_sidoarjo/custom_template.dart';
import 'package:rumah_sidoarjo/addregister.dart';
import 'package:flutter/services.dart';
import 'package:rumah_sidoarjo/login.dart';
import 'package:getwidget/getwidget.dart';

class Syarat extends StatefulWidget {
  static String routeName = "/syarat";
  @override
  _SyaratState createState() => _SyaratState();
}

class _SyaratState extends State<Syarat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      backgroundColor: White,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Stack(
          children: <Widget>[
            SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(
                horizontal: 40.0,
                vertical: 120.0,
              ),
            ),
            _headerPage(),
            Expanded(
              child: _sk(),
            ),
          ],
        ),
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
          Navigator.pop(
            context,
          ),
        },
      ),
      title: Text('Syarat & Ketentuan'),
      backgroundColor: darkGreen1,
    );
  }

  Widget _headerPage() {
    return Expanded(
      child: Container(
        height: 158,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [lightGreen, darkGreen1],
              end: Alignment.centerRight,
              begin: Alignment.centerLeft),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
        child: Stack(
          children: <Widget>[
            Center(
              child: Column(
                children: [
                  SizedBox(height: 39),
                  Text(
                    'Syarat & Ketentuan',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      letterSpacing: 2,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'DMSans',
                    ),
                  ),
                  Container(
                    width: 330,
                    child: Center(
                      child: Text(
                        'Silahkan membaca syarat & ketentuan secara seksama',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: White,
                          fontFamily: 'DMSans',
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _sk() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(
          top: 170,
          left: 20,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Column(
                  children: [
                    sk1(),
                    _padding(),
                    sk2(),
                    _padding(),
                    sk3(),
                    _padding(),
                    sk4(),
                    _padding(),
                    sk5(),
                    _padding(),
                    sk6(),
                    _padding(),
                    sk1()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row sk6() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '6. ',
          style: TextStyle(fontSize: 18),
        ),
        Container(
          width: 340,
          child: Text(
            'Selamat datang di Platform Rumah Sidoarjo. Rumah Sidoarjo merupakan Aplikasi yang menghubungkan berbagai aplikasi layanan yang telah disediakan oleh pemkab sidoarjo',
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 18),
          ),
        ),
      ],
    );
  }

  Row sk5() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '5. ',
          style: TextStyle(fontSize: 18),
        ),
        Container(
          width: 340,
          child: Text(
            'Selamat datang di Platform Rumah Sidoarjo. Rumah Sidoarjo merupakan Aplikasi yang menghubungkan berbagai aplikasi layanan yang telah disediakan oleh pemkab sidoarjo',
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 18),
          ),
        ),
      ],
    );
  }

  Row sk4() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '4. ',
          style: TextStyle(fontSize: 18),
        ),
        Container(
          width: 340,
          child: Text(
            'Selamat datang di Platform Rumah Sidoarjo. Rumah Sidoarjo merupakan Aplikasi yang menghubungkan berbagai aplikasi layanan yang telah disediakan oleh pemkab sidoarjo',
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 18),
          ),
        ),
      ],
    );
  }

  Row sk3() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '3. ',
          style: TextStyle(fontSize: 18),
        ),
        Container(
          width: 340,
          child: Text(
            'Selamat datang di Platform Rumah Sidoarjo. Rumah Sidoarjo merupakan Aplikasi yang menghubungkan berbagai aplikasi layanan yang telah disediakan oleh pemkab sidoarjo',
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 18),
          ),
        ),
      ],
    );
  }

  Row sk2() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '2. ',
          style: TextStyle(fontSize: 18),
        ),
        Container(
          width: 340,
          child: Text(
            'Selamat datang di Platform Rumah Sidoarjo. Rumah Sidoarjo merupakan Aplikasi yang menghubungkan berbagai aplikasi layanan yang telah disediakan oleh pemkab sidoarjo',
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 18),
          ),
        ),
      ],
    );
  }

  Padding _padding() => Padding(padding: EdgeInsets.symmetric(vertical: 5));

  Row sk1() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '1. ',
          style: TextStyle(fontSize: 18),
        ),
        Container(
          width: 340,
          child: Text(
            'Selamat datang di Platform Rumah Sidoarjo. Rumah Sidoarjo merupakan Aplikasi yang menghubungkan berbagai aplikasi layanan yang telah disediakan oleh pemkab sidoarjo',
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 18),
          ),
        ),
      ],
    );
  }
}
