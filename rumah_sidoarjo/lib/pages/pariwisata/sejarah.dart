import 'package:flutter/material.dart';
import 'package:rumah_sidoarjo/models/list_pariwisata.dart';
import 'package:rumah_sidoarjo/pages/pariwisata/detail_sejarah.dart';
import 'package:rumah_sidoarjo/services/api_pariwisata.dart';
import 'package:rumah_sidoarjo/services/apiurl.dart';

class Sejarah extends StatelessWidget {
  final ApiPariwisata api = ApiPariwisata();

  Sejarah({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: FutureBuilder<List<PariwisataData>>(
        future: api.getSejarah(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            List<PariwisataData> pariwisata = snapshot.data;
            return ListView(
              children: pariwisata
                  .map(
                    (wisata) => GestureDetector(
                      onTap: () => Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => Detail_Sejarah(
                            wisata: wisata,
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 2),
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 70,
                                  width: 70,
                                  child: Image.network(
                                    "$fotoUrl/assets/img/${wisata.foto1}",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 270,
                                        child: Text(
                                          wisata.namaWisata,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      SizedBox(
                                        width: 270,
                                        child: Text(
                                          wisata.alamat,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                          style: const TextStyle(fontSize: 14),
                                          textAlign: TextAlign.left,
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
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
}
