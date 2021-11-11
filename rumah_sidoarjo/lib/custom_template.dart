import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';

// kode warna hex
Color darkGreen = Color(0XFF019A4B);
Color darkGreen1 = Color(0XFF22AC44);
Color lightGreen = Color(0XFF7ED957);
Color darkOrange = Color(0XFFFF914D);
Color lightGrey = Color(0XFFA6A6A6);
Color darkGrey = Color(0XFF4D4C4C);
Color White = Color(0XFFFFFFFF);
Color red = Color(0XFFDE0404);
Color Black = Color(0XFF000000);

final kHintTextStyle = TextStyle(
  color: lightGrey,
  fontFamily: 'DMSans',
);

final kLabelStyle = TextStyle(
  color: darkGrey,
  fontWeight: FontWeight.bold,
  fontFamily: 'DMSans',
);

final kBoxDecorationStyle = BoxDecoration(
  color: White,
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 4.0,
      offset: Offset(0, 2),
    ),
  ],
);

final headerDecoration = BoxDecoration(
  gradient: LinearGradient(
      colors: [lightGreen, darkGreen1],
      end: Alignment.centerRight,
      begin: Alignment.centerLeft),
  borderRadius: BorderRadius.only(
    bottomLeft: Radius.circular(30),
    bottomRight: Radius.circular(30),
  ),
);

final headerTextStyle = GoogleFonts.dmSans(
  color: White,
  fontSize: 28,
  letterSpacing: 2,
  fontWeight: FontWeight.bold,
);

final headerSubTextStyle = GoogleFonts.dmSans(
  color: White,
  fontSize: 17,
);

final uploadText = GoogleFonts.dmSans(
  fontSize: 16,
  color: darkGrey,
);

//custom text panik menu dan pengaduan

final judulTextStyle = GoogleFonts.poppins(
  color: Black,
  fontSize: 16,
  fontWeight: FontWeight.bold,
);

final subjudulTextStyle = GoogleFonts.dmSans(
  color: lightGrey,
  fontSize: 14,
);

final textKategori = GoogleFonts.poppins(
  fontSize: 12,
  fontWeight: FontWeight.bold,
);

final textSubKategori = GoogleFonts.dmSans(
  fontSize: 12,
);
