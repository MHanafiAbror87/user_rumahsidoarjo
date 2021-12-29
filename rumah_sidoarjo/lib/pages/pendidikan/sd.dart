import 'package:flutter/material.dart';
import 'package:rumah_sidoarjo/models/list_sekolah.dart';
import 'package:rumah_sidoarjo/pages/pendidikan/detail_sd.dart';
import 'package:rumah_sidoarjo/services/api_pendidikan.dart';
import 'package:rumah_sidoarjo/services/apiurl.dart';

class SD extends StatelessWidget {
  final ApiSekolah api = ApiSekolah();

  SD({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: FutureBuilder<List<SekolahData>>(
        future: api.getSekolah(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            List<SekolahData> sekolah = snapshot.data;
            return ListView(
              children: sekolah
                  .map(
                    (sd) => GestureDetector(
                      onTap: () => Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => Detail_Sd(
                            sekolah: sd,
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
                                  "$fotoUrl/assets/img/${sd.foto}",
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 20.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        sd.namaSekolah,
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
                                        sd.alamat,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        style: const TextStyle(fontSize: 14),
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
        },
      ),
    );
  }
}
