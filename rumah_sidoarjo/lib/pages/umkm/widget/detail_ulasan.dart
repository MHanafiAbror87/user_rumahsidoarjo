import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rumah_sidoarjo/custom_template.dart';
import 'package:rumah_sidoarjo/models/list_ulasan_umkm.dart';
import 'package:rumah_sidoarjo/models/umkm.dart';
import 'package:rumah_sidoarjo/services/api_umkm.dart';
import 'package:rumah_sidoarjo/services/apiurl.dart';
import 'package:path/path.dart' as pt;

class Detail_Ulasan_Umkm extends StatefulWidget {
  Detail_Ulasan_Umkm({Key? key, required this.kerajinan}) : super(key: key);
  UlasanDataUmkm kerajinan;

  @override
  _Detail_Ulasan_UmkmState createState() => _Detail_Ulasan_UmkmState();
}

class _Detail_Ulasan_UmkmState extends State<Detail_Ulasan_Umkm> {
  List<String> images = [];

  @override
  void initState() {
    if (widget.kerajinan.foto1.isNotEmpty) {
      images.add(widget.kerajinan.foto1);
    }
    if (widget.kerajinan.foto2.isNotEmpty) {
      images.add(widget.kerajinan.foto2);
    }
    if (widget.kerajinan.foto3.isNotEmpty) {
      images.add(widget.kerajinan.foto3);
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              SizedBox(
                  width: 50,
                  height: 50,
                  child: Image.network(
                      "$fotoUrl/assets/img/${widget.kerajinan.fotoProfil}")),
              const Padding(padding: EdgeInsets.only(left: 20)),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    widget.kerajinan.nama,
                    style: GoogleFonts.dmSans(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    DateFormat('dd MMMM yyyy')
                        .format(widget.kerajinan.tanggalUpload),
                    style: GoogleFonts.dmSans(fontSize: 14, color: darkGrey),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(height: 20),
          Text(
            widget.kerajinan.ulasan,
            style:
                GoogleFonts.dmSans(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          Container(
            height: 1.5,
            width: double.infinity,
            color: Black,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: images
                .map((image) => GestureDetector(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) => Dialog(
                                  child: Image.network(
                                      "$fotoUrl/assets/img/$image"),
                                ));
                      },
                      child: SizedBox(
                          width: 50,
                          height: 50,
                          child: Image.network("$fotoUrl/assets/img/$image")),
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}
