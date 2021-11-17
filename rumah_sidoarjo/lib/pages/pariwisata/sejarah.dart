import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rumah_sidoarjo/custom_template.dart';

class Sejarah extends StatefulWidget {
  @override
  _SejarahState createState() => _SejarahState();
}

class _SejarahState extends State<Sejarah> {
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
