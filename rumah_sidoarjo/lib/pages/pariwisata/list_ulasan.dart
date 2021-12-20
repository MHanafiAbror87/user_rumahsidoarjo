import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rumah_sidoarjo/models/list_ulasan.dart';
import 'package:rumah_sidoarjo/models/pariwisata.dart';
import 'package:rumah_sidoarjo/services/api_pariwisata.dart';
import 'package:rumah_sidoarjo/services/apiurl.dart';

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
        backgroundColor: Colors.transparent,
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
                          child: Container(
                            height: 130,
                            child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                              width: 50,
                                              height: 50,
                                              child: Image.network(
                                                  "$fotoUrl/assets/img/${list.fotoProfil}")),
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
                                                      .format(
                                                          list.tanggalUpload),
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontFamily: "DMSans"),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(height: 10),
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
                      )
                      .toList(),
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            }));
  }
}
