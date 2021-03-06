// ignore_for_file: non_constant_identifier_names

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';

// kode warna hex
Color darkGreen = const Color(0XFF019A4B);
Color darkGreen1 = const Color(0XFF22AC44);
Color lightGreen = const Color(0XFF7ED957);
Color darkOrange = const Color(0XFFFF914D);
Color lightGrey = const Color(0XFFA6A6A6);
Color darkGrey = const Color(0XFF4D4C4C);
Color bgColor = const Color(0xffe7e7e7);
Color White = const Color(0XFFFFFFFF);
Color red = const Color(0XFFDE0404);
Color Black = const Color(0XFF000000);

final kHintTextStyle = GoogleFonts.dmSans(
  color: lightGrey,
);

final kLabelStyle = GoogleFonts.dmSans(
  color: darkGrey,
  fontWeight: FontWeight.bold,
);

final kBoxDecorationStyle = BoxDecoration(
  color: White,
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: const [
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
  borderRadius: const BorderRadius.only(
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

final iconText = GoogleFonts.bebasNeue(
    fontSize: 14, color: const Color(0xff626262), letterSpacing: 1);

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
  fontSize: 14,
  fontWeight: FontWeight.bold,
);

final textSubKategori = GoogleFonts.dmSans(
  fontSize: 12,
  color: const Color(0xffc4c4c4),
);

//font Tagihan
final textTagihan = GoogleFonts.poppins(
  fontSize: 14,
  fontWeight: FontWeight.bold,
);
