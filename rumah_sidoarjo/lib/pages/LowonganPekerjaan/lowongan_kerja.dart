import 'package:flutter/material.dart';
import 'package:rumah_sidoarjo/custom_template.dart';
import 'package:rumah_sidoarjo/home.dart';
import 'package:rumah_sidoarjo/models/lowongan_pekerjaan.dart';
import 'package:rumah_sidoarjo/pages/LowonganPekerjaan/detail_lowongan_kerja.dart';
import 'package:rumah_sidoarjo/services/api_lowongan_pekerjaan.dart';
import 'package:rumah_sidoarjo/services/apiurl.dart';

class LowonganPekerjaan extends StatefulWidget {
  const LowonganPekerjaan({Key? key}) : super(key: key);

  @override
  State<LowonganPekerjaan> createState() => _LowonganPekerjaanState();
}

class _LowonganPekerjaanState extends State<LowonganPekerjaan> {
  final ApiLowonganPekerjaan api = ApiLowonganPekerjaan();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade300,
        appBar: appBar(),
        body: Column(
          children: [
            _headerPage(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: SizedBox(
                height: 620,
                child: FutureBuilder<List<LowonganPekerjaanData>>(
                    future: api.getLowongan(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            final lowongan = snapshot.data![index];
                            return GestureDetector(
                              onTap: () =>
                                  Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (context) => DetailLowonganPekerjaan(
                                    lowongan: lowongan,
                                  ),
                                ),
                              ),
                              child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25)),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 70,
                                        width: 70,
                                        child: Image.network(
                                          "$fotoUrl/assets/img/${lowongan.foto}",
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
                                                lowongan.namaPerusahaan,
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                lowongan.judulLowongan,
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 2,
                                                style: const TextStyle(
                                                    fontSize: 14),
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
                            );
                          },
                        );
                      }

                      return const Center(child: CircularProgressIndicator());
                    }),
              ),
            ),
          ],
        ));
  }

  Widget _headerPage() {
    return Container(
      height: 158,
      decoration: headerDecoration,
      child: Column(
        children: [
          const SizedBox(height: 30),
          Text(
            'Lowongan Pekerjaan',
            style: headerTextStyle,
          ),
          Center(
            child: SizedBox(
              width: 330,
              child: Text(
                'Ayo cari lowongan pekerjaan yang tersedia di Kabupaten Sidoarjo',
                textAlign: TextAlign.center,
                style: headerSubTextStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      elevation: 0,
      leading: GestureDetector(
        child: Icon(
          Icons.arrow_back_ios,
          color: White,
        ),
        onTap: () => {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) {
                return Home();
              },
            ),
          ),
        },
      ),
      title: const Text('Lowongan Pekerjaan'),
      backgroundColor: darkGreen1,
    );
  }
}
