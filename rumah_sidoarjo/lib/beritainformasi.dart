import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rumah_sidoarjo/models/list_berita.dart';
import 'package:rumah_sidoarjo/pages/berita/detail_berita.dart';
import 'package:rumah_sidoarjo/pages/cctv.dart';
import 'package:rumah_sidoarjo/services/api_berita.dart';
import 'custom_template.dart';

class Beritainformasi extends StatefulWidget {
  const Beritainformasi({Key? key}) : super(key: key);

  @override
  BeritaInformasiState createState() => BeritaInformasiState();
}

class BeritaInformasiState extends State<Beritainformasi> {
  final ApiBerita api = ApiBerita();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        leading: TextButton(
          onPressed: () => {
            Navigator.pop(
              context,
            )
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: White,
          ),
        ),
        title: Text('Berita & informasi', style: TextStyle(color: White)),
        backgroundColor: darkGreen1,
      ),
      body: FutureBuilder<List<ListBeritaModel>>(
          future: api.getBerita(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: berita.length,
                itemBuilder: (context, index) {
                  final berita = snapshot.data![index];

                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                    child: GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (contex) {
                            return DetailBerita(berita: berita);
                          },
                        ),
                      ),
                      child: SizedBox(
                        height: 100,
                        child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                children: [
                                  Image.network(
                                    "https://www.sidoarjokab.go.id/${berita.thumb}",
                                    width: 100,
                                    fit: BoxFit.fill,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10),
                                          child: Text(
                                            berita.judul,
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                            style: const TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10),
                                          child: Text(
                                            DateFormat('dd MMMM yyyy')
                                                .format(berita.tgl),
                                            style:
                                                const TextStyle(fontSize: 12),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )),
                      ),
                    ),
                  );
                },
              );
            }
            return const Center(child: CircularProgressIndicator());
          }),
    );
  }
}
