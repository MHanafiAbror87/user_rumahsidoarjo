import 'package:flutter/material.dart';
import 'package:rumah_sidoarjo/models/list_umkm.dart';
import 'package:rumah_sidoarjo/pages/umkm/detail_kerajinan.dart';
import 'package:rumah_sidoarjo/services/api_umkm.dart';
import 'package:rumah_sidoarjo/services/apiurl.dart';

class Kerajinan extends StatelessWidget {
  final ApiUmkm api = ApiUmkm();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: FutureBuilder<List<UmkmData>>(
            future: api.getUmkm(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                List<UmkmData> umkm = snapshot.data;
                return ListView(
                  children: umkm
                      .map(
                        (kerajinan) => GestureDetector(
                          onTap: () => Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => DetailUmkm_Kerajinan(
                                kerajinan: kerajinan,
                              ),
                            ),
                          ),
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
                                      "$fotoUrl/assets/img/${kerajinan.foto1}",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(left: 20.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            kerajinan.nama,
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                            style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            kerajinan.alamat,
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                            style:
                                                const TextStyle(fontSize: 14),
                                            textAlign: TextAlign.left,
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }));
  }
}
