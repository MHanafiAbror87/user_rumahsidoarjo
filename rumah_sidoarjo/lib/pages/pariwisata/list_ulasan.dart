import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rumah_sidoarjo/models/list_ulasan.dart';
import 'package:rumah_sidoarjo/models/pariwisata.dart';
import 'package:rumah_sidoarjo/pages/pariwisata/pariwisata.dart' as wisata;
import 'package:rumah_sidoarjo/pages/pariwisata/widget/detail_ulasan.dart';
import 'package:rumah_sidoarjo/services/api_pariwisata.dart';
import 'package:rumah_sidoarjo/services/apiurl.dart';

import '../../custom_template.dart';

class ListUlasan extends StatefulWidget {
  final Pariwisata pariwisata;
  ListUlasan({required this.pariwisata});

  @override
  State<ListUlasan> createState() => _ListUlasanState();
}

class _ListUlasanState extends State<ListUlasan> {
  final ApiPariwisata api = ApiPariwisata();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      // backgroundColor: Colors.transparent,
      body: FutureBuilder<List<UlasanData>>(
        future: api.getUlasan(widget.pariwisata.idWisata),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            List<UlasanData> ulasan = snapshot.data;
            return ListView(
              children: ulasan
                  .map(
                    (list) => Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 2),
                      child: SizedBox(
                        height: 130,
                        child: GestureDetector(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) => Detail_Ulasan_Wisata(
                                      pemancingan: list,
                                    ));
                          },
                          child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        ClipOval(
                                          child: SizedBox(
                                              width: 50,
                                              height: 50,
                                              child: Image.network(
                                                "$fotoUrl/assets/img/${list.fotoProfil}",
                                                fit: BoxFit.cover,
                                              )),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                list.nama,
                                                style: const TextStyle(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(
                                                DateFormat('dd MMMM yyyy')
                                                    .format(list.tanggalUpload),
                                                style: const TextStyle(
                                                    fontSize: 12,
                                                    fontFamily: "DMSans"),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      list.ulasan,
                                      maxLines: 2,
                                      style: const TextStyle(
                                          fontSize: 14, fontFamily: "DMSans"),
                                    )
                                  ],
                                ),
                              )),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      elevation: 0,
      leading: TextButton(
        child: Icon(
          Icons.arrow_back_ios,
          color: White,
        ),
        onPressed: () => {
          Navigator.pop(context),
        },
      ),
      title: const Text('Ulasan Pariwisata'),
      backgroundColor: darkGreen1,
    );
  }
}
