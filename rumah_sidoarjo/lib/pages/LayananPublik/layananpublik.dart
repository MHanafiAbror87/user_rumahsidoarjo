import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rumah_sidoarjo/custom_template.dart';
import 'package:rumah_sidoarjo/home.dart';
import 'package:rumah_sidoarjo/models/kategori_layanan_publik.dart';
import 'package:rumah_sidoarjo/pages/LayananPublik/kategori_layanan_publik.dart';
import 'package:rumah_sidoarjo/services/api_layanan_publik.dart';

class LayananPublik extends StatefulWidget {
  static String routeName = "/layanan";

  const LayananPublik({Key? key}) : super(key: key);
  @override
  _LayananPublik createState() => _LayananPublik();
}

class _LayananPublik extends State<LayananPublik> {
  final ApiLayananPublik api = ApiLayananPublik();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: appBar(),
      body: Column(
        children: [
          _headerPage(),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 600,
            child: FutureBuilder<List<KategoriLayananData>>(
                future: api.getKategori(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        final layanan = snapshot.data![index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 2),
                          child: SizedBox(
                            height: 65,
                            child: GestureDetector(
                              onTap: () =>
                                  Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (context) => KategoriLayananPublik(
                                    kategori: layanan,
                                  ),
                                ),
                              ),
                              child: Card(
                                elevation: 4,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        layanan.namaKategori,
                                        style: textKategori,
                                      ),
                                      Image.asset(
                                        'assets/images/arrow_forward.png',
                                        width: 20,
                                        height: 20,
                                      ),
                                    ],
                                  ),
                                ),
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
        ],
      ),
    );
  }

  Widget _headerPage() {
    return Container(
      height: 158,
      decoration: headerDecoration,
      child: Column(
        children: [
          const SizedBox(height: 30),
          Text(
            'Layanan Publik',
            style: headerTextStyle,
          ),
          Center(
            child: SizedBox(
              width: 330,
              child: Text(
                'Ayo cari tau syarat pembuatan dokumen kependudukan',
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
      leading: InkWell(
        child: Icon(
          Icons.arrow_back_ios,
          color: White,
        ),
        onTap: () => {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const Home();
              },
            ),
          ),
        },
      ),
      title: const Text('Layanan Publik'),
      backgroundColor: darkGreen1,
    );
  }
}
