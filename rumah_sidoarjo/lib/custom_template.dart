import 'dart:ui';

import 'package:flutter/material.dart';
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

final kHintTextStyle = TextStyle(
  color: Color(0xffA6A6A6),
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
