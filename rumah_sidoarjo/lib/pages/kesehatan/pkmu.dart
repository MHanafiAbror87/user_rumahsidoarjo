import 'package:flutter/material.dart';
import 'package:rumah_sidoarjo/models/kesehatan.dart';
import 'package:rumah_sidoarjo/pages/kesehatan/detail_kesehatan.dart';
import 'package:rumah_sidoarjo/services/api_kesehatan.dart';
import 'package:rumah_sidoarjo/services/apiurl.dart';

class Pkmu extends StatelessWidget {
  final ApiKesehatan api = ApiKesehatan();

  Pkmu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: FutureBuilder<List<KesehatanData>>(
            future: api.getKesehatan(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                List<KesehatanData> kesehatan = snapshot.data;
                return ListView(
                  children: kesehatan
                      .map(
                        (pkmu) => GestureDetector(
                          onTap: () => Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => DetailKesehatanPkmu(
                                kesehatan: pkmu,
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
                                      "$fotoUrl/assets/img/${pkmu.foto}",
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
                                            pkmu.nama,
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
                                            pkmu.alamat,
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
                return const Center(child: CircularProgressIndicator());
              }
            }));
  }
}
