import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rumah_sidoarjo/custom_template.dart';

class Kuliner extends StatefulWidget {
  @override
  _KulinerState createState() => _KulinerState();
}

class _KulinerState extends State<Kuliner> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          color: darkGreen1,
          child: Center(
            child: Text('Hello'),
          ),
        ),
      ),
    );
  }
}
