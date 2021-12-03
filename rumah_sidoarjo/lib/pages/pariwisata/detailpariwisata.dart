import 'package:flutter/material.dart';
import 'package:rumah_sidoarjo/services/Pariwisata.dart';
import 'package:rumah_sidoarjo/models/pariwisata.dart';

class DetailPariwisata extends StatelessWidget {
  final Pariwisata wisata;
  DetailPariwisata({required this.wisata});

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(wisata.nama_wisata),
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.all(12.0),
            child: Column(
              children: [
                Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ListTile(
                        title: Text("Title"),
                        subtitle: Text(wisata.pengelola),
                      ),
                      ListTile(
                        title: Text("Body"),
                        subtitle: Text(wisata.jam_buka),
                      ),
                      ListTile(
                        title: Text("User ID"),
                        subtitle: Text(wisata.jam_tutup),
                      )
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }
}
