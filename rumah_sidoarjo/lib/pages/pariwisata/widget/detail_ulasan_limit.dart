import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:rumah_sidoarjo/custom_template.dart';
import 'package:rumah_sidoarjo/models/pariwisata.dart';
import 'package:rumah_sidoarjo/services/apiurl.dart';

class DetailUlasanWisataLimit extends StatefulWidget {
  DetailUlasanWisataLimit({Key? key, required this.pemancingan})
      : super(key: key);
  Ulasan pemancingan;

  @override
  _DetailUlasanWisataLimitState createState() =>
      _DetailUlasanWisataLimitState();
}

class _DetailUlasanWisataLimitState extends State<DetailUlasanWisataLimit> {
  List<String> images = [];

  @override
  void initState() {
    if (widget.pemancingan.foto1.isNotEmpty) {
      images.add(widget.pemancingan.foto1);
    }
    if (widget.pemancingan.foto2.isNotEmpty) {
      images.add(widget.pemancingan.foto2);
    }
    if (widget.pemancingan.foto3.isNotEmpty) {
      images.add(widget.pemancingan.foto3);
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
              ClipOval(
                child: SizedBox(
                    width: 50,
                    height: 50,
                    child: Image.network(
                      "$fotoUrl/assets/img/${widget.pemancingan.fotoProfil}",
                      fit: BoxFit.cover,
                    )),
              ),
              const Padding(padding: EdgeInsets.only(left: 20)),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      widget.pemancingan.nama,
                      style: GoogleFonts.dmSans(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      DateFormat('dd MMMM yyyy')
                          .format(widget.pemancingan.tanggalUpload),
                      style: GoogleFonts.dmSans(fontSize: 14, color: darkGrey),
                    ),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 20),
          Text(
            widget.pemancingan.ulasan,
            style: GoogleFonts.dmSans(fontSize: 14),
          ),
          Container(
            height: 1.5,
            width: double.infinity,
            color: Black,
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: images
                .map((image) => GestureDetector(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) => Dialog(
                                  child: SizedBox(
                                    width: 500,
                                    child: Image.network(
                                      "$fotoUrl/assets/img/$image",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ));
                      },
                      child: SizedBox(
                          width: 50,
                          height: 50,
                          child: Image.network(
                            "$fotoUrl/assets/img/$image",
                            fit: BoxFit.cover,
                          )),
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}
