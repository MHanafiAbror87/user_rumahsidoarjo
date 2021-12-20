import 'package:flutter/material.dart';
import 'package:rumah_sidoarjo/models/pariwisata.dart';
import 'package:rumah_sidoarjo/models/list_pariwisata.dart';
import 'package:rumah_sidoarjo/services/api_pariwisata.dart';

class DetailPariwisata extends StatefulWidget {
  final PariwisataData wisata;
  DetailPariwisata({required this.wisata});

  @override
  State<DetailPariwisata> createState() => _DetailPariwisataState();
}

class _DetailPariwisataState extends State<DetailPariwisata> {
  final ApiPariwisata api = ApiPariwisata();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.wisata.namaWisata),
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.all(12.0),
            child: FutureBuilder<DetailPariwisataModel>(
                future: api.getPariwisataById(widget.wisata.idWisata),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final detail = snapshot.data;
                  }
                  return Column(
                    children: [
                      Card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 100,
                              color: Colors.red,
                            ),
                            ListTile(
                              title: Text("Title"),
                              subtitle: Text(widget.wisata.pengelola),
                            ),
                            ListTile(
                                title: Text("Title"),
                                subtitle: Text(widget.wisata.noTelepon)),
                            ListTile(
                              title: Text("Body"),
                              subtitle: Text(widget.wisata.jamBuka),
                            ),
                            ListTile(
                              title: Text("User ID"),
                              subtitle: Text(widget.wisata.jamTutup),
                            )
                          ],
                        ),
                      )
                    ],
                  );
                })),
      ),
    );
  }
}
