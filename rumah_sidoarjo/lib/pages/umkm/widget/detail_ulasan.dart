import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:rumah_sidoarjo/custom_template.dart';
import 'package:rumah_sidoarjo/models/list_ulasan_umkm.dart';
import 'package:rumah_sidoarjo/services/apiurl.dart';

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
              ClipOval(
                child: SizedBox(
                    width: 50,
                    height: 50,
                    child: Image.network(
                        "$fotoUrl/assets/img/${widget.kerajinan.fotoProfil}",
                        fit: BoxFit.cover)),
              ),
              const Padding(padding: EdgeInsets.only(left: 20)),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.kerajinan.nama,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: GoogleFonts.dmSans(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      DateFormat('dd MMMM yyyy')
                          .format(widget.kerajinan.tanggalUpload),
                      style: GoogleFonts.dmSans(fontSize: 14, color: darkGrey),
                    ),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 20),
          Text(
            widget.kerajinan.ulasan,
            style: GoogleFonts.dmSans(fontSize: 14),
          ),
          const SizedBox(height: 5),
          Container(
            height: 1.5,
            width: double.infinity,
            color: Black,
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: images
                .map(
                  (image) => GestureDetector(
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
                        ),
                      );
                    },
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: Image.network(
                        "$fotoUrl/assets/img/$image",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
