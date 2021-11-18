import 'package:flutter/material.dart';
import 'package:rumah_sidoarjo/custom_template.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rumah_sidoarjo/home.dart';

class MediaMassa extends StatefulWidget {
  const MediaMassa({Key? key}) : super(key: key);

  @override
  _MediaMassaState createState() => _MediaMassaState();
}

class _MediaMassaState extends State<MediaMassa> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: appBar(),
        body: Column(
          children: [
            _headerPage(),
            SizedBox(height: 60),
            playRadio(),
          ],
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
      title: Text('Media Massa'),
      backgroundColor: darkGreen1,
    );
  }

  Widget _headerPage() {
    return Container(
      height: 158,
      width: double.infinity,
      decoration: headerDecoration,
      child: Column(
        children: [
          SizedBox(height: 50),
          Text(
            'Radio Suara Sidoarjo',
            style: headerTextStyle,
          ),
        ],
      ),
    );
  }

  Widget playRadio() {
    return Container(
      width: 380,
      height: 100,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [lightGreen, darkGreen1],
              end: Alignment.centerRight,
              begin: Alignment.centerLeft),
          color: darkGreen,
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Row(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 13, left: 13),
                child: Text("Ex-100.8 MHz"),
              ),
              SizedBox(
                height: 1,
              ),
              Row(
                children: [
                  Padding(padding: EdgeInsets.only(left: 40)),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.skip_previous_outlined,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.play_arrow),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.skip_next_outlined,
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(left: 30)),
                ],
              ),
            ],
          ),
          Container(
            height: 100,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: White,
                  width: 5,
                )),
            child: Image.asset(
              'assets/images/radio.png',
              width: 90,
            ),
          ),
        ],
      ),
    );
  }
}
