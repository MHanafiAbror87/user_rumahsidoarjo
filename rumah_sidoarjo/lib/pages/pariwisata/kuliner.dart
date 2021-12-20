import 'package:flutter/material.dart';
import 'package:rumah_sidoarjo/pages/pariwisata/detail_kuliner.dart';
import 'package:rumah_sidoarjo/models/list_pariwisata.dart';
import 'package:rumah_sidoarjo/services/api_pariwisata.dart';
import 'package:rumah_sidoarjo/services/apiurl.dart';

class Kuliner extends StatelessWidget {
  final ApiPariwisata api = ApiPariwisata();

  Kuliner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: FutureBuilder<List<PariwisataData>>(
        future: api.getKuliner(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            List<PariwisataData> pariwisata = snapshot.data;
            return ListView(
              children: pariwisata
                  .map(
                    (wisata) => Column(
                      children: [
                        Image.network(
                          "$fotoUrl/assets/img/${wisata.foto1}",
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                        ListTile(
                          title: Text(wisata.namaWisata),
                          subtitle: Text(wisata.alamat),
                          onTap: () => Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => Detail_Kuliner(
                                wisata: wisata,
                              ),
                            ),
                          ),
                        ),
                      ],
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
